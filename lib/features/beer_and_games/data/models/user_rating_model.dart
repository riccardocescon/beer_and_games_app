import 'package:beer_and_games/core/enums/rating.dart';
import 'package:beer_and_games/core/mapper/data_mapper.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/user_rating.dart';

class UserRatingModel extends DataMapper<UserRating> {
  final int rating;
  final String userEmail;

  UserRatingModel._({
    required this.rating,
    required this.userEmail,
  });

  factory UserRatingModel.fromMapEntry(MapEntry<String, dynamic> map) {
    return UserRatingModel._(
      userEmail: map.key,
      rating: map.value,
    );
  }

  @override
  UserRating get toEntity {
    final ratingValue = Rating.values.firstWhere(
      (element) => element.value == rating,
    );
    return UserRating(
      rating: ratingValue,
      userEmail: userEmail,
    );
  }
}
