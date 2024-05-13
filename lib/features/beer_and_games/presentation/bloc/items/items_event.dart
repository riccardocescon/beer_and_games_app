part of 'items_bloc.dart';

@freezed
sealed class ItemsEvent extends AppEvent with _$ItemsEvent, EquatableMixin {
  const ItemsEvent._();

  const factory ItemsEvent.download() = Download;
  const factory ItemsEvent.insertGame({
    required String name,
    required List<int>? imageBytes,
    required int minPlayers,
    required int maxPlayers,
    required bool onlyMinMaxPlayers,
  }) = InsertGame;
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
    @Default(false) bool removeVote,
  }) = UpdateRating;
  const factory ItemsEvent.updateInfo({required RateableItem item}) =
      UpdateInfo;
  const factory ItemsEvent.updateGameInfo({required Game item}) =
      UpdateGameInfo;
  const factory ItemsEvent.delete({required Item item}) = Delete;
  const factory ItemsEvent.updateGamePlay({
    required bool increment,
    required String gameId,
  }) = UpdateGamePlay;

  @override
  List<Object?> get props => map(
        download: (value) => [],
        insertGame: (value) => [
          value.name,
          value.imageBytes,
          value.minPlayers,
          value.maxPlayers,
          value.onlyMinMaxPlayers,
        ],
        insertBeer: (value) => [value.name, value.imageBytes],
        insertWine: (value) => [value.name, value.imageBytes],
        updateRating: (value) => [value.item, value.userEmail, value.rating],
        updateInfo: (value) => [value.item],
        updateGameInfo: (value) => [value.item],
        updateGamePlay: (value) => [value.increment, value.gameId],
        delete: (value) => [value.item],
      );
}
