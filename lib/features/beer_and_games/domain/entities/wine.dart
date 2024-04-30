import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/ratable_item.dart';

class Wine extends RateableItem {
  Wine({
    required super.id,
    required super.name,
    required super.ratings,
    super.imageBytes,
  });
}
