part of 'package:beer_and_games/features/beer_and_games/presentation/pages/games_item_page.dart';

class _PlayedItemBottomSheet extends StatelessWidget {
  const _PlayedItemBottomSheet({required this.game});

  final Game game;

  final _bottomSheetHeigth = 50.0;

  @override
  Widget build(BuildContext context) {
    return ItemBottomSheet(
      item: game,
      description: 'Segna le volte in cui avete giocato a questo gioco\n'
          'Puoi aggiornare il conteggio in un momento qualsiasi',
      bottomSheetHeigth: _bottomSheetHeigth,
      child: SizedBox(
        height: _bottomSheetHeigth,
        child: _PlayedItemBottomSheetContent(game: game),
      ),
    );
  }
}
