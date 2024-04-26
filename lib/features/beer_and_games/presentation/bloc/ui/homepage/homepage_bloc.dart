import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/core/beer_and_games/presentation/bloc/bloc.dart';
import 'package:beer_and_games/features/beer_and_games/data/entities/hangout.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/hangout/hangout_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'homepage_bloc.freezed.dart';
part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  final HangoutBloc hangoutBloc;

  HomepageBloc({
    required this.hangoutBloc,
  }) : super(const HomepageState.init()) {
    on<Setup>((event, emit) async {
      emit(const HomepageState.loading());
      hangoutBloc.add(const HangoutEvent.select());

      await for (final state in hangoutBloc.stream) {
        state.maybeMap(
          loaded: (value) {
            emit(HomepageState.loaded(value.hangout));
          },
          dateTimeUpdate: (value) {
            String date =
                DateFormat('EEEE dd MMMM', 'it_IT').format(value.date);
            final parts = date.split(' ');
            final day = int.parse(parts[1]);
            date =
                '${parts[0][0].toUpperCase()}${parts[0].substring(1)} $day ${parts[2][0].toUpperCase()}${parts[2].substring(1)}';

            final missingDays = value.missingDays;
            final missingDaysWord = missingDays > 1 ? 'Giorni' : 'Giorno';
            final missingHours = value.missingHours;
            final missingHoursWord = missingHours > 1 ? 'Ore' : 'Ora';
            final missingMinutes = value.missingMinutes;
            final completeTime =
                '$missingDays $missingDaysWord $missingHours $missingHoursWord $missingMinutes Minuti';

            emit(
              HomepageState.dateTimeUpdate(
                date: date,
                timeLeft: completeTime,
              ),
            );
          },
          error: (value) {
            emit(HomepageState.error(value.failure));
          },
          orElse: () {},
        );
      }
    });
  }
}
