part of 'homepage_vote_area_bloc.dart';

@freezed
sealed class HomepageVoteAreaState extends AppState
    with _$HomepageVoteAreaState, EquatableMixin {
  const HomepageVoteAreaState._();

  const factory HomepageVoteAreaState.init() = Init;

  const factory HomepageVoteAreaState.loading() = Loading;

  const factory HomepageVoteAreaState.presenceSet({
    required PresenceState? oldPresence,
    required PresenceState newPresence,
  }) = PresenceSet;

  const factory HomepageVoteAreaState.error({
    required String message,
  }) = Error;

  @override
  List<Object?> get props => map(
        init: (_) => [],
        loading: (_) => [],
        presenceSet: (value) => [value.oldPresence, value.newPresence],
        error: (value) => [value.message],
      );
}
