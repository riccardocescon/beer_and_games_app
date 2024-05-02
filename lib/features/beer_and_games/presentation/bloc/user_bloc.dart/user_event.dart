part of 'user_bloc.dart';

@freezed
sealed class UserEvent extends AppEvent with _$UserEvent, EquatableMixin {
  const UserEvent._();

  const factory UserEvent.signIn() = SignIn;
  const factory UserEvent.get(String email) = Get;
  const factory UserEvent.logout() = Logout;

  @override
  List<Object?> get props => map(
        signIn: (value) => [],
        get: (value) => [value.email],
        logout: (value) => [],
      );
}
