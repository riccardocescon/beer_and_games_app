part of 'package:beer_and_games/features/beer_and_games/presentation/pages/rating_items_page.dart';

class _UserVoteDialog extends StatelessWidget {
  const _UserVoteDialog({
    required this.rating,
    required this.users,
  });

  final Rating rating;
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Voti',
        style: TextStyle(color: context.colorScheme.primary),
      ),
      content: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: List.generate(
            users.length, (index) => _avatar(context, users[index])),
      ),
    );
  }

  Widget _avatar(BuildContext context, User user) {
    return Tooltip(
      message: user.email,
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: rating.backgroundColor,
        ),
        child: Center(
          child: Text(
            user.letters,
            style: TextStyle(
              color: rating.color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
