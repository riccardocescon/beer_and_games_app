import 'dart:math';

import 'package:flutter/material.dart';

class FillHorizontalRow extends StatelessWidget {
  const FillHorizontalRow({
    super.key,
    required this.maxWidth,
    required this.itemWidth,
    required this.padding,
    required this.itemsCount,
    required this.paddingBuilder,
    required this.builder,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.overflowBuilder,
  });

  final double itemWidth, padding, maxWidth;
  final int itemsCount;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsets Function(BuildContext context, int index, int maxItems)
      paddingBuilder;
  final Widget Function(BuildContext context, int maxItems)? overflowBuilder;
  final Widget Function(BuildContext context, int index, int maxItems) builder;

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = (maxWidth ~/ (itemWidth + padding));
    final maxItems = min(itemsCount, crossAxisCount);
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: List.generate(
          maxItems,
          (index) {
            bool isOverflow = false;

            final showItem = index < itemsCount;

            if (!showItem) return const SizedBox.shrink();

            if (overflowBuilder != null) {
              isOverflow = index == maxItems - 1 && itemsCount > maxItems;
            }

            return Padding(
              padding: paddingBuilder(context, index, maxItems),
              child: isOverflow
                  ? overflowBuilder?.call(context, maxItems)
                  : builder(context, index, maxItems),
            );
          },
        ),
      ),
    );
  }
}
