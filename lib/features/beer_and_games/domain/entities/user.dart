import 'package:equatable/equatable.dart';

class User with EquatableMixin {
  final String email;
  int? precenceCount;

  String get letters {
    // returns 2 letters before the @ with the following rules:
    // if the email contains a . or _ or - then use the first letter
    // of the email and the first letter after the special character
    // if there are no special characters then return the first two letters
    // before the @
    final emailSplit = email.split('@');
    final emailName = emailSplit.first;
    final emailNameSplit = emailName.split(RegExp(r'[._-]'));
    if (emailNameSplit.length > 1) {
      return '${emailNameSplit.first[0]}${emailNameSplit[1][0]}'.toUpperCase();
    }
    return '${emailName[0]}${emailName[1]}'.toUpperCase();
  }

  User({required this.email, this.precenceCount});

  User copyWith({
    String? email,
    int? precenceCount,
    bool forcePercenceCountUpdate = false,
  }) {
    return User(
      email: email ?? this.email,
      precenceCount: precenceCount ?? this.precenceCount,
    );
  }

  @override
  List<Object?> get props => [email];
}
