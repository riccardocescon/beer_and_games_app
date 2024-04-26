import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/core/enums/date_time_enums.dart';
import 'package:beer_and_games/features/beer_and_games/data/entities/hangout.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class HangoutRepository {
  Stream<Either<CloudFailure, Hangout>> select();
  Future<Either<CloudFailure, void>> updateDateTime({
    required Day day,
    required TimeOfDay time,
  });
}
