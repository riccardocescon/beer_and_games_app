part of 'package:beer_and_games/features/beer_and_games/presentation/pages/rating_items_page.dart';

class _BottomSheetRatableBar extends StatelessWidget {
  const _BottomSheetRatableBar({
    required this.item,
    required this.users,
  });

  final RateableItem item;
  final List<User> users;

  final _avatarSize = 20.0;
  final _avatarSpacing = 2.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _usersArea(context),
        _bar(context),
      ],
    );
  }

  Widget _usersArea(BuildContext context) {
    return Expanded(
      child: Row(
        children: List.generate(
          Rating.values.length,
          (index) => _userVoteAreaItem(context, Rating.values[index]),
        ),
      ),
    );
  }

  Widget _userVoteAreaItem(BuildContext context, Rating rating) {
    final currentRatings =
        item.ratings.where((element) => element.rating == rating).toList();
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
                  maxUsers,
                  (index) {
                    final hidden = index >= showUsers;
                    final shouldOverflow = showUsers == maxUsers &&
                        index == maxUsers - 1 &&
                        overflowUsers > 0;
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      switchInCurve: Curves.easeInOutCubic,
                      switchOutCurve: Curves.easeInOutCubic,
                      child: hidden
                          ? SizedBox.fromSize()
                          : Container(
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

  Widget _bar(BuildContext context) {
    return Row(
      children: List.generate(
        Rating.values.length,
        (index) => _BottomSheetBarButton(
          item: item,
          rating: Rating.values[index],
        ),
      ),
    );
  }
}
