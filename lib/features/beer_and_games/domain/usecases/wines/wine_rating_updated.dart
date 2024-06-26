part of 'wine_usecases.dart';

class WineRatingUpdates extends UseCase<void, WineRatingUpdatedParams> {
  final WineRepository wineRepository;

  WineRatingUpdates({required this.wineRepository});

  @override
  Future<Either<Failure, void>> call(WineRatingUpdatedParams params) async {
    return wineRepository.updateRating(
      userEmail: params.userEmail,
      rating: params.rating,
      item: params.item,
      remove: params.remove,
    );
  }
}

class WineRatingUpdatedParams {
  final String userEmail;
  final Rating rating;
  final RateableItem item;
  final bool remove;

  WineRatingUpdatedParams({
    required this.userEmail,
    required this.rating,
    required this.item,
    required this.remove,
  });
}
