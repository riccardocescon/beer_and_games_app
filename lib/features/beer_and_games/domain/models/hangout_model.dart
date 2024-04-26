import 'package:beer_and_games/core/enums/date_time_enums.dart';
import 'package:beer_and_games/features/beer_and_games/data/entities/hangout.dart';
import 'package:beer_and_games/features/beer_and_games/domain/models/user_model.dart';

class HangoutModel extends Hangout {
  HangoutModel({
    required super.time,
    required super.dayOfWeek,
    required super.presentUsers,
    required super.waitingUsers,
    required super.absentUsers,
    required super.skipNextWeek,
  });

  static String get dayOfWeekField => 'day_of_week';
  static String get timeField => 'time';

  factory HangoutModel.fromJson(Map<String, dynamic> json) {
    return HangoutModel(
      time: json[timeField],
      dayOfWeek: Day.values
          .firstWhere((element) => element.value == json[dayOfWeekField]),
      presentUsers: List<String>.from(json['present'])
          .map((e) => UserModel.fromData(e).toEntity)
          .toList(),
      waitingUsers: List<String>.from(json['waiting'])
          .map((e) => UserModel.fromData(e).toEntity)
          .toList(),
      absentUsers: List<String>.from(json['absent'])
          .map((e) => UserModel.fromData(e).toEntity)
          .toList(),
      skipNextWeek: json['skip_next'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      timeField: time,
      dayOfWeekField: dayOfWeek.value,
      'present': presentUsers,
      'waiting': waitingUsers,
      'absent': absentUsers,
      'skip_next': skipNextWeek,
    };
  }

  Hangout get toEntity => Hangout(
        time: time,
        dayOfWeek: dayOfWeek,
        presentUsers: presentUsers,
        waitingUsers: waitingUsers,
        absentUsers: absentUsers,
        skipNextWeek: skipNextWeek,
      );
}
