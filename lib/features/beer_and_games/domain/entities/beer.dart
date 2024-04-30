import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/ratable_item.dart';

class Beer extends RateableItem {
  Beer({
    required super.name,
    required super.imageUrl,
    required super.ratings,
  });
}
