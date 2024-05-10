part of 'hangout_stats_page_bloc.dart';

@freezed
sealed class HangoutStatsPageState extends AppState
    with _$HangoutStatsPageState, EquatableMixin {
  const HangoutStatsPageState._();

  const factory HangoutStatsPageState.init() = Init;

  const factory HangoutStatsPageState.loading() = Loading;

  const factory HangoutStatsPageState.hangout(Hangout hangout) = Loaded;

  const factory HangoutStatsPageState.updateUI({
    required bool addBeer,
    required bool addWine,
  }) = UpdateUI;

  const factory HangoutStatsPageState.error(CloudFailure failure) = Error;

  @override
  List<Object?> get props => map(
        init: (value) => [],
        loading: (value) => [],
        hangout: (value) => [value.hangout],
        updateUI: (value) => [value.addBeer, value.addWine],
        error: (value) => [value.failure],
      );
}
