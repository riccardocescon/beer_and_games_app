part of 'items_bloc.dart';

@freezed
sealed class ItemsEvent extends AppEvent with _$ItemsEvent, EquatableMixin {
  const ItemsEvent._();

  const factory ItemsEvent.download() = Download;
  const factory ItemsEvent.updateRating({
    required RateableItem item,
    required String userEmail,
    required Rating rating,
  }) = UpdateRating;

  @override
  List<Object?> get props => map(
        download: (value) => [],
        updateRating: (value) => [value.item, value.userEmail, value.rating],
      );
}
