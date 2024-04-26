import 'package:beer_and_games/core/beer_and_games/presentation/bloc/bloc.dart';
import 'package:beer_and_games/core/enums/presence_state.dart';
import 'package:beer_and_games/features/beer_and_games/data/entities/hangout.dart';
import 'package:beer_and_games/features/beer_and_games/data/entities/user.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/hangout/hangout_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'homepage_vote_area_bloc.freezed.dart';
part 'homepage_vote_area_event.dart';
part 'homepage_vote_area_state.dart';

class HomepageVoteAreaBloc
    extends Bloc<HomepageVoteAreaEvent, HomepageVoteAreaState> {
  final HangoutBloc hangoutBloc;

  late PresenceState _presenceState;
  late User user;

  HomepageVoteAreaBloc({
    required this.hangoutBloc,
  }) : super(const HomepageVoteAreaState.init()) {
    on<Setup>((event, emit) {
      user = event.user;

      final isPresent = event.hangout.presentUsers.contains(event.user);
      final isAbsent = event.hangout.absentUsers.contains(event.user);
      if (isPresent) {
        _presenceState = PresenceState.present;
      } else if (isAbsent) {
        _presenceState = PresenceState.absent;
      } else {
        _presenceState = PresenceState.waiting;
      }

      emit(
        HomepageVoteAreaState.presenceSet(
          oldPresence: null,
          newPresence: _presenceState,
        ),
      );
    });

    on<SetPresence>((event, emit) async {
      final oldPresence = _presenceState;
      _presenceState = event.presence;
      final presentEmailToAdd =
          _presenceState == PresenceState.present ? user.email : null;
      final absentEmailToAdd =
          _presenceState == PresenceState.absent ? user.email : null;
      final waitingEmailToAdd =
          _presenceState == PresenceState.waiting ? user.email : null;
      final presentEmailToRemove =
          oldPresence == PresenceState.present ? user.email : null;
      final absentEmailToRemove =
          oldPresence == PresenceState.absent ? user.email : null;
      final waitingEmailToRemove =
          oldPresence == PresenceState.waiting ? user.email : null;

      hangoutBloc.add(
        HangoutEvent.updateUserPresence(
          presentEmailToRemove: presentEmailToRemove,
          presentEmailToAdd: presentEmailToAdd,
          absentEmailToRemove: absentEmailToRemove,
          absentEmailToAdd: absentEmailToAdd,
          waitingEmailToRemove: waitingEmailToRemove,
          waitingEmailToAdd: waitingEmailToAdd,
        ),
      );

      await for (final state in hangoutBloc.stream) {
        state.maybeMap(
          userPresenceUpdated: (value) {
            emit(
              HomepageVoteAreaState.presenceSet(
                oldPresence: oldPresence,
                newPresence: _presenceState,
              ),
            );
            return;
          },
          error: (value) {
            emit(HomepageVoteAreaState.error(message: value.failure.message));
            return;
          },
          orElse: () {},
        );
      }
    });
  }
}
