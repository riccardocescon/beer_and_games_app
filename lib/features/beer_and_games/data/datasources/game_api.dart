import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/features/beer_and_games/data/models/game_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class _GameAPI {
  Future<Either<CloudFailure, List<GameModel>>> getGames();
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
}
