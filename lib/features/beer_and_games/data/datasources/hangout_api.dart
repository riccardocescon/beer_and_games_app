import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/core/loggers/loggers.dart';
import 'package:beer_and_games/features/beer_and_games/data/models/hangout_model.dart';
import 'package:beer_and_games/features/beer_and_games/data/models/user_presence.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class _HangoutAPI {
  Stream<Either<CloudFailure, HangoutModel>> select();
  Future<Either<CloudFailure, void>> updateDateTime({
    required int day,
    required String time,
  });
  Future<Either<CloudFailure, void>> updatePresence({
    required String? presentEmailToRemove,
    required String? presentEmailToAdd,
    required String? absentEmailToRemove,
    required String? absentEmailToAdd,
    required String? waitingEmailToRemove,
    required String? waitingEmailToAdd,
  });
  Future<Either<CloudFailure, List<UserPresenceModel>>> getUsersPresence();
}

class HangoutAPI implements _HangoutAPI {
  final FirebaseFirestore firestore;

  HangoutAPI({required this.firestore});

  @override
  Stream<Either<CloudFailure, HangoutModel>> select() async* {
    yield* firestore.collection('hangout').doc('cespuglio').snapshots().map(
      (event) {
        logCloud('HangoutSelect', event.data().toString());
        return Right(
          HangoutModel.fromJson(event.data()!),
        );
      },
    );
  }

  @override
  Future<Either<CloudFailure, void>> updateDateTime({
    required int day,
    required String time,
  }) async {
    try {
      await firestore.collection('hangout').doc('cespuglio').update({
        HangoutModel.dayOfWeekField: day,
        HangoutModel.timeField: time,
      });

      return const Right(null);
    } catch (e) {
      return Left(CloudFailure.unknown(e.toString()));
    }
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
    try {
      final Map<String, dynamic> update = {};

      if (presentEmailToRemove != null) {
        update['present'] = FieldValue.arrayRemove([presentEmailToRemove]);
      }

      if (presentEmailToAdd != null) {
        update['present'] = FieldValue.arrayUnion([presentEmailToAdd]);
      }

      if (absentEmailToRemove != null) {
        update['absent'] = FieldValue.arrayRemove([absentEmailToRemove]);
      }

      if (absentEmailToAdd != null) {
        update['absent'] = FieldValue.arrayUnion([absentEmailToAdd]);
      }

      if (waitingEmailToRemove != null) {
        update['waiting'] = FieldValue.arrayRemove([waitingEmailToRemove]);
      }

      if (waitingEmailToAdd != null) {
        update['waiting'] = FieldValue.arrayUnion([waitingEmailToAdd]);
      }

      await firestore.collection('hangout').doc('cespuglio').update(update);

      return const Right(null);
    } catch (e) {
      return Left(CloudFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CloudFailure, List<UserPresenceModel>>>
      getUsersPresence() async {
    try {
      final rawPresence = await firestore
          .collection('hangout')
          .doc('cespuglio')
          .collection('precence')
          .doc('users')
          .get();

      final emails = rawPresence.data()!['emails'] as List<dynamic>;
      logCloud('HangoutGetUsersPresence', emails.toString());
      return Right(
        emails.map((e) => UserPresenceModel.fromData(e as String)).toList(),
      );
    } catch (e) {
      return Left(CloudFailure.unknown(e.toString()));
    }
  }
}
