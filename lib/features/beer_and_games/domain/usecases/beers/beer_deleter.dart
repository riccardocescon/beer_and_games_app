part of 'beer_usecases.dart';

class BeerDeleter extends UseCase<void, BeerInfoUpdaterParams> {
  final BeerRepository beerRepository;

  BeerDeleter({required this.beerRepository});

  @override
  Future<Either<Failure, void>> call(BeerInfoUpdaterParams params) async {
    return beerRepository.delete(beer: params.beer);
  }
}

class BeerDeleterParams {
  final Beer beer;

  BeerDeleterParams({
    required this.beer,
  });
}
