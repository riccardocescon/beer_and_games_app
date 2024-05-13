part of 'homepage_content.dart';

class _GamesRow extends StatelessWidget {
  const _GamesRow();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageBloc, HomepageState>(
      buildWhen: (previous, current) => current.maybeMap(
        showGames: (value) => true,
        orElse: () => false,
      ),
      builder: (context, state) {
        final heigth = state.maybeMap(
          showGames: (value) => value.games == null ? 0.0 : 200.0,
          orElse: () => 0.0,
        );
        final showGames = state.maybeMap(
          showGames: (value) => value,
          orElse: () => null,
        );
        final games = showGames?.games;
        final itemCount = showGames == null
            ? 0
            : showGames.isDownloading
                ? 4
                : games?.length ?? 0;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOutCubic,
          height: heigth,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.only(right: index == itemCount - 1 ? 0 : 16),
                child: showGames!.isDownloading
                    ? _loading()
                    : GameItemCard(
                        game: games![index],
                        onTapDown: null,
                        onPress: null,
                        onLongPress: null,
                      ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _loading() {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        child: const SizedBox.square(
          dimension: 32,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
