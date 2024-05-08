part of 'hangout_stats_page_bloc.dart';

@freezed
sealed class HangoutStatsPageEvent extends AppEvent
    with _$HangoutStatsPageEvent, EquatableMixin {
  const HangoutStatsPageEvent._();

  const factory HangoutStatsPageEvent.setup({
    required Hangout hangout,
  }) = Setup;

  // UI Interactions
  const factory HangoutStatsPageEvent.addItem() = AddItem;
  const factory HangoutStatsPageEvent.saveItem({
    required Item item,
  }) = SaveItem;
  const factory HangoutStatsPageEvent.closeItem() = CloseItem;

  @override
  List<Object?> get props => map(
        setup: (value) => [value.hangout],
        addItem: (value) => [],
        saveItem: (value) => [value.item],
        closeItem: (value) => [],
      );
}
