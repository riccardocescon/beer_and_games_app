part of 'items_bloc.dart';

@freezed
sealed class ItemsEvent extends AppEvent with _$ItemsEvent, EquatableMixin {
  const ItemsEvent._();

  const factory ItemsEvent.download() = Download;
  const factory ItemsEvent.insertBeer({
    required String name,
    required List<int>? imageBytes,
  }) = InsertBeer;
  const factory ItemsEvent.insertWine({
    required String name,
    required List<int>? imageBytes,
  }) = InsertWine;
  const factory ItemsEvent.updateRating({
    required RateableItem item,
    required String userEmail,
    required Rating rating,
  }) = UpdateRating;
  const factory ItemsEvent.updateInfo({required RateableItem item}) =
      UpdateInfo;
  const factory ItemsEvent.delete({required RateableItem item}) = Delete;

  @override
  List<Object?> get props => map(
        download: (value) => [],
        insertBeer: (value) => [value.name, value.imageBytes],
        insertWine: (value) => [value.name, value.imageBytes],
        updateRating: (value) => [value.item, value.userEmail, value.rating],
        updateInfo: (value) => [value.item],
        delete: (value) => [value.item],
      );
}
