import 'dart:typed_data';

import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/core/widgets/spacers.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/item.dart';
import 'package:flutter/material.dart';

class ItemBottomSheet extends StatelessWidget {
  const ItemBottomSheet({
    super.key,
    required this.item,
    required this.description,
    required this.bottomSheetHeigth,
    required this.child,
  });

  final Item item;
  final String description;
  final double bottomSheetHeigth;
  final Widget child;

  final _titleHeigth = 100.0;
  final _padding = 32.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: _titleHeigth + bottomSheetHeigth + 20 + _padding * 2,
      padding: EdgeInsets.all(_padding),
      child: Column(
        children: [
          _titleIcon(context),
          height20,
          child,
        ],
      ),
    );
  }

  Widget _titleIcon(BuildContext context) {
    return SizedBox(
      height: _titleHeigth,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: context.colorScheme.primary,
                  ),
                ),
                Text(
                  description,
                  style: context.textTheme.labelSmall,
                )
              ],
            ),
          ),
          width20,
          item.imageBytes == null
              ? const SizedBox.shrink()
              : SizedBox.square(
                  dimension: 72,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.memory(
                      Uint8List.fromList(item.imageBytes!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
