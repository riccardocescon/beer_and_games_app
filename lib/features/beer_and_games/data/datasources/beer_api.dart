import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/features/beer_and_games/data/models/beer_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class _BeerAPI {
  Stream<Either<CloudFailure, List<BeerModel>>> getBeers();
}

class BeerAPI extends _BeerAPI {
  final FirebaseFirestore firestore;

  BeerAPI({required this.firestore});

  @override
  Stream<Either<CloudFailure, List<BeerModel>>> getBeers() async* {
    yield* firestore
        .collection('hangout')
        .doc('cespuglio')
        .collection('beers')
        .snapshots()
        .map((snapshot) {
      final beers = snapshot.docs
          .map((doc) => BeerModel.fromJson(doc.data(), id: doc.id))
          .toList();
      return Right(beers);
    });
  }
}
