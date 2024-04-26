part of 'hangout_bloc.dart';

@freezed
sealed class HangoutState extends AppState with _$HangoutState, EquatableMixin {
  const HangoutState._();

  const factory HangoutState.init() = Init;

  const factory HangoutState.loading() = Loading;

  const factory HangoutState.loaded(Hangout hangout) = Loaded;

  const factory HangoutState.dayTimeUpdate() = DayTimeUpdate;
  const factory HangoutState.userPresenceUpdated() = UserPresenceUpdated;

  const factory HangoutState.dateTimeUpdate({
    required int missingDays,
    required int missingHours,
    required int missingMinutes,
    required DateTime date,
  }) = DateTimeUpdate;

  const factory HangoutState.error(CloudFailure failure) = Error;

  @override
  List<Object?> get props => map(
        init: (value) => [],
        loading: (value) => [],
        loaded: (value) => [value.hangout],
        dayTimeUpdate: (value) => [],
        userPresenceUpdated: (value) => [],
        dateTimeUpdate: (nextHangout) => [
          nextHangout.date,
          nextHangout.missingDays,
          nextHangout.missingHours,
          nextHangout.missingMinutes,
        ],
        error: (value) => [value.failure],
      );
}
