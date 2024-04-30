import 'dart:developer';
import 'dart:typed_data';

import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/core/beer_and_games/errors/local_failure.dart';
import 'package:beer_and_games/core/extentions/either_extensions.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/cloud_image_storage_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/games_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/local_image_storage_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/models/game_model.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/game.dart';
import 'package:beer_and_games/features/beer_and_games/domain/repositories/game_repository.dart';
import 'package:dartz/dartz.dart';

class GameRepositoryImpl extends GameRepository {
  final GameAPI gameAPI;
  final CloudImageStorageAPI cloudImageStorageAPI;
  final LocalImageStorageAPI localImageStorageAPI;

  GameRepositoryImpl({
    required this.gameAPI,
    required this.cloudImageStorageAPI,
    required this.localImageStorageAPI,
  });

  @override
  Stream<Either<Failure, List<Game>>> select() async* {
    final foGames = await gameAPI.getGames();

    if (foGames.isLeft()) {
      yield Left(foGames.left);
      return;
    }
    final gameModels = foGames.right;
    final games = gameModels
        .map(
          (e) => Game(
            id: e.id,
            name: e.name,
            minplayers: e.minPlayers,
            maxplayers: e.maxPlayers,
            onlyMinMaxPlayers: e.onlyMinMaxPlayers,
          ),
        )
        .toList();

    yield Right(games);

    final gamesModelsWithImage =
        gameModels.where((element) => element.imageUrl != null);
    final gamesWithImage = games
        .where((element) =>
            gamesModelsWithImage.any((model) => element.name == model.name))
        .toList();
    for (final currentGame in gamesWithImage) {
      final foImage = await _getImageBytes(
        gameId: currentGame.id,
        gameName: currentGame.name,
        gameModels: gameModels,
      );
      yield foImage.fold(
        (l) => Left(l),
        (r) {
          currentGame.imageBytes = r;
          return Right(games);
        },
      );
    }
  }

  Future<Either<Failure, Uint8List>> _getImageBytes({
    required String gameId,
    required String gameName,
    required List<GameModel> gameModels,
  }) async {
    final imagePath = _getImagePath(
      gameId: gameId,
      gameModels: gameModels,
    );
    final foLocalImage = await localImageStorageAPI.downloadImage(imagePath);
    final isError = foLocalImage.isLeft() && foLocalImage.left is! FileNotFound;
    if (isError) return Left(foLocalImage.left);

    if (foLocalImage.isLeft()) {
      final foBytes = await cloudImageStorageAPI.downloadImage(imagePath);
      if (foBytes.isLeft()) return Left(foBytes.left);

      final bytes = foBytes.right;

      final foWrite = await localImageStorageAPI.writeImage(imagePath, bytes);
      if (foWrite.isLeft()) {
        log(
          'Error writing image to local storage (${foWrite.left.toString()})',
          name: 'GameRepositoryImpl',
        );
        return Left(foWrite.left);
      }

      log(
        'Image $gameName downloaded from cloud',
        name: 'GameRepositoryImpl',
      );
      return Right(bytes);
    } else {
      log(
        'Image $gameName loaded from local storage',
        name: 'GameRepositoryImpl',
      );
      return Right(foLocalImage.right);
    }
  }

  String _getImagePath({
    required String gameId,
    required List<GameModel> gameModels,
  }) =>
      gameModels.firstWhere((element) => element.id == gameId).imageUrl!;
}
