part of 'package:beer_and_games/features/beer_and_games/presentation/pages/hangout_stats_page.dart';

class _ItemsStatsList extends StatelessWidget {
  const _ItemsStatsList({
    required this.onExpand,
  });

  final VoidCallback onExpand;

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
            child: ListView(
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
    return _ItemGroupSection(
      title: 'Giochi',
      items: [
        Game(
          name: 'Unstable Unicorns',
          minplayers: 2,
          maxplayers: 4,
          onlyMinMaxPlayers: true,
        ),
        Game(
          name: 'War Chest',
          minplayers: 2,
          maxplayers: 4,
          onlyMinMaxPlayers: true,
        ),
        Game(
          name: 'War Chest',
          minplayers: 2,
          maxplayers: 4,
          onlyMinMaxPlayers: true,
        ),
        Game(
          name: 'War Chest',
          minplayers: 2,
          maxplayers: 4,
          onlyMinMaxPlayers: true,
        ),
        Game(
          name: 'War Chest',
          minplayers: 2,
          maxplayers: 4,
          onlyMinMaxPlayers: true,
        )
      ],
    );
  }

  Widget _beerList() {
    return _ItemGroupSection(
      title: 'Birre',
      items: [
        Beer(
          name: 'Leffe',
          imageUrl: null,
          ratings: [],
        ),
        Beer(
          name: 'Leffe',
          imageUrl: null,
          ratings: [],
        ),
        Beer(
          name: 'Leffe',
          imageUrl: null,
          ratings: [],
        ),
        Beer(
          name: 'Leffe',
          imageUrl: null,
          ratings: [],
        ),
        Beer(
          name: 'Leffe',
          imageUrl: null,
          ratings: [],
        ),
      ],
    );
  }

  Widget _wineList() {
    return _ItemGroupSection(
      title: 'Vino',
      items: [
        Wine(
          name: 'Merlot',
          imageUrl: null,
          ratings: [],
        ),
        Wine(
          name: 'Merlot',
          imageUrl: null,
          ratings: [],
        ),
        Wine(
          name: 'Merlot',
          imageUrl: null,
          ratings: [],
        ),
        Wine(
          name: 'Merlot',
          imageUrl: null,
          ratings: [],
        ),
        Wine(
          name: 'Merlot',
          imageUrl: null,
          ratings: [],
        ),
      ],
    );
  }
}
