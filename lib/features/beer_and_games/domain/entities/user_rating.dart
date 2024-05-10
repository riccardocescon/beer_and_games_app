import 'package:beer_and_games/core/enums/rating.dart';
import 'package:equatable/equatable.dart';

class UserRating with EquatableMixin {
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

  @override
  List<Object?> get props => [rating, userEmail];
}
