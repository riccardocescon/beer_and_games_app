part of 'items_bloc.dart';

@freezed
sealed class ItemsState extends AppState with _$ItemsState, EquatableMixin {
  const ItemsState._();

  const factory ItemsState.init() = Init;

  const factory ItemsState.loading() = Loading;

  const factory ItemsState.update({
    required List<Game> games,
    required List<Beer> beers,
    required List<Wine> wines,
  }) = Update;

  const factory ItemsState.error(Failure failure) = Error;

  @override
  List<Object?> get props => map(
        init: (value) => [],
        loading: (value) => [],
        update: (value) => [value.games, value.beers, value.wines],
        error: (value) => [value.failure],
      );
}
