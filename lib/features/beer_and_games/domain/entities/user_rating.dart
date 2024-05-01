import 'package:beer_and_games/core/enums/rating.dart';

class UserRating {
  final Rating rating;
  final String userEmail;

  UserRating({
    required this.rating,
    required this.userEmail,
  });

  UserRating copyWith({
    Rating? rating,
    String? userEmail,
  }) {
    return UserRating(
      rating: rating ?? this.rating,
      userEmail: userEmail ?? this.userEmail,
    );
  }
}
