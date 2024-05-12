part of 'package:beer_and_games/features/beer_and_games/presentation/pages/games_item_page.dart';

class _GameItem extends StatefulWidget {
  const _GameItem({required this.game});

  final Game game;

  @override
  State<_GameItem> createState() => _GameItemState();
}

class _GameItemState extends State<_GameItem> with EditDeleteItemMenuPoppable {
  late Game updatedItem = widget.game;

  @override
  Widget build(BuildContext context) {
    return GameItemCard(
      game: widget.game,
      onTapDown: storePosition,
      onPress: _handlePress,
      onLongPress: _handleLongPress,
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
