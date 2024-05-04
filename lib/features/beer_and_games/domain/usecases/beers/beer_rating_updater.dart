part of 'beer_usecases.dart';

class BeersRatiningUpdater extends UseCase<void, BeerRatingUpdatedParams> {
  final BeerRepository beerRepository;

  BeersRatiningUpdater({required this.beerRepository});

  @override
  Future<Either<Failure, void>> call(BeerRatingUpdatedParams params) async {
    return beerRepository.updateRating(
      userEmail: params.userEmail,
      rating: params.rating,
      item: params.item,
    );
  }
}

class BeerRatingUpdatedParams {
  final String userEmail;
  final Rating rating;
  final RateableItem item;

  BeerRatingUpdatedParams({
    required this.userEmail,
    required this.rating,
    required this.item,
  });
}
