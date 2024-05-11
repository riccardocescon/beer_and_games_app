part of 'games_usecases.dart';

class GamePlayIncrementor extends UseCase<void, GamePlayIncrementorParams> {
  final GameRepository gameRepository;

  GamePlayIncrementor({required this.gameRepository});

  @override
  Future<Either<Failure, void>> call(GamePlayIncrementorParams params) async {
    return await gameRepository.markAddPlayed(gameId: params.gameId);
  }
}

class GamePlayIncrementorParams {
  final String gameId;

  GamePlayIncrementorParams({required this.gameId});
}
