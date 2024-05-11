part of 'package:beer_and_games/features/beer_and_games/presentation/pages/games_item_page.dart';

class _GameItem extends StatefulWidget {
  const _GameItem({required this.game});

  final Game game;

  @override
  State<_GameItem> createState() => _GameItemState();
}

class _GameItemState extends State<_GameItem> {
  final _itemWidth = 100.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _itemWidth,
      child: FilledButton(
        onPressed: _handlePress,
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
        child: Column(
          children: [
            StatsItem(
              item: widget.game,
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _playersNumberRow() {
    final minPlayers = widget.game.minplayers;
    final maxPlayers = widget.game.maxplayers;
    final number = widget.game.onlyMinMaxPlayers
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
            widget.game.timesPlayed.toString(),
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
        child: _PlayedItemBottomSheet(game: widget.game),
      ),
      backgroundColor: MaterialTheme.darkScheme().surfaceContainer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
    );
  }
}
