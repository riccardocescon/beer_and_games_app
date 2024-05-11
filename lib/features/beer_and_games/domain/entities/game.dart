import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/item.dart';
import 'package:equatable/equatable.dart';

class Game extends Item with EquatableMixin {
  final int minPlayers, maxPlayers;
  final bool onlyMinMaxPlayers;
  final int timesPlayed;

  Game({
    required super.id,
    required super.name,
    required this.minPlayers,
    required this.maxPlayers,
    required this.onlyMinMaxPlayers,
    required this.timesPlayed,
    super.imageBytes,
  });

  Game copyWith({
    String? id,
    String? name,
    int? minPlayers,
    int? maxPlayers,
    bool? onlyMinMaxPlayers,
    List<int>? imageBytes,
    int? timesPlayed,
  }) {
    return Game(
      id: id ?? this.id,
      name: name ?? this.name,
      minPlayers: minPlayers ?? this.minPlayers,
      maxPlayers: maxPlayers ?? this.maxPlayers,
      onlyMinMaxPlayers: onlyMinMaxPlayers ?? this.onlyMinMaxPlayers,
      imageBytes: imageBytes ?? this.imageBytes,
      timesPlayed: timesPlayed ?? this.timesPlayed,
    );
  }

  @override
  List<Object?> get props => [
        name,
        minPlayers,
        maxPlayers,
        onlyMinMaxPlayers,
        imageBytes,
        timesPlayed,
      ];
}
