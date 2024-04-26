import 'package:beer_and_games/core/enums/presence_state.dart';
import 'package:beer_and_games/core/extentions/context_extension.dart';
import 'package:beer_and_games/core/widgets/spacers.dart';
import 'package:beer_and_games/features/beer_and_games/data/entities/hangout.dart';
import 'package:beer_and_games/features/beer_and_games/data/entities/user.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/homepage/homepage_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/homepage/widgets/homepage_vote_area_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/user_bloc.dart/user_bloc.dart';
import 'package:beer_and_games/injection_container.dart';
import 'package:beer_and_games/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'vote_area.dart';
part 'vote_button.dart';

class HomepageContent extends StatelessWidget {
  const HomepageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: MaterialTheme.darkScheme().surfaceContainer,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24 * 2),
            topRight: Radius.circular(24 * 2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              BlocBuilder<HomepageBloc, HomepageState>(
                buildWhen: (previous, current) => current.maybeMap(
                  loaded: (value) => true,
                  orElse: () => false,
                ),
                builder: (context, state) {
                  return state.maybeMap(
                    loaded: (value) {
                      return BlocProvider(
                        create: (context) => sl<HomepageVoteAreaBloc>()
                          ..add(
                            HomepageVoteAreaEvent.setup(
                              hangout: value.hangout,
                              user: sl<UserBloc>().user,
                            ),
                          ),
                        child: const _VoteArea(),
                      );
                    },
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
