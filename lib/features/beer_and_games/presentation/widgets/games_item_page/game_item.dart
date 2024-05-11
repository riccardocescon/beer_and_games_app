part of 'package:beer_and_games/features/beer_and_games/presentation/pages/games_item_page.dart';

class _GameItem extends StatefulWidget {
  const _GameItem({required this.game});

  final Game game;

  @override
  State<_GameItem> createState() => _GameItemState();
}

class _GameItemState extends State<_GameItem> with EditDeleteItemMenuPoppable {
  final _itemWidth = 100.0;

  late Game updatedItem = widget.game;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: storePosition,
      child: FilledButton(
        onPressed: _handlePress,
        onLongPress: _handleLongPress,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(0),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        child: SizedBox(
          child: Column(
            children: [
              BlocBuilder<ItemsBloc, ItemsState>(
                buildWhen: (previous, current) => current.maybeMap(
                  update: (value) {
                    final prevState = previous.maybeMap(
                      update: (value) => value.games,
                      orElse: () => null,
                    );
                    if (prevState == null) return true;

                    final currItem = value.games.firstWhereOrNull(
                      (element) => element.id == widget.game.id,
                    );
                    final prevItem = prevState.firstWhereOrNull(
                      (element) => element.id == widget.game.id,
                    );

                    return currItem != prevItem;
                  },
                  orElse: () => false,
                ),
                builder: (context, state) {
                  return state.maybeMap(
                    update: (value) {
                      updatedItem = value.games.firstWhere(
                        (element) => element.id == widget.game.id,
                      );
                      return StatsItem(
                        itemWidth: _itemWidth,
                        item: updatedItem,
                        additionalWidget: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            children: [
                              _playersNumberRow(),
                              height5,
                              _playedNumberRow(),
                              height10,
                            ],
                          ),
                        ),
                      );
                    },
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _playersNumberRow() {
    final minPlayers = updatedItem.minPlayers;
    final maxPlayers = updatedItem.maxPlayers;
    final number = updatedItem.onlyMinMaxPlayers
        ? minPlayers == maxPlayers
            ? '$minPlayers'
            : '$minPlayers / $maxPlayers'
        : '$minPlayers - $maxPlayers';
    return Row(
      children: [
        Icon(
          Icons.groups_rounded,
          size: 16,
          color: context.colorScheme.onSurface,
        ),
        Expanded(
          child: Text(
            number,
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _playedNumberRow() {
    return Row(
      children: [
        Icon(
          Icons.games_rounded,
          size: 16,
          color: context.colorScheme.onSurface,
        ),
        Expanded(
          child: Text(
            updatedItem.timesPlayed.toString(),
            style: context.textTheme.labelSmall?.copyWith(
              color: context.colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  void _handlePress() {
    showModalBottomSheet(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<ItemsBloc>(),
        child: _PlayedItemBottomSheet(game: updatedItem),
      ),
      backgroundColor: MaterialTheme.darkScheme().surfaceContainer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
    );
  }

  void _handleLongPress() {
    return handleLongPress(
      context: context,
      updatedItem: updatedItem,
      onShowModalBottomSheet: (value) {
        return _EditRatableItemBottomSheet(game: updatedItem);
      },
    );
  }
}
