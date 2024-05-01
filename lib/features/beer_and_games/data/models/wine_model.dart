import 'dart:convert';
import 'package:beer_and_games/features/beer_and_games/data/models/user_rating_model.dart';

class WineModel {
  final String id;
  final String name;
  final String? imageUrl;
  final List<UserRatingModel> ratings;

  WineModel._({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.ratings,
  });

  factory WineModel.fromJson(Map<String, dynamic> json, {required String id}) {
    final ratingsData = jsonDecode(json['ratings']) as Map<String, dynamic>;
    final ratings = List.generate(
      ratingsData.entries.length,
      (index) => UserRatingModel.fromMapEntry(
        ratingsData.entries.elementAt(index),
      ),
    );
    return WineModel._(
      id: id,
      name: json['name'],
      imageUrl: json['img'],
      ratings: ratings,
    );
  }
}
