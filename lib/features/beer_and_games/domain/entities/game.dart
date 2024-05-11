import 'dart:typed_data';

import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/item.dart';
import 'package:equatable/equatable.dart';

class Game extends Item with EquatableMixin {
  final int minplayers, maxplayers;
  final bool onlyMinMaxPlayers;
  final int timesPlayed;

  Game({
    required super.id,
    required super.name,
    required this.minplayers,
    required this.maxplayers,
    required this.onlyMinMaxPlayers,
    required this.timesPlayed,
    super.imageBytes,
  });

  Game copyWith({
    String? id,
    String? name,
    int? minplayers,
    int? maxplayers,
    bool? onlyMinMaxPlayers,
    Uint8List? imageBytes,
    int? timesPlayed,
  }) {
    return Game(
      id: id ?? this.id,
      name: name ?? this.name,
      minplayers: minplayers ?? this.minplayers,
      maxplayers: maxplayers ?? this.maxplayers,
      onlyMinMaxPlayers: onlyMinMaxPlayers ?? this.onlyMinMaxPlayers,
      imageBytes: imageBytes ?? this.imageBytes,
      timesPlayed: timesPlayed ?? this.timesPlayed,
    );
  }

  @override
  List<Object?> get props => [
        name,
        minplayers,
        maxplayers,
        onlyMinMaxPlayers,
        imageBytes,
        timesPlayed,
      ];
}
