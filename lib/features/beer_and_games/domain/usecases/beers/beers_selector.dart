part of 'beer_usecases.dart';

class BeersSelector extends StreamUseCase<List<Beer>, void> {
  final BeerRepository beerRepository;

  BeersSelector({required this.beerRepository});

  @override
  Stream<Either<Failure, List<Beer>>> call(void params) async* {
    yield* beerRepository.select();
  }
}
