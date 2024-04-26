part of 'edit_hangout_page_bloc.dart';

@freezed
sealed class EditHangoutPageState extends AppState
    with _$EditHangoutPageState, EquatableMixin {
  const EditHangoutPageState._();

  const factory EditHangoutPageState.init() = Init;

  const factory EditHangoutPageState.loading() = Loading;

  const factory EditHangoutPageState.updateUI({
    required Day day,
    required TimeOfDay time,
  }) = UpdateUI;

  const factory EditHangoutPageState.saved() = Saved;

  const factory EditHangoutPageState.error(CloudFailure failure) = Error;

  @override
  List<Object?> get props => map(
        init: (value) => [],
        loading: (value) => [],
        updateUI: (value) => [value.day, value.time],
        saved: (value) => [],
        error: (value) => [value.failure],
      );
}
