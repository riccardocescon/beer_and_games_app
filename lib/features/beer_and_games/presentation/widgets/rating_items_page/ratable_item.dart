part of 'package:beer_and_games/features/beer_and_games/presentation/pages/rating_items_page.dart';

class _RatableItem<T extends RateableItem> extends StatefulWidget {
  const _RatableItem({required this.item});

  final RateableItem item;

  @override
  State<_RatableItem<T>> createState() => _RatableItemState<T>();
}

class _RatableItemState<T extends RateableItem> extends State<_RatableItem<T>> {
  final _itemWidth = 100.0;

  late RateableItem updatedItem = widget.item;

  List<User> get _allUsers => sl<HangoutBloc>().hangout!.allUsers;

  Offset? _tapPosition;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _itemWidth,
      child: GestureDetector(
        onTapDown: _storePosition,
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
          child: Column(
            children: [
              BlocBuilder<ItemsBloc, ItemsState>(
                buildWhen: (previous, current) => current.maybeMap(
                  update: (value) => true,
                  orElse: () => false,
                ),
                builder: (context, state) {
                  return state.maybeMap(
                    update: (value) {
                      final item = T == Beer
                          ? value.beers.firstWhere(
                              (element) => element.id == widget.item.id)
                          : value.wines.firstWhere(
                              (element) => element.id == widget.item.id);
                      return StatsItem(
                        item: item,
                        itemWidth: _itemWidth,
                      );
                    },
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
              height10,
              BlocBuilder<ItemsBloc, ItemsState>(
                buildWhen: (previous, current) {
                  return current.maybeMap(
                    update: (value) {
                      final prev = previous.maybeMap(
                        update: (value) => value,
                        orElse: () => null,
                      );
                      if (prev == null) return true;

                      final prevValues = T == Beer ? prev.beers : prev.wines;
                      final currentValues =
                          T == Beer ? value.beers : value.wines;

                      final prevValue = prevValues.firstWhere(
                          (element) => element.id == widget.item.id);
                      final currValue = currentValues.firstWhere(
                          (element) => element.id == widget.item.id);

                      if (currValue != prevValue) {
                        updatedItem = currValue;
                        return true;
                      }
                      return false;
                    },
                    orElse: () => false,
                  );
                },
                builder: (context, state) {
                  return state.maybeMap(
                    update: (value) {
                      return Column(
                        children: List.generate(
                          Rating.values.length,
                          (index) {
                            final rating =
                                Rating.values[Rating.values.length - index - 1];
                            final votes = updatedItem.ratings
                                .where((element) =>
                                    element.rating.value == rating.value)
                                .length;
                            return Padding(
                              padding: EdgeInsets.only(top: index == 0 ? 0 : 4),
                              child: _RateBar(
                                rating: rating,
                                votes: votes,
                                maxVotes: _allUsers.length,
                              ),
                            );
                          },
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

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }

  void _handlePress() {
    showModalBottomSheet(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<ItemsBloc>(),
        child: _RatableItemBottomSheet(item: updatedItem),
      ),
      backgroundColor: MaterialTheme.darkScheme().surfaceContainer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
    );
  }

  void _handleLongPress() {
    final overlay =
        Overlay.of(context).context.findRenderObject()! as RenderBox;

    showMenu(
      context: context,
      position: RelativeRect.fromRect(
        // smaller rect, the touch area
        _tapPosition! & const Size(40, 40),

        // Bigger rect, the entire screen
        Offset.zero & overlay.size,
      ),
      items: [
        PopupMenuItem(
          value: 1,
          height: 32,
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => BlocProvider.value(
                value: context.read<ItemsBloc>(),
                child: BlocBuilder<ItemsBloc, ItemsState>(
                  buildWhen: (previous, current) => current.maybeMap(
                    update: (value) => true,
                    orElse: () => false,
                  ),
                  builder: (_, state) {
                    return state.maybeMap(
                      update: (value) {
                        final item = T == Beer
                            ? value.beers.firstWhere(
                                (element) => element.id == widget.item.id)
                            : value.wines.firstWhere(
                                (element) => element.id == widget.item.id);
                        return _EditRatableItemBottomSheet(item: item);
                      },
                      orElse: () => const SizedBox(),
                    );
                  },
                ),
              ),
              backgroundColor: MaterialTheme.darkScheme().surfaceContainer,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
            );
          },
          child: Row(
            children: [
              Icon(
                Icons.edit_rounded,
                color: context.colorScheme.onSurface,
                size: context.textTheme.bodyLarge?.fontSize,
              ),
              width10,
              Text(
                'Modifica',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: 2,
          height: 32,
          onTap: () {},
          child: Row(
            children: [
              Icon(
                Icons.delete_rounded,
                color: context.colorScheme.tertiary,
                size: context.textTheme.bodyLarge?.fontSize,
              ),
              width10,
              Text(
                'Elimina',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.tertiary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
