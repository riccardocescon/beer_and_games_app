import 'package:beer_and_games/features/beer_and_games/data/models/user_rating_model.dart';

class BeerModel {
  final String id;
  final String name;
  final String? imageUrl;
  final List<UserRatingModel> ratings;

  BeerModel._({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.ratings,
  });

  factory BeerModel.fromJson(Map<String, dynamic> json, {required String id}) {
    final ratingsData = json['ratings'] as List?;
    final noRatings = ratingsData == null ||
        ratingsData.isEmpty ||
        (ratingsData.first as String).isEmpty;

    final ratings = noRatings
        ? <UserRatingModel>[]
        : List.generate(
            ratingsData.length,
            (index) => UserRatingModel.fromFirebase(ratingsData[index]),
          );
    return BeerModel._(
      id: id,
      name: json['name'],
      imageUrl: json['img'],
      ratings: ratings,
    );
  }
}
