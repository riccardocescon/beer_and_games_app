part of 'package:beer_and_games/features/beer_and_games/presentation/pages/rating_items_page.dart';

class _RatableItem<T extends RateableItem> extends StatefulWidget {
  const _RatableItem({required this.item});

  final RateableItem item;

  @override
  State<_RatableItem<T>> createState() => _RatableItemState<T>();
}

class _RatableItemState<T extends RateableItem> extends State<_RatableItem<T>>
    with EditDeleteItemMenuPoppable {
  final _itemWidth = 100.0;

  late RateableItem updatedItem = widget.item;

  List<User> get _allUsers => sl<HangoutBloc>().hangout!.allUsers;

  // Offset? _tapPosition;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _itemWidth,
      child: GestureDetector(
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

                      final prevValue = prevValues.firstWhereOrNull(
                          (element) => element.id == widget.item.id);
                      final currValue = currentValues.firstWhereOrNull(
                          (element) => element.id == widget.item.id);

                      if (prevValue == null || currValue == null) return true;

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
    return handleLongPress(
      context: context,
      updatedItem: updatedItem,
      onShowModalBottomSheet: (value) {
        final item = T == Beer
            ? value.beers.firstWhere((element) => element.id == widget.item.id)
            : value.wines.firstWhere((element) => element.id == widget.item.id);
        return EditRatableItemBottomSheet(item: item);
      },
    );
  }
}
