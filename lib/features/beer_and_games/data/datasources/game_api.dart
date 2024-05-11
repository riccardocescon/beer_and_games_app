import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/features/beer_and_games/data/models/game_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class _GameAPI {
  Stream<Either<CloudFailure, List<GameModel>>> getGames();
  Future<Either<CloudFailure, void>> markAddPlayed({required String gameId});
  Future<Either<CloudFailure, void>> markRemovePlayed({required String gameId});
  Future<Either<CloudFailure, void>> updateInfo({
    required String beerId,
    required String name,
    required String? imagePath,
    required String? imageHash,
    required int minPlayers,
    required int maxPlayers,
    required bool onlyMinMax,
  });
  Future<Either<CloudFailure, void>> delete({required String gameId});
}

class GameAPI extends _GameAPI {
  final FirebaseFirestore firestore;

  GameAPI({required this.firestore});

  @override
  Stream<Either<CloudFailure, List<GameModel>>> getGames() async* {
    yield* firestore
        .collection('hangout')
        .doc('cespuglio')
        .collection('games')
        .snapshots()
        .map((snapshot) {
      final games = snapshot.docs
          .map((doc) => GameModel.fromJson(doc.data(), id: doc.id))
          .toList();
      return Right(games);
    });
  }

  @override
  Future<Either<CloudFailure, void>> markAddPlayed({
    required String gameId,
  }) async {
    try {
      await firestore
          .collection('hangout')
          .doc('cespuglio')
          .collection('games')
          .doc(gameId)
          .update({
        'times': FieldValue.increment(1),
      });

      return const Right(null);
    } catch (e) {
      return Left(CloudFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CloudFailure, void>> markRemovePlayed({
    required String gameId,
  }) async {
    try {
      await firestore
          .collection('hangout')
          .doc('cespuglio')
          .collection('games')
          .doc(gameId)
          .update({
        'times': FieldValue.increment(-1),
      });

      return const Right(null);
    } catch (e) {
      return Left(CloudFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CloudFailure, void>> updateInfo({
    required String beerId,
    required String name,
    required String? imagePath,
    required String? imageHash,
    required int minPlayers,
    required int maxPlayers,
    required bool onlyMinMax,
  }) async {
    try {
      final data = <String, dynamic>{
        'name': name,
        'min_p': minPlayers,
        'max_p': maxPlayers,
      };
      if (imagePath == null) {
        data.addAll({
          'img': FieldValue.delete(),
          'imgHash': FieldValue.delete(),
        });
      } else {
        data.addAll({
          'img': imagePath,
          'imgHash': imageHash,
        });
      }

      data.addAll({
        'only_mm': onlyMinMax,
      });

      await firestore
          .collection('hangout')
          .doc('cespuglio')
          .collection('games')
          .doc(beerId)
          .update(data);
      return const Right(null);
    } catch (e) {
      return Left(CloudFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CloudFailure, void>> delete({required String gameId}) async {
    try {
      await firestore
          .collection('hangout')
          .doc('cespuglio')
          .collection('games')
          .doc(gameId)
          .delete();
      return const Right(null);
    } catch (e) {
      return Left(CloudFailure.unknown(e.toString()));
    }
  }
}
