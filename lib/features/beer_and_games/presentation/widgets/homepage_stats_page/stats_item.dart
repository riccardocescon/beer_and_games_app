part of 'package:beer_and_games/features/beer_and_games/presentation/pages/hangout_stats_page.dart';

class _StatsItem extends StatelessWidget {
  const _StatsItem({
    required this.item,
    required this.itemWidth,
    required this.itemHeight,
  });

  final Item item;
  final double itemWidth, itemHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: itemWidth,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: MaterialTheme.darkScheme().surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _image(),
          _name(context),
        ],
      ),
    );
  }

  Widget _image() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: itemWidth,
        height: itemWidth,
        color: MaterialTheme.darkScheme().surfaceContainerHigh,
        child: item.imageBytes == null
            ? const SizedBox.shrink()
            : Image.memory(item.imageBytes!, fit: BoxFit.cover),
      ),
    );
  }

  Widget _name(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Center(
        child: Text(
          item.name,
          style: context.textTheme.labelSmall,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ),
    );
  }
}
