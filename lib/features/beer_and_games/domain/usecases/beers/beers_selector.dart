import 'package:beer_and_games/core/beer_and_games/domain/usecases/usecase.dart';
import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/beer.dart';
import 'package:beer_and_games/features/beer_and_games/domain/repositories/beer_repository.dart';
import 'package:dartz/dartz.dart';

class BeersSelector extends StreamUseCase<List<Beer>, void> {
  final BeerRepository beerRepository;

  BeersSelector({required this.beerRepository});

  @override
  Stream<Either<Failure, List<Beer>>> call(void params) async* {
    yield* beerRepository.select();
  }
}
