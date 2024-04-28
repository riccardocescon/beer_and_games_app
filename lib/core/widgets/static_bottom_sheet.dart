import 'package:beer_and_games/theme.dart';
import 'package:flutter/material.dart';

class StaticBottomSheet extends StatelessWidget {
  const StaticBottomSheet({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: MaterialTheme.darkScheme().surfaceContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24 * 2),
          topRight: Radius.circular(24 * 2),
        ),
      ),
      child: child,
    );
  }
}
