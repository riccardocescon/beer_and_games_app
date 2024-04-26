part of 'top_area.dart';

class _UsersVotesArea extends StatelessWidget {
  const _UsersVotesArea();

  final _homepageSidePadding = 24.0;
  final _topAreaSidePadding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _homepageSidePadding - _topAreaSidePadding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: BlocBuilder<HomepageBloc, HomepageState>(
              buildWhen: (previous, current) => current.maybeMap(
                loaded: (state) => true,
                orElse: () => false,
              ),
              builder: (context, state) {
                final users = state.maybeMap(
                  loaded: (state) => state.hangout.presentUsers,
                  orElse: () => <User>[],
                );
                return _UserVoteItem(
                  users: users,
                  backgroundColor: context.colorScheme.inversePrimary,
                  avatarColor: context.colorScheme.primary,
                  onAvatarColor: context.colorScheme.onPrimary,
                );
              },
            ),
          ),
          width10,
          Expanded(
            child: BlocBuilder<HomepageBloc, HomepageState>(
              buildWhen: (previous, current) => current.maybeMap(
                loaded: (state) => true,
                orElse: () => false,
              ),
              builder: (context, state) {
                final users = state.maybeMap(
                  loaded: (state) => state.hangout.waitingUsers,
                  orElse: () => <User>[],
                );
                return _UserVoteItem(
                  users: users,
                  backgroundColor: context.colorScheme.secondaryContainer,
                  avatarColor: context.colorScheme.secondary,
                  onAvatarColor: context.colorScheme.onSecondary,
                );
              },
            ),
          ),
          width10,
          Expanded(
            child: BlocBuilder<HomepageBloc, HomepageState>(
              buildWhen: (previous, current) => current.maybeMap(
                loaded: (state) => true,
                orElse: () => false,
              ),
              builder: (context, state) {
                final users = state.maybeMap(
                  loaded: (state) => state.hangout.absentUsers,
                  orElse: () => <User>[],
                );
                return _UserVoteItem(
                  users: users,
                  backgroundColor: context.colorScheme.tertiaryContainer,
                  avatarColor: context.colorScheme.tertiary,
                  onAvatarColor: context.colorScheme.onTertiary,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
