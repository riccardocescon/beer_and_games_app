import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/ratable_item.dart';

class Beer extends RateableItem {
  Beer({
    required super.id,
    required super.name,
    required super.imageBytes,
    required super.ratings,
  });
}
