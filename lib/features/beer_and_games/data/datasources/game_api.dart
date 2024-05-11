import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/features/beer_and_games/data/models/game_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class _GameAPI {
  Future<Either<CloudFailure, List<GameModel>>> getGames();
  Future<Either<CloudFailure, void>> markAddPlayed({required String gameId});
  Future<Either<CloudFailure, void>> markRemovePlayed({required String gameId});
}

class GameAPI extends _GameAPI {
  final FirebaseFirestore firestore;

  GameAPI({required this.firestore});

  @override
  Future<Either<CloudFailure, List<GameModel>>> getGames() async {
    final games = await firestore
        .collection('hangout')
        .doc('cespuglio')
        .collection('games')
        .get();

    return Right(
      games.docs.map((e) => GameModel.fromJson(e.data(), id: e.id)).toList(),
    );
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
}
