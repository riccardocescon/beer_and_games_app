part of 'hangout_usecases.dart';

class HangoutGetUsersPresence
    extends UseCase<List<User>, HangoutGetUsersPresenceParams> {
  final HangoutRepository repository;

  HangoutGetUsersPresence({required this.repository});

  @override
  Future<Either<CloudFailure, List<User>>> call(
    HangoutGetUsersPresenceParams params,
  ) async {
    return await repository.getUsersPresence(
      users: params.users,
    );
  }
}

class HangoutGetUsersPresenceParams {
  final List<User> users;

  HangoutGetUsersPresenceParams({
    required this.users,
  });
}
