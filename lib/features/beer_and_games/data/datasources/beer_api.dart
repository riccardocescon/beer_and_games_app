import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/features/beer_and_games/data/models/beer_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class _BeerAPI {
  Future<Either<CloudFailure, List<BeerModel>>> getBeers();
}

class BeerAPI extends _BeerAPI {
  final FirebaseFirestore firestore;

  BeerAPI({required this.firestore});

  @override
  Future<Either<CloudFailure, List<BeerModel>>> getBeers() async {
    final games = await firestore
        .collection('hangout')
        .doc('cespuglio')
        .collection('beers')
        .get();

    return Right(
      games.docs.map((e) => BeerModel.fromJson(e.data(), id: e.id)).toList(),
    );
  }
}
