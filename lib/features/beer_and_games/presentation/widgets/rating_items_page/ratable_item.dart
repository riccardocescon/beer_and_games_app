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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _itemWidth,
      child: FilledButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => _RatableItemBottomSheet(item: updatedItem),
            backgroundColor: MaterialTheme.darkScheme().surfaceContainer,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            ),
          );
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(0),
          ),
          backgroundColor: MaterialStateProperty.all(
            Colors.transparent,
          ),
        ),
        child: Column(
          children: [
            StatsItem(item: widget.item, itemWidth: _itemWidth),
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
                    final currentValues = T == Beer ? value.beers : value.wines;

                    final prevValue = prevValues
                        .firstWhere((element) => element.id == widget.item.id);
                    final currValue = currentValues
                        .firstWhere((element) => element.id == widget.item.id);

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
    );
  }
}
