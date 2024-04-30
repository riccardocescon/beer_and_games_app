import 'dart:async';

import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/core/beer_and_games/presentation/bloc/bloc.dart';
import 'package:beer_and_games/core/enums/date_time_enums.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/hangout.dart';
import 'package:beer_and_games/features/beer_and_games/domain/usecases/hangout/hangout_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hangout_bloc.freezed.dart';
part 'hangout_event.dart';
part 'hangout_state.dart';

class HangoutBloc extends Bloc<HangoutEvent, HangoutState> {
  final HangoutStream hangoutStream;
  final HangoutDateTimeUpdate hangoutDateTimeUpdate;
  final HangoutUpdateVote hangoutUpdateVote;
  final HangoutGetUsersPresence hangoutGetUsersPresence;

  Hangout? _hangout;
  Timer? _countdownDeamonTimer;

  Hangout? get hangout => _hangout;

  HangoutBloc({
    required this.hangoutStream,
    required this.hangoutDateTimeUpdate,
    required this.hangoutUpdateVote,
    required this.hangoutGetUsersPresence,
  }) : super(const HangoutState.init()) {
    on<Select>((event, emit) async {
      emit(const HangoutState.loading());
      final stream = hangoutStream.call(null);
      await for (final hangout in stream) {
        emit(
          hangout.fold(
            (l) => HangoutState.error(l),
            (r) {
              _hangout = r.copyWith();

              final now = DateTime.now();
              final currentDayOfWeek = now.weekday;
              final hangoutDayOfWeek = _hangout!.dayOfWeek;
              int reaminingDays = hangoutDayOfWeek.value - currentDayOfWeek;
              if (reaminingDays < 0) reaminingDays += 7;

              final nowTime = TimeOfDay.fromDateTime(now);
              final hangoutTimeStart = _hangout!.timeOfDay;
              int reaminingTimeHours = hangoutTimeStart.hour - nowTime.hour;
              if (reaminingTimeHours < 0) reaminingTimeHours += 24;
              int reaminingMinutes = hangoutTimeStart.minute - nowTime.minute;
              if (reaminingMinutes < 0) {
                if (reaminingTimeHours > 1) {
                  reaminingTimeHours--;
                }
                reaminingMinutes += 60;
              }

              final nextHangout = Duration(
                days: reaminingDays,
                hours: reaminingTimeHours,
                minutes: reaminingMinutes,
              );

              _countdownDeamon(nextHangout, emit);

              return HangoutState.loaded(_hangout!);
            },
          ),
        );
      }
    });
    on<UpdateDateTime>((event, emit) async {
      emit(const HangoutState.loading());
      final result = await hangoutDateTimeUpdate.call(
        HangoutDateTimeUpdateParams(
          day: event.day,
          time: event.time,
        ),
      );
      emit(
        result.fold(
          (l) => HangoutState.error(l),
          (_) => const HangoutState.dayTimeUpdate(),
        ),
      );
    });
    on<UpdateUserPresence>((event, emit) async {
      emit(const HangoutState.loading());
      final result = await hangoutUpdateVote.call(
        HangoutHangoutUpdateVoteParams(
          presentEmailToRemove: event.presentEmailToRemove,
          presentEmailToAdd: event.presentEmailToAdd,
          absentEmailToRemove: event.absentEmailToRemove,
          absentEmailToAdd: event.absentEmailToAdd,
          waitingEmailToRemove: event.waitingEmailToRemove,
          waitingEmailToAdd: event.waitingEmailToAdd,
        ),
      );
      emit(
        result.fold(
          (l) => HangoutState.error(l),
          (_) => const HangoutState.userPresenceUpdated(),
        ),
      );
    });
    on<GetUserPresence>((event, emit) async {
      emit(const HangoutState.loading());
      final result = await hangoutGetUsersPresence.call(
        HangoutGetUsersPresenceParams(users: _hangout!.allUsers),
      );
      emit(
        result.fold((l) => HangoutState.error(l), (users) {
          final presentUsers = _hangout!.presentUsers.toList();
          final absentUsers = _hangout!.absentUsers.toList();
          final waitingUsers = _hangout!.waitingUsers.toList();

          for (final user in users) {
            if (presentUsers.contains(user)) {
              presentUsers.remove(user);
              presentUsers.add(user);
            } else if (absentUsers.contains(user)) {
              absentUsers.remove(user);
              absentUsers.add(user);
            } else if (waitingUsers.contains(user)) {
              waitingUsers.remove(user);
              waitingUsers.add(user);
            }
          }

          _hangout = _hangout!.copyWith(
            presentUsers: presentUsers,
            absentUsers: absentUsers,
            waitingUsers: waitingUsers,
          );

          return HangoutState.loaded(_hangout!);
        }),
      );
    });
  }

  void _countdownDeamon(Duration duration, Emitter<HangoutState> emit) async {
    // Cancel the previous timer if it exists
    _countdownDeamonTimer?.cancel();

    // Calculate the time left
    _LocalTimeTracker timeTracker = _LocalTimeTracker(duration);

    emit(
      HangoutState.dateTimeUpdate(
        missingDays: timeTracker.missingDays,
        missingHours: timeTracker.missingHours,
        missingMinutes: timeTracker.missingMinutes,
        date: timeTracker.timeLeftDateTime,
      ),
    );

    // await missing time to the next minute
    final missingSecondsToNextMinute = 60 - DateTime.now().second;
    await Future.delayed(Duration(seconds: missingSecondsToNextMinute));

    // Refresh the time left
    timeTracker.removeMinute();

    emit(
      HangoutState.dateTimeUpdate(
        missingDays: timeTracker.missingDays,
        missingHours: timeTracker.missingHours,
        missingMinutes: timeTracker.missingMinutes,
        date: timeTracker.timeLeftDateTime,
      ),
    );

    // Start a new timer
    _countdownDeamonTimer = Timer.periodic(
      const Duration(minutes: 1),
      (timer) {
        // Refresh the time left
        timeTracker.removeMinute();
        emit(
          HangoutState.dateTimeUpdate(
            missingDays: timeTracker.missingDays,
            missingHours: timeTracker.missingHours,
            missingMinutes: timeTracker.missingMinutes,
            date: timeTracker.timeLeftDateTime,
          ),
        );
      },
    );
  }
}

class _LocalTimeTracker {
  late int seconds, missingDays, missingHours, missingMinutes;
  late DateTime timeLeftDateTime;
  late Duration timeLeft;

  _LocalTimeTracker(this.timeLeft) {
    final now = DateTime.now();

    _updateTimeLeft();

    timeLeftDateTime = DateTime(
      now.year,
      now.month,
      now.day + missingDays,
      now.hour + missingHours,
      now.minute + missingMinutes,
    );
  }

  void _updateTimeLeft() {
    seconds = timeLeft.inSeconds;
    missingDays = seconds ~/ 86400;
    missingHours = (seconds % 86400) ~/ 3600;
    missingMinutes = (seconds % 3600) ~/ 60;
    if (missingDays > 0) missingDays--;
  }

  void removeMinute() {
    timeLeft = timeLeft - const Duration(minutes: 1);
    timeLeftDateTime = timeLeftDateTime.subtract(const Duration(minutes: 1));
    _updateTimeLeft();
  }
}
