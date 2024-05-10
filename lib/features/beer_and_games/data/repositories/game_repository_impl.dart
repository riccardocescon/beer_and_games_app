import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/core/extentions/either_extensions.dart';
import 'package:beer_and_games/core/mixin/image_selector_api_helper.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/cloud_image_storage_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/game_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/local_image_storage_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/models/game_model.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/game.dart';
import 'package:beer_and_games/features/beer_and_games/domain/repositories/game_repository.dart';
import 'package:dartz/dartz.dart';

class GameRepositoryImpl extends GameRepository with ImageSelectorApiHelper {
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
      final imagePath = _getImagePath(
        gameId: currentGame.id,
        gameModels: gameModels,
      );

      final foImage = await getImageBytes(
        id: currentGame.id,
        name: currentGame.name,
        imagePath: imagePath,
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

  String _getImagePath({
    required String gameId,
    required List<GameModel> gameModels,
  }) =>
      gameModels.firstWhere((element) => element.id == gameId).imageUrl!;
}
