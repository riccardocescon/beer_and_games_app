import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/item.dart';
import 'package:beer_and_games/theme.dart';
import 'package:flutter/material.dart';

class StatsItem extends StatelessWidget {
  const StatsItem({
    super.key,
    required this.item,
    this.itemWidth = 80,
    this.itemHeight = 110,
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
