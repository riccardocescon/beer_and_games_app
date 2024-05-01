part of 'package:beer_and_games/features/beer_and_games/presentation/pages/hangout_stats_page.dart';

class _ItemsStatsList extends StatelessWidget {
  const _ItemsStatsList({
    required this.onExpand,
    required this.maxWidth,
  });

  final VoidCallback onExpand;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return StaticBottomSheet(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24 * 2),
          topRight: Radius.circular(24 * 2),
        ),
        child: FilledButton(
          onPressed: onExpand,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shape: MaterialStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24 * 2),
                  topRight: Radius.circular(24 * 2),
                ),
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                height20,
                height5,
                _gameList(),
                height10,
                _beerList(),
                height10,
                _wineList(),
                height20,
                height5,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _gameList() {
    return BlocBuilder<ItemsBloc, ItemsState>(
      buildWhen: (previous, current) => current.maybeMap(
        update: (value) => true,
        orElse: () => false,
      ),
      builder: (context, state) {
        return state.maybeMap(
          update: (value) {
            return _ItemGroupSection(
              maxWidth: maxWidth,
              title: 'Giochi',
              items: value.games,
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _beerList() {
    return BlocBuilder<ItemsBloc, ItemsState>(
      buildWhen: (previous, current) => current.maybeMap(
        update: (value) => true,
        orElse: () => false,
      ),
      builder: (context, state) {
        return state.maybeMap(
          update: (value) {
            return _ItemGroupSection(
              maxWidth: maxWidth,
              title: 'Birre',
              items: value.beers,
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _wineList() {
    return BlocBuilder<ItemsBloc, ItemsState>(
      buildWhen: (previous, current) => current.maybeMap(
        update: (value) => true,
        orElse: () => false,
      ),
      builder: (context, state) {
        return state.maybeMap(
          update: (value) {
            return _ItemGroupSection(
              maxWidth: maxWidth,
              title: 'Vino',
              items: value.wines,
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
