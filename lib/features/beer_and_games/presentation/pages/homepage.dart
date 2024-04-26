import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/core/widgets/spacers.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/widgets/homepage/top_area.dart';
import 'package:beer_and_games/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const TopArea(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: MaterialTheme.darkScheme().surfaceContainer,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(56),
                    topRight: Radius.circular(56),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: _button(context)),
                          width10,
                          Expanded(child: _button(context)),
                          width10,
                          Expanded(child: _button(context)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _button(BuildContext context) {
    return Container(
      height: 56 - 24,
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: const BorderRadius.all(
          Radius.circular(56),
        ),
      ),
    );
  }
}
