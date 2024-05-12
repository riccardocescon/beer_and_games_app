part of 'games_usecases.dart';

class GamesSelector extends StreamUseCase<List<Game>, void> {
  final GameRepository gameRepository;

  GamesSelector({required this.gameRepository});

  @override
  Stream<Either<Failure, List<Game>>> call(void params) async* {
    yield* gameRepository.select();
  }
}
