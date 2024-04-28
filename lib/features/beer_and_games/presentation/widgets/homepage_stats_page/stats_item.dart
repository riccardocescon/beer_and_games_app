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
    return Container(
      width: itemWidth,
      height: itemWidth,
      decoration: BoxDecoration(
        color: MaterialTheme.darkScheme().surfaceContainerHigh,
        borderRadius: BorderRadius.circular(16),
      ),
      child: item.imageUrl == null
          ? const SizedBox.shrink()
          : Image.network(
              item.imageUrl!,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
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
