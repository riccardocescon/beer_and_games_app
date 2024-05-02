part of 'user_usecases.dart';

class UserSigner extends UseCase<User, void> {
  final UserRepository userRepository;
  UserSigner({required this.userRepository});

  @override
  Future<Either<CloudFailure, User>> call(void params) async {
    return await userRepository.signInWithGoogle();
  }
}
