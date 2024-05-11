import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/core/widgets/hangout_app_bar.dart';
import 'package:beer_and_games/core/widgets/item_bottom_sheet.dart';
import 'package:beer_and_games/core/widgets/items_list.dart';
import 'package:beer_and_games/core/widgets/spacers.dart';
import 'package:beer_and_games/core/widgets/stats_item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/game.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/items/items_bloc.dart';
import 'package:beer_and_games/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../widgets/games_item_page/game_item.dart';
part '../widgets/games_item_page/played_item_bottom_sheet.dart';
part '../widgets/games_item_page/played_item_bottom_sheet_content.dart';

class GamesItemPage extends StatelessWidget {
  const GamesItemPage({super.key, required this.games});

  final List<Game> games;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hangoutAppBar(context, title: 'Giochi'),
      body: ItemsList(
        children: games.map((game) => _GameItem(game: game)).toList(),
      ),
    );
  }
}
