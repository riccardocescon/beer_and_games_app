import 'dart:math';

import 'package:beer_and_games/core/enums/rating.dart';
import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/core/extentions/rating_extentions.dart';
import 'package:beer_and_games/core/widgets/hangout_app_bar.dart';
import 'package:beer_and_games/core/widgets/spacers.dart';
import 'package:beer_and_games/core/widgets/stats_item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/ratable_item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/beer.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/user.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/user_rating.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/hangout/hangout_bloc.dart';
import 'package:beer_and_games/injection_container.dart';
import 'package:beer_and_games/theme.dart';
import 'package:flutter/material.dart';

part '../widgets/rating_items_page/items_list.dart';
part '../widgets/rating_items_page/ratable_item.dart';
part '../widgets/rating_items_page/rate_bar.dart';
part '../widgets/rating_items_page/ratable_item_bottom_sheer.dart';
part '../widgets/rating_items_page/bottom_sheet_ratable_bar.dart';
part '../widgets/rating_items_page/user_vote_dialog.dart';

class RatingItemsPage extends StatelessWidget {
  const RatingItemsPage({super.key, required this.items});

  final List<RateableItem> items;
  String get _title => items is List<Beer> ? 'Birre' : 'Vini';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hangoutAppBar(context, title: _title),
      body: _ItemsList(items: items),
    );
  }
}