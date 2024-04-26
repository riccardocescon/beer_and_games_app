import 'package:beer_and_games/core/enums/date_time_enums.dart';
import 'package:flutter/material.dart';

class Hangout {
  final Day dayOfWeek;
  final String time;
  final List<String> presentUsers, waitingUsers, absentUsers;
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
    List<String>? presentUsers,
    List<String>? waitingUsers,
    List<String>? absentUsers,
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
}
