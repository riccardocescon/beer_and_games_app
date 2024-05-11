part of 'games_usecases.dart';

class GamePlayDecrementor extends UseCase<void, GamePlayDecrementorParams> {
  final GameRepository gameRepository;

  GamePlayDecrementor({required this.gameRepository});

  @override
  Future<Either<Failure, void>> call(GamePlayDecrementorParams params) async {
    return await gameRepository.markRemovePlayed(gameId: params.gameId);
  }
}

class GamePlayDecrementorParams {
  final String gameId;

  GamePlayDecrementorParams({required this.gameId});
}
