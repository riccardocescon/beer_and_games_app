import 'dart:math';

import 'package:beer_and_games/core/enums/rating.dart';
import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/core/extentions/list_extensions.dart';
import 'package:beer_and_games/core/extentions/rating_extentions.dart';
import 'package:beer_and_games/core/mixin/edit_delete_item_menu_poppable.dart';
import 'package:beer_and_games/core/widgets/hangout_app_bar.dart';
import 'package:beer_and_games/core/widgets/item_bottom_sheet.dart';
import 'package:beer_and_games/core/widgets/items_list.dart';
import 'package:beer_and_games/core/widgets/scale_animator.dart';
import 'package:beer_and_games/core/widgets/spacers.dart';
import 'package:beer_and_games/core/widgets/stats_item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/ratable_item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/beer.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/user.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/wine.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/hangout/hangout_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/items/items_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/user_bloc.dart/user_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/widgets/rating_items_page/edit_ratable_item_bottom_sheet.dart';
import 'package:beer_and_games/injection_container.dart';
import 'package:beer_and_games/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part '../widgets/rating_items_page/ratable_item.dart';
part '../widgets/rating_items_page/rate_bar.dart';
part '../widgets/rating_items_page/ratable_item_bottom_sheet.dart';
part '../widgets/rating_items_page/bottom_sheet_ratable_bar.dart';
part '../widgets/rating_items_page/bottom_sheet_bar_button.dart';
part '../widgets/rating_items_page/user_vote_dialog.dart';

class RatingItemsPage extends StatefulWidget {
  const RatingItemsPage({super.key, required this.items});

  final List<RateableItem> items;

  @override
  State<RatingItemsPage> createState() => _RatingItemsPageState();
}

class _RatingItemsPageState extends State<RatingItemsPage> {
  String get _title => widget.items is List<Beer> ? 'Birre' : 'Vini';

  List<Widget> get items {
    return updatedItems is List<Beer>
        ? updatedItems
            .map((item) => _RatableItem<Beer>(
                  item: item,
                  animationDelay: Duration(
                      milliseconds: (updatedItems.indexOf(item) * 100) + 100),
                ))
            .toList()
        : updatedItems
            .map((item) => _RatableItem<Wine>(
                  item: item,
                  animationDelay: Duration(
                      milliseconds: (updatedItems.indexOf(item) * 100) + 100),
                ))
            .toList();
  }

  late final updatedItems = widget.items.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hangoutAppBar(context, title: _title),
      body: BlocBuilder<ItemsBloc, ItemsState>(
        buildWhen: (previous, current) {
          return current.maybeMap(
            update: (value) {
              final receivedItems =
                  updatedItems is List<Beer> ? value.beers : value.wines;

              final newBeers = receivedItems.where((element) {
                return !updatedItems.map((e) => e.id).contains(element.id);
              }).toList();
              updatedItems.addAll(newBeers);

              final removedBeers = updatedItems
                  .where((element) =>
                      !receivedItems.map((e) => e.id).contains(element.id))
                  .toList();
              updatedItems.removeWhere((element) =>
                  removedBeers.map((e) => e.id).contains(element.id));

              return newBeers.isNotEmpty || removedBeers.isNotEmpty;
            },
            orElse: () => false,
          );
        },
        builder: (context, state) {
          return ItemsList(children: items);
        },
      ),
    );
  }
}
