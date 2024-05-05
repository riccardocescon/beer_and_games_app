part of 'beer_usecases.dart';

class BeerInfoUpdater extends UseCase<void, BeerInfoUpdaterParams> {
  final BeerRepository beerRepository;

  BeerInfoUpdater({required this.beerRepository});

  @override
  Future<Either<Failure, void>> call(BeerInfoUpdaterParams params) async {
    return beerRepository.updateInfo(beer: params.beer);
  }
}

class BeerInfoUpdaterParams {
  final Beer beer;

  BeerInfoUpdaterParams({
    required this.beer,
  });
}
