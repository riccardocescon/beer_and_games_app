import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/item.dart';
import 'package:equatable/equatable.dart';

class Game extends Item with EquatableMixin {
  final int minplayers, maxplayers;
  final bool onlyMinMaxPlayers;

  Game({
    required super.id,
    required super.name,
    required this.minplayers,
    required this.maxplayers,
    required this.onlyMinMaxPlayers,
    super.imageBytes,
  });

  @override
  List<Object?> get props =>
      [name, minplayers, maxplayers, onlyMinMaxPlayers, imageBytes];
}
