part of 'hangout_bloc.dart';

@freezed
sealed class HangoutEvent extends AppEvent with _$HangoutEvent, EquatableMixin {
  const HangoutEvent._();

  const factory HangoutEvent.select() = Select;
  const factory HangoutEvent.updateDateTime({
    required Day day,
    required TimeOfDay time,
  }) = UpdateDateTime;
  const factory HangoutEvent.updateUserPresence({
    required String? presentEmailToAdd,
    required String? presentEmailToRemove,
    required String? absentEmailToAdd,
    required String? absentEmailToRemove,
    required String? waitingEmailToAdd,
    required String? waitingEmailToRemove,
  }) = UpdateUserPresence;

  @override
  List<Object?> get props => map(
        select: (value) => [],
        updateDateTime: (value) => [value.day, value.time],
        updateUserPresence: (value) => [
          value.presentEmailToAdd,
          value.presentEmailToRemove,
          value.absentEmailToAdd,
          value.absentEmailToRemove,
          value.waitingEmailToAdd,
          value.waitingEmailToRemove,
        ],
      );
}
