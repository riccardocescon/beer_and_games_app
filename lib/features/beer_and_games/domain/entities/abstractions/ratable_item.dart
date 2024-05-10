import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/user_rating.dart';

abstract class RateableItem extends Item {
  final List<UserRating> ratings;

  RateableItem({
    required super.id,
    required super.name,
    required this.ratings,
    super.imageBytes,
  });
}
