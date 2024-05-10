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

  factory UserRatingModel.fromFirebase(String value) {
    final part = value.split('|');
    return UserRatingModel._(
      userEmail: part[0],
      rating: int.parse(part[1]),
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
