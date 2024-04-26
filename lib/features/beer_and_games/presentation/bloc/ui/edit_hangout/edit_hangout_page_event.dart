part of 'edit_hangout_page_bloc.dart';

@freezed
sealed class EditHangoutPageEvent extends AppEvent
    with _$EditHangoutPageEvent, EquatableMixin {
  const EditHangoutPageEvent._();

  const factory EditHangoutPageEvent.setup({
    required Hangout hangout,
  }) = Setup;

  const factory EditHangoutPageEvent.setDayOfWeek({
    required Day day,
  }) = SetDayOfWeek;

  const factory EditHangoutPageEvent.setTime({
    required TimeOfDay time,
  }) = SetTime;

  const factory EditHangoutPageEvent.save() = Save;

  @override
  List<Object?> get props => map(
        setup: (value) => [value.hangout],
        setDayOfWeek: (value) => [value.day],
        setTime: (value) => [value.time],
        save: (value) => [],
      );
}
