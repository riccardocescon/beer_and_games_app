part of 'package:beer_and_games/features/beer_and_games/presentation/pages/hangout_stats_page.dart';

class _ItemGroupSection extends StatelessWidget {
  const _ItemGroupSection({
    required this.title,
    required this.items,
    required this.maxWidth,
  });

  final double maxWidth;
  final String title;
  final List<Item> items;

  final _itemLength = 80.0;
  final _itemHeight = 110.0;
  final _itemPadding = 10.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _titleRow(context),
        height10,
        _itemsRow(context),
        height5,
        _showMoreButton(context),
      ],
    );
  }

  Widget _titleRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.textTheme.titleLarge),
        SizedBox.square(
          dimension: 20,
          child: FilledButton(
            onPressed: () {
              if (items is List<Beer>) {
                context
                    .read<HangoutStatsPageBloc>()
                    .add(const HangoutStatsPageEvent.addBeer());
              } else if (items is List<Wine>) {
                context
                    .read<HangoutStatsPageBloc>()
                    .add(const HangoutStatsPageEvent.addWine());
              } else {
                context.warningSnackbar('Work in progress', 'Coming soon!');
              }
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              foregroundColor:
                  MaterialStateProperty.all(context.colorScheme.onPrimary),
            ),
            child: const Icon(
              Icons.add_rounded,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget _itemsRow(BuildContext context) {
    return FillHorizontalRow(
      maxWidth: maxWidth,
      itemWidth: _itemLength,
      padding: _itemPadding,
      itemsCount: items.length,
      paddingBuilder: (context, index, maxItems) =>
          index == 0 ? EdgeInsets.zero : EdgeInsets.only(left: _itemPadding),
      builder: (context, index, maxItems) {
        return GestureDetector(
          onTap: () => _showMore(context),
          child: StatsItem(
            itemWidth: _itemLength,
            itemHeight: _itemHeight,
            item: items[index],
          ),
        );
      },
    );
  }

  Widget _showMoreButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () => _showMore(context),
          child: Text(
            'Vedi di più',
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }

  void _showMore(BuildContext context) {
    if (items is List<Beer>) {
      context.push(
        BlocProvider.value(
          value: context.read<ItemsBloc>(),
          child: RatingItemsPage(items: items as List<Beer>),
        ),
      );
    } else if (items is List<Wine>) {
      context.push(
        BlocProvider.value(
          value: context.read<ItemsBloc>(),
          child: RatingItemsPage(items: items as List<Wine>),
        ),
      );
    } else {
      context.push(
        BlocProvider.value(
          value: context.read<ItemsBloc>(),
          child: GamesItemPage(games: items as List<Game>),
        ),
      );
    }
  }
}
