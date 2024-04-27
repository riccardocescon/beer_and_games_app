import 'package:beer_and_games/features/beer_and_games/presentation/widgets/homepage/content/homepage_content.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/widgets/homepage/top_area/top_area.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TopArea(),
            HomepageContent(),
          ],
        ),
      ),
    );
  }
}
