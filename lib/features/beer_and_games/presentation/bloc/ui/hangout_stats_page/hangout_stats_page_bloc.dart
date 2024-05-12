import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/core/beer_and_games/presentation/bloc/bloc.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/hangout.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/hangout/hangout_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hangout_stats_page_bloc.freezed.dart';
part 'hangout_stats_page_event.dart';
part 'hangout_stats_page_state.dart';

class HangoutStatsPageBloc
    extends Bloc<HangoutStatsPageEvent, HangoutStatsPageState> {
  final HangoutBloc hangoutBloc;

  late Hangout _hangout;

  HangoutStatsPageBloc({
    required this.hangoutBloc,
  }) : super(const HangoutStatsPageState.init()) {
    on<Setup>((event, emit) async {
      _hangout = event.hangout;
      emit(HangoutStatsPageState.hangout(_hangout));

      final preUsersPresence =
          _hangout.allUsers.where((e) => e.presenceCount != null).length;

      int updateReceivedCounter = 0;
      int maxUpdateReceivedCounter = 3;

      hangoutBloc.add(const HangoutEvent.getUserPresence());
      await for (final state in hangoutBloc.stream) {
        final completed = state.maybeMap<bool>(
          loaded: (value) {
            final postUsersPresence = value.hangout.allUsers
                .where((e) => e.presenceCount != null)
                .length;

            final isNewData = postUsersPresence > preUsersPresence;
            if (!isNewData) {
              updateReceivedCounter++;
              final maxRetriesReached =
                  updateReceivedCounter == maxUpdateReceivedCounter;
              return maxRetriesReached;
            }

            _hangout = value.hangout;
            emit(HangoutStatsPageState.hangout(_hangout));
            return true;
          },
          error: (error) {
            emit(HangoutStatsPageState.error(error.failure));
            return true;
          },
          orElse: () => false,
        );

        if (completed) break;
      }
    });
    on<AddBeer>((event, emit) {
      emit(const HangoutStatsPageState.updateUI(
        addBeer: true,
        addWine: false,
        addGame: false,
      ));
    });
    on<AddWine>((event, emit) {
      emit(const HangoutStatsPageState.updateUI(
        addBeer: false,
        addWine: true,
        addGame: false,
      ));
    });
    on<AddGame>((event, emit) {
      emit(const HangoutStatsPageState.updateUI(
        addBeer: false,
        addWine: false,
        addGame: true,
      ));
    });
    on<SaveItem>((event, emit) {
      // final item = event.item;
    });
    on<CloseItem>((event, emit) {
      emit(
        const HangoutStatsPageState.updateUI(
          addBeer: false,
          addWine: false,
          addGame: false,
        ),
      );
    });
  }
}
