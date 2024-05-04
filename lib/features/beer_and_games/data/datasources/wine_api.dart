import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/features/beer_and_games/data/models/wine_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class _WineAPI {
  Stream<Either<CloudFailure, List<WineModel>>> getWines();
}

class WineAPI extends _WineAPI {
  final FirebaseFirestore firestore;

  WineAPI({required this.firestore});

  @override
  Stream<Either<CloudFailure, List<WineModel>>> getWines() async* {
    yield* firestore
        .collection('hangout')
        .doc('cespuglio')
        .collection('wines')
        .snapshots()
        .map((snapshot) {
      final wines = snapshot.docs
          .map((doc) => WineModel.fromJson(doc.data(), id: doc.id))
          .toList();
      return Right(wines);
    });
  }
}
