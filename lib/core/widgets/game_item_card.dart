import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/core/widgets/spacers.dart';
import 'package:beer_and_games/core/widgets/stats_item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/game.dart';
import 'package:flutter/material.dart';

class GameItemCard extends StatefulWidget {
  const GameItemCard({
    super.key,
    required this.game,
    required this.onTapDown,
    required this.onPress,
    required this.onLongPress,
  });

  final Game game;
  final Function(TapDownDetails)? onTapDown;
  final VoidCallback? onPress;
  final VoidCallback? onLongPress;

  @override
  State<GameItemCard> createState() => _GameItemCardState();
}

class _GameItemCardState extends State<GameItemCard> {
  final _itemWidth = 100.0;

  Game get updatedItem => widget.game;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onTapDown,
      child: FilledButton(
        onPressed: widget.onPress,
        onLongPress: widget.onLongPress,
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
              StatsItem(
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
}
