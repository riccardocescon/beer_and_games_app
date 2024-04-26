import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/core/beer_and_games/presentation/bloc/bloc.dart';
import 'package:beer_and_games/core/enums/date_time_enums.dart';
import 'package:beer_and_games/features/beer_and_games/data/entities/hangout.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/hangout/hangout_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_hangout_page_bloc.freezed.dart';
part 'edit_hangout_page_event.dart';
part 'edit_hangout_page_state.dart';

class EditHangoutPageBloc
    extends Bloc<EditHangoutPageEvent, EditHangoutPageState> {
  final HangoutBloc hangoutBloc;

  late Day day;
  late TimeOfDay time;

  EditHangoutPageBloc({
    required this.hangoutBloc,
  }) : super(const EditHangoutPageState.init()) {
    on<Setup>((event, emit) {
      day = event.hangout.dayOfWeek;
      time = event.hangout.timeOfDay;
      emit(EditHangoutPageState.updateUI(day: day, time: time));
    });
    on<SetDayOfWeek>((event, emit) {
      day = event.day;
      emit(EditHangoutPageState.updateUI(day: day, time: time));
    });
    on<SetTime>((event, emit) {
      time = event.time;
      emit(EditHangoutPageState.updateUI(day: day, time: time));
    });
    on<Save>((event, emit) async {
      emit(const EditHangoutPageState.loading());
      hangoutBloc.add(
        HangoutEvent.updateDateTime(
          day: day,
          time: time,
        ),
      );
      await for (final state in hangoutBloc.stream) {
        state.maybeMap(
          dateTimeUpdate: (value) {
            emit(const EditHangoutPageState.saved());
            return;
          },
          error: (value) {
            emit(EditHangoutPageState.error(value.failure));
            return;
          },
          orElse: () {},
        );
      }
    });
  }
}
