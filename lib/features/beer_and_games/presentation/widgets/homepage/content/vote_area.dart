part of 'homepage_content.dart';

class _VoteArea extends StatelessWidget {
  const _VoteArea();

  User get me => sl<UserBloc>().user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: _VoteButton(presenceState: PresenceState.present),
        ),
        width10,
        const Expanded(
          child: _VoteButton(presenceState: PresenceState.waiting),
        ),
        width10,
        const Expanded(
          child: _VoteButton(presenceState: PresenceState.absent),
        ),
      ],
    );
  }
}
