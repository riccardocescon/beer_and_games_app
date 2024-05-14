import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/core/mixin/edit_delete_item_menu_poppable.dart';
import 'package:beer_and_games/core/widgets/bottom_editable_game_item.dart';
import 'package:beer_and_games/core/widgets/game_item_card.dart';
import 'package:beer_and_games/core/widgets/hangout_app_bar.dart';
import 'package:beer_and_games/core/widgets/item_bottom_sheet.dart';
import 'package:beer_and_games/core/widgets/items_list.dart';
import 'package:beer_and_games/core/widgets/scale_animator.dart';
import 'package:beer_and_games/core/widgets/spacers.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/game.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/items/items_bloc.dart';
import 'package:beer_and_games/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../widgets/games_item_page/game_item.dart';
part '../widgets/games_item_page/played_item_bottom_sheet.dart';
part '../widgets/games_item_page/played_item_bottom_sheet_content.dart';
part '../widgets/games_item_page/edit_game_bottom_sheet.dart';

class GamesItemPage extends StatefulWidget {
  const GamesItemPage({super.key, required this.games});

  final List<Game> games;

  @override
  State<GamesItemPage> createState() => _GamesItemPageState();
}

class _GamesItemPageState extends State<GamesItemPage> {
  late final updatedItems = widget.games.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hangoutAppBar(context, title: 'Giochi'),
      body: BlocBuilder<ItemsBloc, ItemsState>(
        buildWhen: (previous, current) {
          return current.maybeMap(
            update: (value) {
              final prevItems = previous.maybeMap(
                update: (value) => value.games,
                orElse: () => null,
              );
              if (prevItems == null) return true;

              final receivedItems = value.games;

              final newGames = receivedItems.where((element) {
                return !updatedItems.map((e) => e.id).contains(element.id);
              }).toList();
              updatedItems.addAll(newGames);

              final removedGames = updatedItems
                  .where((element) =>
                      !receivedItems.map((e) => e.id).contains(element.id))
                  .toList();
              updatedItems.removeWhere((element) =>
                  removedGames.map((e) => e.id).contains(element.id));

              return newGames.isNotEmpty || removedGames.isNotEmpty;
            },
            orElse: () => false,
          );
        },
        builder: (context, state) {
          return ItemsList(
            children: updatedItems
                .map(
                  (game) => _GameItem(
                    game: game,
                    animationDelay: Duration(
                      milliseconds: (updatedItems.indexOf(game) * 100) + 100,
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
