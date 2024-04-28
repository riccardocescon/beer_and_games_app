import 'package:beer_and_games/features/beer_and_games/data/entities/abstractions/item.dart';

class Game extends Item {
  final int minplayers, maxplayers;
  final bool onlyMinMaxPlayers;

  Game({
    required super.name,
    required this.minplayers,
    required this.maxplayers,
    required this.onlyMinMaxPlayers,
    super.imageUrl,
  });
}
