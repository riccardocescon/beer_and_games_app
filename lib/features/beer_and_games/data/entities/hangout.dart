import 'package:beer_and_games/core/enums/date_time_enums.dart';
import 'package:beer_and_games/features/beer_and_games/data/entities/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Hangout with EquatableMixin {
  final Day dayOfWeek;
  final String time;
  final List<User> presentUsers, waitingUsers, absentUsers;
  final bool skipNextWeek;

  TimeOfDay get timeOfDay {
    final timeSplit = time.split(':');
    return TimeOfDay(
      hour: int.parse(timeSplit.first),
      minute: int.parse(timeSplit.last),
    );
  }

  Hangout({
    required this.time,
    required this.dayOfWeek,
    required this.presentUsers,
    required this.waitingUsers,
    required this.absentUsers,
    required this.skipNextWeek,
  });

  Hangout copyWith({
    String? time,
    Day? dayOfWeek,
    List<User>? presentUsers,
    List<User>? waitingUsers,
    List<User>? absentUsers,
    bool? skipNextWeek,
  }) {
    return Hangout(
      time: time ?? this.time,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      presentUsers: presentUsers ?? this.presentUsers,
      waitingUsers: waitingUsers ?? this.waitingUsers,
      absentUsers: absentUsers ?? this.absentUsers,
      skipNextWeek: skipNextWeek ?? this.skipNextWeek,
    );
  }

  @override
  List<Object?> get props => [
        time,
        dayOfWeek,
        presentUsers,
        waitingUsers,
        absentUsers,
        skipNextWeek,
      ];
}
