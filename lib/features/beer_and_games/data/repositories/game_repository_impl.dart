import 'dart:developer';
import 'dart:typed_data';

import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/core/extentions/either_extensions.dart';
import 'package:beer_and_games/core/mixin/image_item_entity_model_getter.dart';
import 'package:beer_and_games/core/mixin/image_selector_api_helper.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/cloud_image_storage_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/game_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/local_image_storage_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/models/game_model.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/game.dart';
import 'package:beer_and_games/features/beer_and_games/domain/repositories/game_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:crypto/crypto.dart' as crypto;

class GameRepositoryImpl extends GameRepository
    with ImageSelectorApiHelper, ImageItemEntityModelGetter<GameModel> {
  final GameAPI gameAPI;
  final CloudImageStorageAPI cloudImageStorageAPI;
  final LocalImageStorageAPI localImageStorageAPI;

  GameRepositoryImpl({
    required this.gameAPI,
    required this.cloudImageStorageAPI,
    required this.localImageStorageAPI,
  });

  @override
  Future<Either<CloudFailure, void>> insert({
    required String name,
    required List<int>? imageBytes,
    required int minPlayers,
    required int maxPlayers,
    required bool onlyMinMaxPlayers,
  }) async {
    final foInsert = await gameAPI.insert(
      name: name,
      minPlayers: minPlayers,
      maxPlayers: maxPlayers,
      onlyMinMax: onlyMinMaxPlayers,
    );
    if (foInsert.isLeft()) return foInsert;

    if (imageBytes == null) return const Right(null);

    final id = foInsert.right;
    final path = '/cespuglio/games/$id.png';
    final hash = crypto.md5.convert(imageBytes).toString();

    final foCloudUpload = await cloudImageStorageAPI.uploadImage(
      path,
      Uint8List.fromList(imageBytes),
    );
    if (foCloudUpload.isLeft()) log(foCloudUpload.left.toString());

    final foLocalUpload = await localImageStorageAPI.uploadImage(
      path,
      Uint8List.fromList(imageBytes),
    );
    if (foLocalUpload.isLeft()) log(foLocalUpload.left.toString());

    final foUpdate = await gameAPI.updateInfo(
      beerId: id,
      name: name,
      imagePath: path,
      imageHash: hash,
      minPlayers: minPlayers,
      maxPlayers: maxPlayers,
      onlyMinMax: onlyMinMaxPlayers,
    );

    return foUpdate.fold(
      (l) {
        if (l is NotFound) return const Right(null);

        return Left(l);
      },
      (r) => const Right(null),
    );
  }

  @override
  Stream<Either<Failure, List<Game>>> select() async* {
    final foGamesStream = gameAPI.getGames();

    await for (final foGames in foGamesStream) {
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
              minPlayers: e.minPlayers,
              maxPlayers: e.maxPlayers,
              onlyMinMaxPlayers: e.onlyMinMaxPlayers,
              timesPlayed: e.timesPlayed,
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
        final gameModel = searchModel(
          id: currentGame.id,
          models: gameModels,
        );

        final foImage = await getImageBytes(
          id: currentGame.id,
          name: currentGame.name,
          imagePath: gameModel.imageUrl!,
          cloudHash: gameModel.imageHash!,
          localImageStorageAPI: localImageStorageAPI,
          cloudImageStorageAPI: cloudImageStorageAPI,
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
  }

  @override
  Future<Either<CloudFailure, void>> markAddPlayed({
    required String gameId,
  }) async {
    final foResult = await gameAPI.markAddPlayed(gameId: gameId);
    return foResult;
  }

  @override
  Future<Either<CloudFailure, void>> markRemovePlayed({
    required String gameId,
  }) async {
    final foResult = await gameAPI.markRemovePlayed(gameId: gameId);
    return foResult;
  }

  @override
  Future<Either<CloudFailure, void>> updateInfo({required Game game}) async {
    final path = '/cespuglio/games/${game.id}.png';
    final hash = game.imageBytes == null || game.imageBytes!.isEmpty
        ? null
        : crypto.md5.convert(game.imageBytes!).toString();

    if (hash == null) {
      final foCloudDelete = await cloudImageStorageAPI.deleteImage(path);
      if (foCloudDelete.isLeft()) log(foCloudDelete.left.toString());

      final foLocalDelete = await localImageStorageAPI.deleteImage(path);
      if (foLocalDelete.isLeft()) log(foLocalDelete.left.toString());
    } else {
      final foCloudUpdate = await cloudImageStorageAPI.uploadImage(
        path,
        Uint8List.fromList(game.imageBytes!),
      );
      if (foCloudUpdate.isLeft()) log(foCloudUpdate.left.toString());

      final foLocalUpdate = await localImageStorageAPI.uploadImage(
        path,
        Uint8List.fromList(game.imageBytes!),
      );
      if (foLocalUpdate.isLeft()) log(foLocalUpdate.left.toString());
    }

    return await gameAPI.updateInfo(
      beerId: game.id,
      name: game.name,
      imagePath: path,
      imageHash: hash,
      minPlayers: game.minPlayers,
      maxPlayers: game.maxPlayers,
      onlyMinMax: game.onlyMinMaxPlayers,
    );
  }

  @override
  Future<Either<CloudFailure, void>> delete({required Game game}) async {
    final path = '/cespuglio/games/${game.id}.png';
    final hasImage = game.imageBytes != null;

    if (hasImage) {
      final foCloudDelete = await cloudImageStorageAPI.deleteImage(path);
      if (foCloudDelete.isLeft()) log(foCloudDelete.left.toString());

      final foLocalDelete = await localImageStorageAPI.deleteImage(path);
      if (foLocalDelete.isLeft()) log(foLocalDelete.left.toString());
    }

    return await gameAPI.delete(gameId: game.id);
  }
}
