part of 'hangout_stats_page_bloc.dart';

@freezed
sealed class HangoutStatsPageEvent extends AppEvent
    with _$HangoutStatsPageEvent, EquatableMixin {
  const HangoutStatsPageEvent._();

  const factory HangoutStatsPageEvent.setup({
    required Hangout hangout,
  }) = Setup;

  @override
  List<Object?> get props => map(
        setup: (value) => [value.hangout],
        getUsersPresence: (value) => [],
      );
}
