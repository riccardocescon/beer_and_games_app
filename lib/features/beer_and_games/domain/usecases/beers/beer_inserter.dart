part of 'beer_usecases.dart';

class BeerInserter extends UseCase<void, BeerInserterParams> {
  final BeerRepository beerRepository;

  BeerInserter({required this.beerRepository});

  @override
  Future<Either<Failure, void>> call(BeerInserterParams params) async {
    return beerRepository.insert(
      name: params.name,
      imageBytes: params.imageBytes,
    );
  }
}

class BeerInserterParams {
  final String name;
  final List<int>? imageBytes;

  BeerInserterParams({
    required this.name,
    required this.imageBytes,
  });
}
