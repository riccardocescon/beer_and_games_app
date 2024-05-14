part of 'user_usecases.dart';

class UserLogout extends UseCase<void, void> {
  final UserRepository userRepository;
  UserLogout({required this.userRepository});

  @override
  Future<Either<Failure, void>> call(void params) async {
    return await userRepository.signOut();
  }
}
