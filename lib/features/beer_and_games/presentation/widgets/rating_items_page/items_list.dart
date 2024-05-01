part of 'package:beer_and_games/features/beer_and_games/presentation/pages/rating_items_page.dart';

class _ItemsList extends StatelessWidget {
  const _ItemsList({required this.items});

  final List<RateableItem> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        child: Wrap(
          runSpacing: 40,
          alignment: WrapAlignment.spaceBetween,
          children: items.map((item) => _RatableItem(item: item)).toList(),
        ),
      ),
    );
  }
}
