part of 'homepage_vote_area_bloc.dart';

@freezed
sealed class HomepageVoteAreaEvent extends AppEvent
    with _$HomepageVoteAreaEvent, EquatableMixin {
  const HomepageVoteAreaEvent._();

  const factory HomepageVoteAreaEvent.setup({
    required HomepageBloc homepageBloc,
    required Hangout hangout,
    required User user,
  }) = Setup;

  const factory HomepageVoteAreaEvent.setPresence({
    required PresenceState presence,
  }) = SetPresence;

  @override
  List<Object?> get props => map(
        setup: (value) => [value.hangout],
        setPresence: (value) => [value.presence],
      );
}
