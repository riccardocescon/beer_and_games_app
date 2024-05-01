import 'dart:typed_data';

import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/ratable_item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/user_rating.dart';
import 'package:equatable/equatable.dart';

class Beer extends RateableItem with EquatableMixin {
  Beer({
    required super.id,
    required super.name,
    required super.ratings,
    super.imageBytes,
  });

  Beer copyWith({
    String? id,
    String? name,
    List<UserRating>? ratings,
    Uint8List? imageBytes,
  }) {
    return Beer(
      id: id ?? this.id,
      name: name ?? this.name,
      ratings: ratings ?? this.ratings.map((e) => e.copyWith()).toList(),
      imageBytes: imageBytes ?? this.imageBytes,
    );
  }

  @override
  List<Object?> get props => [id, name, ratings, imageBytes];
}
