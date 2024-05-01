part of 'package:beer_and_games/features/beer_and_games/presentation/pages/rating_items_page.dart';

class _RatableItem extends StatelessWidget {
  const _RatableItem({
    required this.item,
  });

  final RateableItem item;

  final _itemWidth = 100.0;

  List<User> get _allUsers => sl<HangoutBloc>().hangout!.allUsers;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _itemWidth,
      child: FilledButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => _RatableItemBottomSheet(item: item),
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
            StatsItem(
              item: item,
              itemWidth: _itemWidth,
            ),
            height10,
            Column(
              children: List.generate(
                Rating.values.length,
                (index) => Padding(
                  padding: EdgeInsets.only(top: index == 0 ? 0 : 4),
                  child: _RateBar(
                    rating: Rating.values[Rating.values.length - index - 1],
                    votes: item.ratings
                        .where((element) => element.rating.value == index + 1)
                        .length,
                    maxVotes: _allUsers.length,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
