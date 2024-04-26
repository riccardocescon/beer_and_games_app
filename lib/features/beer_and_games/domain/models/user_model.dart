import 'package:beer_and_games/features/beer_and_games/data/entities/user.dart';

class UserModel extends User {
  UserModel({required super.email});

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

  UserModel copyWith({
    String? email,
  }) {
    return UserModel(
      email: email ?? this.email,
    );
  }

  User get toEntity => User(
        email: email,
      );
}
