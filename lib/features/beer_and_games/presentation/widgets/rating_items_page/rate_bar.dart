part of 'package:beer_and_games/features/beer_and_games/presentation/pages/rating_items_page.dart';

class _RateBar extends StatelessWidget {
  const _RateBar({
    required this.rating,
    required this.votes,
    required this.maxVotes,
  });

  final Rating rating;
  final int votes;
  final int maxVotes;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: double.maxFinite,
          height: 16,
          decoration: BoxDecoration(
            color: rating.backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutCubic,
          width: votes / maxVotes * 100,
          height: 16,
          decoration: BoxDecoration(
            color: rating.color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Positioned(
          left: 4,
          child: Image.asset(
            rating.iconPath,
            width: 12,
            height: 12,
          ),
        ),
        Center(
          child: Text(
            '$votes/$maxVotes',
            style: context.textTheme.labelSmall?.copyWith(
              fontSize: 10,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
