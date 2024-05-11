part of 'package:beer_and_games/features/beer_and_games/presentation/pages/games_item_page.dart';

class _EditRatableItemBottomSheet extends StatefulWidget {
  const _EditRatableItemBottomSheet({
    required this.game,
  });

  final Game game;

  @override
  State<_EditRatableItemBottomSheet> createState() =>
      _EditRatableItemBottomSheetState();
}

class _EditRatableItemBottomSheetState
    extends State<_EditRatableItemBottomSheet> {
  late Game _backupItem = widget.game.copyWith();

  void _update(
    String name,
    List<int> image,
    int minPlayers,
    int maxPlayers,
    bool onlyMinMax,
  ) {
    _backupItem = _backupItem.copyWith(
      name: name,
      imageBytes: image,
      minPlayers: minPlayers,
      maxPlayers: maxPlayers,
      onlyMinMaxPlayers: onlyMinMax,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ItemsBloc, ItemsState>(
      listenWhen: (previous, current) {
        return current.maybeMap(
          update: (value) {
            final prevValue = previous.maybeMap(
              update: (value) => value,
              orElse: () => null,
            );
            if (prevValue == null) return true;

            final prevGame = prevValue.games
                .firstWhere((element) => element.id == widget.game.id);

            final game = value.games
                .firstWhere((element) => element.id == widget.game.id);

            return game != prevGame && game == _backupItem;
          },
          orElse: () => false,
        );
      },
      listener: (context, state) {
        state.maybeMap(
          update: (value) {
            context.pop();
            context.successSnackbar(
              'Modifica effettuata',
              'Le modifiche sono state apportate con successo',
            );
          },
          orElse: () {},
        );
      },
      child: BottomEditableGameItem(
        initName: widget.game.name,
        initImageBytes: widget.game.imageBytes?.toList(),
        initMinPlayers: widget.game.minPlayers,
        initMaxPlayers: widget.game.maxPlayers,
        initOnlyMinMax: widget.game.onlyMinMaxPlayers,
        onSave: (name, bytes, minPlayers, maxPlayers, onlyMinMax) {
          _update(
            name,
            bytes ?? <int>[],
            minPlayers,
            maxPlayers,
            onlyMinMax,
          );
          context.read<ItemsBloc>().add(
                ItemsEvent.updateGameInfo(item: _backupItem),
              );
        },
      ),
    );
  }
}
