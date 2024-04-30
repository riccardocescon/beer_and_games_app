import 'package:beer_and_games/core/beer_and_games/domain/usecases/usecase.dart';
import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/game.dart';
import 'package:beer_and_games/features/beer_and_games/domain/repositories/game_repository.dart';
import 'package:dartz/dartz.dart';

class GamesSelector extends StreamUseCase<List<Game>, void> {
  final GameRepository gameRepository;

  GamesSelector({required this.gameRepository});

  @override
  Stream<Either<Failure, List<Game>>> call(void params) async* {
    yield* gameRepository.select();
  }
}
