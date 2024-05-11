part of 'games_usecases.dart';

class GameDeleter extends UseCase<void, GameDeleterParams> {
  final GameRepository gameRepository;

  GameDeleter({required this.gameRepository});

  @override
  Future<Either<Failure, void>> call(GameDeleterParams params) async {
    return await gameRepository.delete(game: params.game);
  }
}

class GameDeleterParams {
  final Game game;

  GameDeleterParams({
    required this.game,
  });
}
