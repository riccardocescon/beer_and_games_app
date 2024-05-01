import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/features/beer_and_games/data/models/wine_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class _WineAPI {
  Future<Either<CloudFailure, List<WineModel>>> getWines();
}

class WineAPI extends _WineAPI {
  final FirebaseFirestore firestore;

  WineAPI({required this.firestore});

  @override
  Future<Either<CloudFailure, List<WineModel>>> getWines() async {
    final games = await firestore
        .collection('hangout')
        .doc('cespuglio')
        .collection('wines')
        .get();

    return Right(
      games.docs.map((e) => WineModel.fromJson(e.data(), id: e.id)).toList(),
    );
  }
}
