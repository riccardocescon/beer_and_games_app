part of 'user_bloc.dart';

@freezed
sealed class UserState extends AppState with _$UserState, EquatableMixin {
  const UserState._();

  const factory UserState.init() = Init;

  const factory UserState.loading() = Loading;

  const factory UserState.auth(User? user) = Auth;

  const factory UserState.error(Failure failure) = Error;

  @override
  List<Object?> get props => map(
        init: (value) => [],
        loading: (value) => [],
        auth: (value) => [value.user],
        error: (value) => [value.failure],
      );
}
