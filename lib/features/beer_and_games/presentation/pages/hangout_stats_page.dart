import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/core/widgets/fill_horizontal_row.dart';
import 'package:beer_and_games/core/widgets/hangout_app_bar.dart';
import 'package:beer_and_games/core/widgets/spacers.dart';
import 'package:beer_and_games/core/widgets/static_bottom_sheet.dart';
import 'package:beer_and_games/features/beer_and_games/data/entities/abstractions/item.dart';
import 'package:beer_and_games/features/beer_and_games/data/entities/beer.dart';
import 'package:beer_and_games/features/beer_and_games/data/entities/game.dart';
import 'package:beer_and_games/features/beer_and_games/data/entities/user.dart';
import 'package:beer_and_games/features/beer_and_games/data/entities/wine.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/hangout_stats_page/hangout_stats_page_bloc.dart';
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
  bool _expandContent = false;

  final _animationDuration = const Duration(milliseconds: 200);
  final _animationCurve = Curves.easeInOutCubic;

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
              return LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      height20,
                      _appearDisappearAnimator(
                        maxHeight: constraints.maxHeight,
                        child: _UsersStatsGraph(
                          users: value.hangout.allUsers,
                        ),
                      ),
                      height20,
                      Expanded(
                        child: _ItemsStatsList(
                          onExpand: () {
                            setState(() {
                              _expandContent = !_expandContent;
                            });
                          },
                        ),
                      ),
                    ],
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

  Widget _appearDisappearAnimator({
    required double maxHeight,
    required Widget child,
  }) {
    return AnimatedSize(
      duration: _animationDuration,
      curve: _animationCurve,
      child: SizedBox(
        height: _expandContent ? 0 : maxHeight * 0.28,
        child: AnimatedOpacity(
          duration: _animationDuration,
          curve: _animationCurve,
          opacity: _expandContent ? 0 : 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
