part of 'user_usecases.dart';

class UserGetter extends UseCase<User, String> {
  final UserRepository userRepository;
  UserGetter({required this.userRepository});

  @override
  Future<Either<CloudFailure, User>> call(String params) async {
    return await userRepository.get(email: params);
  }
}
