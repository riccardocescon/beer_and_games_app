import 'package:beer_and_games/core/enums/presence_state.dart';
import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/core/widgets/game_item_card.dart';
import 'package:beer_and_games/core/widgets/scale_animator.dart';
import 'package:beer_and_games/core/widgets/spacers.dart';
import 'package:beer_and_games/core/widgets/static_bottom_sheet.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/hangout.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/user.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/items/items_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/hangout_stats_page/hangout_stats_page_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/homepage/homepage_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/homepage/widgets/homepage_vote_area_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/user_bloc.dart/user_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/pages/hangout_stats_page.dart';
import 'package:beer_and_games/injection_container.dart';
import 'package:beer_and_games/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'vote_area.dart';
part 'vote_button.dart';
part 'stats_row.dart';
part 'games_row.dart';

class HomepageContent extends StatelessWidget {
  const HomepageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return StaticBottomSheet(
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: BlocBuilder<UserBloc, UserState>(
          buildWhen: (previous, current) {
            return current.maybeMap(
              auth: (value) => value.user != null,
              orElse: () => false,
            );
          },
          builder: (context, state) {
            return state.maybeMap(
              auth: (userValue) {
                return BlocBuilder<HomepageBloc, HomepageState>(
                  buildWhen: (previous, current) => current.maybeMap(
                    loaded: (value) => true,
                    orElse: () => false,
                  ),
                  builder: (context, state) {
                    return state.maybeMap(
                      loaded: (value) {
                        return Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Column(
                                children: [
                                  _voteArea(value.hangout, userValue.user!),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    child: _StatsRow(hangout: value.hangout),
                                  ),
                                ],
                              ),
                            ),
                            const _GamesRow(),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(24 * 2),
                                    topRight: Radius.circular(24 * 2),
                                  ),
                                  color: MaterialTheme.darkScheme()
                                      .surfaceContainerHigh,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                );
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }

  Widget _voteArea(Hangout hangout, User user) {
    return BlocProvider(
      create: (context) => sl<HomepageVoteAreaBloc>()
        ..add(
          HomepageVoteAreaEvent.setup(
            homepageBloc: context.read<HomepageBloc>(),
            hangout: hangout,
            user: user,
          ),
        ),
      child: const _VoteArea(),
    );
  }
}
