part of 'games_usecases.dart';

class GameInfoUpdater extends UseCase<void, GameInfoUpdaterParams> {
  final GameRepository gameRepository;

  GameInfoUpdater({required this.gameRepository});

  @override
  Future<Either<Failure, void>> call(GameInfoUpdaterParams params) async {
    return gameRepository.updateInfo(game: params.game);
  }
}

class GameInfoUpdaterParams {
  final Game game;

  GameInfoUpdaterParams({required this.game});
}
