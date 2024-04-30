part of 'homepage_bloc.dart';

@freezed
sealed class HomepageState extends AppState
    with _$HomepageState, EquatableMixin {
  const HomepageState._();

  const factory HomepageState.init() = Init;

  const factory HomepageState.loading() = Loading;

  const factory HomepageState.loaded(Hangout hangout) = Loaded;

  const factory HomepageState.dateTimeUpdate({
    required String date,
    required String timeLeft,
  }) = DateTimeUpdate;

  const factory HomepageState.gamesLoaded({
    required List<Game> games,
  }) = GamesLoaded;

  const factory HomepageState.error(CloudFailure failure) = Error;

  @override
  List<Object?> get props => map(
        init: (value) => [],
        loading: (value) => [],
        loaded: (value) => [value.hangout],
        dateTimeUpdate: (nextHangout) =>
            [nextHangout.date, nextHangout.timeLeft],
        gamesLoaded: (value) => [value.games],
        error: (value) => [value.failure],
      );
}
