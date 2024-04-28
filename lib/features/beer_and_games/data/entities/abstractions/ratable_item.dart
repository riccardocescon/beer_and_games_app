import 'package:beer_and_games/features/beer_and_games/data/entities/abstractions/item.dart';
import 'package:beer_and_games/features/beer_and_games/data/entities/user_rating.dart';

abstract class RateableItem extends Item {
  final List<UserRating> ratings;

  RateableItem({
    required super.name,
    required this.ratings,
    super.imageUrl,
  });
}
