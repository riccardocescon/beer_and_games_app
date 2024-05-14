import 'package:beer_and_games/core/animations/formula.dart';
import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/core/widgets/fill_horizontal_row.dart';
import 'package:beer_and_games/core/widgets/hangout_app_bar.dart';
import 'package:beer_and_games/core/widgets/scale_animator.dart';
import 'package:beer_and_games/core/widgets/spacers.dart';
import 'package:beer_and_games/core/widgets/static_bottom_sheet.dart';
import 'package:beer_and_games/core/widgets/stats_item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/ratable_item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/beer.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/game.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/user.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/wine.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/items/items_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/hangout_stats_page/hangout_stats_page_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/pages/games_item_page.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/pages/rating_items_page.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/widgets/homepage_stats_page/new_game_item_body.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/widgets/homepage_stats_page/new_item_body.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../widgets/homepage_stats_page/users_stats_graph.dart';
part '../widgets/homepage_stats_page/items_stats_list.dart';
part '../widgets/homepage_stats_page/item_group_section.dart';

class HangoutStatsPage extends StatefulWidget {
  const HangoutStatsPage({super.key});

  @override
  State<HangoutStatsPage> createState() => _HangoutStatsPageState();
}

class _HangoutStatsPageState extends State<HangoutStatsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hangoutAppBar(context, title: 'Statistiche'),
      body: BlocBuilder<HangoutStatsPageBloc, HangoutStatsPageState>(
        buildWhen: (previous, current) => current.maybeMap(
          hangout: (value) => true,
          orElse: () => false,
        ),
        builder: (context, state) {
          return state.maybeMap(
            hangout: (value) {
              return BlocBuilder<HangoutStatsPageBloc, HangoutStatsPageState>(
                buildWhen: (previous, current) => current.maybeMap(
                  updateUI: (value) {
                    final prevState = previous.maybeMap(
                      updateUI: (value) => value,
                      orElse: () => null,
                    );
                    if (prevState == null) return true;

                    return prevState.addWine != value.addWine ||
                        prevState.addBeer != value.addBeer ||
                        prevState.addGame != value.addGame;
                  },
                  orElse: () => false,
                ),
                builder: (context, state) {
                  final isAdd = state.maybeMap(
                    updateUI: (value) =>
                        value.addBeer || value.addWine || value.addGame,
                    orElse: () => false,
                  );
                  return NestedScrollView(
                    controller: _scrollController,
                    physics: const NeverScrollableScrollPhysics(),
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverLayoutBuilder(
                          builder: (context, constraints) {
                            final x = _scrollController.offset;
                            final maxHeight = constraints.crossAxisExtent * 0.6;
                            final scale =
                                linearDecrease(x: x, maxValue: maxHeight)
                                    .clamp(0.01, 1.0);
                            final opacity =
                                linearDecrease(x: x, maxValue: maxHeight)
                                    .clamp(0.01, 1.0);
                            return SliverToBoxAdapter(
                              child: Transform.scale(
                                scale: scale,
                                alignment: Alignment.bottomCenter,
                                child: Opacity(
                                  opacity: opacity,
                                  child: SizedBox(
                                    height: maxHeight,
                                    child: _UsersStatsGraph(
                                      users: value.hangout.allUsers,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ];
                    },
                    body: state.maybeMap(
                      updateUI: (value) {
                        final itemChild = isAdd
                            ? value.addBeer
                                ? _addItem<Beer>()
                                : value.addWine
                                    ? _addItem<Wine>()
                                    : _addGame()
                            : _categoriesList();
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          switchInCurve: Curves.easeInOutCubic,
                          switchOutCurve: Curves.easeInOutCubic,
                          child: itemChild,
                        );
                      },
                      orElse: () => _categoriesList(),
                    ),
                  );
                },
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _categoriesList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: LayoutBuilder(
            builder: (x, constraints) {
              return _ItemsStatsList(
                maxWidth: constraints.maxWidth,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _addItem<T extends RateableItem>() {
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => context.read<HangoutStatsPageBloc>().add(
                  const HangoutStatsPageEvent.closeItem(),
                ),
            child: Container(),
          ),
        ),
        NewRatableItemBody<T>(),
      ],
    );
  }

  Widget _addGame() {
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => context.read<HangoutStatsPageBloc>().add(
                  const HangoutStatsPageEvent.closeItem(),
                ),
            child: Container(),
          ),
        ),
        const NewGameItemBody(),
      ],
    );
  }
}
