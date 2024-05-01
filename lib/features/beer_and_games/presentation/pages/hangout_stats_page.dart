import 'dart:developer';

import 'package:beer_and_games/core/animations/formula.dart';
import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/core/widgets/fill_horizontal_row.dart';
import 'package:beer_and_games/core/widgets/hangout_app_bar.dart';
import 'package:beer_and_games/core/widgets/spacers.dart';
import 'package:beer_and_games/core/widgets/static_bottom_sheet.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/user.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/wine.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/items/items_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/hangout_stats_page/hangout_stats_page_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/homepage/homepage_bloc.dart';
import 'package:beer_and_games/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../widgets/homepage_stats_page/users_stats_graph.dart';
part '../widgets/homepage_stats_page/items_stats_list.dart';
part '../widgets/homepage_stats_page/item_group_section.dart';
part '../widgets/homepage_stats_page/stats_item.dart';

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
              return NestedScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverLayoutBuilder(
                      builder: (context, constraints) {
                        final x = _scrollController.offset;
                        final maxHeight = constraints.crossAxisExtent * 0.6;
                        final scale = linearDecrease(x: x, maxValue: maxHeight)
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
                body: CustomScrollView(
                  slivers: [
                    SliverLayoutBuilder(
                      builder: (context, constraints) {
                        return SliverFillRemaining(
                          hasScrollBody: false,
                          child: _ItemsStatsList(
                            maxWidth: constraints.crossAxisExtent,
                            onExpand: () {},
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
