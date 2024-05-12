part of 'homepage_bloc.dart';

@freezed
sealed class HomepageEvent extends AppEvent
    with _$HomepageEvent, EquatableMixin {
  const HomepageEvent._();

  const factory HomepageEvent.setup() = Setup;

  const factory HomepageEvent.setupGameStream({
    required ItemsBloc itemsBloc,
  }) = SetupGameStream;

  const factory HomepageEvent.showGames({@Default(false) bool onlyRefresh}) =
      ShowGames;

  @override
  List<Object?> get props => map(
        setup: (value) => [],
        setupGameStream: (value) => [value.itemsBloc],
        showGames: (value) => [],
      );
}
