import 'package:beer_and_games/features/beer_and_games/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.email,
    super.presenceCount,
  });

  factory UserModel.fromData(String email) {
    return UserModel(
      email: email,
    );
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      email: user.email,
    );
  }

  Map<String, dynamic> toData() {
    return {
      'email': email,
    };
  }

  User get toEntity => User(
        email: email,
      );
}
