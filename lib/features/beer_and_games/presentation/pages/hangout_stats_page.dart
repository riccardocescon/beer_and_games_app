import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/core/widgets/hangout_app_bar.dart';
import 'package:beer_and_games/core/widgets/spacers.dart';
import 'package:beer_and_games/features/beer_and_games/data/entities/user.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/hangout_stats_page/hangout_stats_page_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../widgets/homepage_stats_page/users_stats_graph.dart';

class HangoutStatsPage extends StatelessWidget {
  const HangoutStatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hangoutAppBar(context, title: 'Statistiche'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<HangoutStatsPageBloc, HangoutStatsPageState>(
          buildWhen: (previous, current) => current.maybeMap(
            hangout: (value) => true,
            orElse: () => false,
          ),
          builder: (context, state) {
            return state.maybeMap(
              hangout: (value) {
                return Column(
                  children: [
                    height20,
                    Expanded(
                      flex: 4,
                      child: _UsersStatsGraph(users: value.hangout.allUsers),
                    ),
                    height20,
                    Expanded(
                      flex: 9,
                      child: Container(),
                    ),
                  ],
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
