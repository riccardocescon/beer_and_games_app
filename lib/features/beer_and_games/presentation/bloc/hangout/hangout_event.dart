part of 'hangout_bloc.dart';

@freezed
sealed class HangoutEvent extends AppEvent with _$HangoutEvent, EquatableMixin {
  const HangoutEvent._();

  const factory HangoutEvent.select() = Select;

  @override
  List<Object?> get props => map(
        select: (value) => [],
      );
}
