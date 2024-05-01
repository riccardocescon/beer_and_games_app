part of 'package:beer_and_games/features/beer_and_games/presentation/pages/rating_items_page.dart';

class _BottomSheetRatableBar extends StatelessWidget {
  const _BottomSheetRatableBar({
    required this.ratings,
    required this.users,
  });

  final List<UserRating> ratings;
  final List<User> users;

  final _avatarSize = 20.0;
  final _avatarSpacing = 2.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _usersArea(context),
        _bar(),
      ],
    );
  }

  Widget _usersArea(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(
          children: List.generate(
            Rating.values.length,
            (index) => _userVoteAreaItem(context, Rating.values[index]),
          ),
        ),
      ),
    );
  }

  Widget _userVoteAreaItem(BuildContext context, Rating rating) {
    final currentRatings =
        ratings.where((element) => element.rating == rating).toList();
    final ratingUsers = users
        .where((element) =>
            currentRatings.any((rat) => rat.userEmail == element.email))
        .toList();
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          showGeneralDialog(
            context: context,
            barrierDismissible: true,
            barrierLabel:
                MaterialLocalizations.of(context).modalBarrierDismissLabel,
            pageBuilder: (context, _, __) {
              return _UserVoteDialog(
                rating: rating,
                users: ratingUsers,
              );
            },
          );
        },
        child: LayoutBuilder(builder: (context, constraints) {
          final maxColumns =
              constraints.maxWidth ~/ (_avatarSize + _avatarSpacing);
          final maxRows =
              constraints.maxHeight ~/ (_avatarSize + _avatarSpacing);
          final maxUsers = maxColumns * maxRows;
          final showUsers = min(ratingUsers.length, maxUsers);

          final overflowUsers = ratingUsers.length - showUsers;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: _avatarSpacing,
                runSpacing: _avatarSpacing,
                children: List.generate(
                  showUsers,
                  (index) {
                    final shouldOverflow = showUsers == maxUsers &&
                        index == maxUsers - 1 &&
                        overflowUsers > 0;
                    return Container(
                      height: _avatarSize,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: rating.backgroundColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        shouldOverflow
                            ? '+$overflowUsers'
                            : ratingUsers[index].letters,
                        style: context.textTheme.labelSmall?.copyWith(
                          color: rating.color,
                          fontSize: 8,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _bar() {
    return Row(
      children: List.generate(
        Rating.values.length,
        (index) => _button(Rating.values[index]),
      ),
    );
  }

  Widget _button(Rating rating) {
    final topLeft = rating == Rating.hate ? 24.0 : 0.0;
    final bottomLeft = rating == Rating.hate ? 24.0 : 0.0;
    final topRight = rating == Rating.love ? 24.0 : 0.0;
    final bottomRight = rating == Rating.love ? 24.0 : 0.0;
    return Expanded(
      child: FilledButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(rating.backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeft),
                bottomLeft: Radius.circular(bottomLeft),
                topRight: Radius.circular(topRight),
                bottomRight: Radius.circular(bottomRight),
              ),
            ),
          ),
        ),
        child: Image.asset(rating.iconPath),
      ),
    );
  }
}
