import 'package:beer_and_games/core/animations/formula.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/widgets/homepage/content/homepage_content.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/widgets/homepage/top_area/top_area.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverLayoutBuilder(
                builder: (context, constraints) {
                  final x = _scrollController.offset;
                  final maxHeight = constraints.crossAxisExtent * 0.6;
                  final scale = linearDecrease(x: x, maxValue: maxHeight)
                      .clamp(0.01, 1.0);
                  final opacity = linearDecrease(x: x, maxValue: maxHeight)
                      .clamp(0.01, 1.0);
                  final maxWidth = (constraints.crossAxisExtent / 3) - 10 * 2;
                  return SliverToBoxAdapter(
                    child: Transform.scale(
                      scale: scale,
                      alignment: Alignment.bottomCenter,
                      child: Opacity(
                        opacity: opacity,
                        child: SizedBox(
                          height: maxHeight,
                          child: TopArea(maxWidth: maxWidth),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ];
          },
          body: CustomScrollView(
            slivers: [
              SliverLayoutBuilder(
                builder: (context, constraints) {
                  return const SliverFillRemaining(
                    hasScrollBody: false,
                    child: HomepageContent(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
