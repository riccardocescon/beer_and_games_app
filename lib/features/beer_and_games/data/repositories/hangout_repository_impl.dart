import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/core/enums/date_time_enums.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/hangout_api.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/hangout.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/user.dart';
import 'package:beer_and_games/features/beer_and_games/domain/repositories/hangout_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class HangoutRepositoryImpl extends HangoutRepository {
  final HangoutAPI hangoutAPI;

  HangoutRepositoryImpl({required this.hangoutAPI});

  @override
  Stream<Either<CloudFailure, Hangout>> select() async* {
    yield* hangoutAPI.select().map(
          (event) => event.fold(
            (l) => Left(l),
            (r) => Right(r.toEntity),
          ),
        );
  }

  @override
  Future<Either<CloudFailure, void>> updateDateTime({
    required Day day,
    required TimeOfDay time,
  }) async {
    return hangoutAPI.updateDateTime(
      day: day.value,
      time: '${time.hour}:${time.minute.toString().padLeft(2, '0')}',
    );
  }

  @override
  Future<Either<CloudFailure, void>> updatePresence({
    required String? presentEmailToRemove,
    required String? presentEmailToAdd,
    required String? absentEmailToRemove,
    required String? absentEmailToAdd,
    required String? waitingEmailToRemove,
    required String? waitingEmailToAdd,
  }) async {
    return hangoutAPI.updatePresence(
      presentEmailToRemove: presentEmailToRemove,
      presentEmailToAdd: presentEmailToAdd,
      absentEmailToRemove: absentEmailToRemove,
      absentEmailToAdd: absentEmailToAdd,
      waitingEmailToRemove: waitingEmailToRemove,
      waitingEmailToAdd: waitingEmailToAdd,
    );
  }

  @override
  Future<Either<CloudFailure, List<User>>> getUsersPresence({
    required List<User> users,
  }) async {
    final result = await hangoutAPI.getUsersPresence();

    return result.fold(
      (l) => Left(l),
      (r) {
        final foundUsers = r
            .where(
              (precence) => users.any((user) => user.email == precence.email),
            )
            .toList();
        final updatedDataUsers = <User>[];
        for (final presence in foundUsers) {
          final user = users.firstWhere((user) => user.email == presence.email);
          updatedDataUsers.add(
            user.copyWith(
              presenceCount: presence.presenceCount,
              forcePercenceCountUpdate: true,
            ),
          );
        }

        return Right(updatedDataUsers);
      },
    );
  }
}
