import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/features/beer_and_games/data/models/beer_model.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/user_rating.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class _BeerAPI {
  Stream<Either<CloudFailure, List<BeerModel>>> getBeers();
  Future<Either<CloudFailure, void>> updateRating({
    required String beerId,
    required List<UserRating> ratings,
  });
  Future<Either<CloudFailure, void>> updateInfo({
    required String beerId,
    required String name,
    required String imagePath,
    required String imageHash,
  });
  Future<Either<CloudFailure, void>> delete({required String beerId});
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

  @override
  Future<Either<CloudFailure, void>> updateRating({
    required String beerId,
    required List<UserRating> ratings,
  }) async {
    try {
      await firestore
          .collection('hangout')
          .doc('cespuglio')
          .collection('beers')
          .doc(beerId)
          .update(
        {
          'ratings': List.generate(
            ratings.length,
            (index) =>
                '${ratings[index].userEmail}|${ratings[index].rating.value}',
          )
        },
      );
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
  }) async {
    try {
      final data = <String, dynamic>{
        'name': name,
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

      await firestore
          .collection('hangout')
          .doc('cespuglio')
          .collection('beers')
          .doc(beerId)
          .update(data);
      return const Right(null);
    } catch (e) {
      return Left(CloudFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CloudFailure, void>> delete({required String beerId}) async {
    try {
      await firestore
          .collection('hangout')
          .doc('cespuglio')
          .collection('beers')
          .doc(beerId)
          .delete();
      return const Right(null);
    } catch (e) {
      return Left(CloudFailure.unknown(e.toString()));
    }
  }
}
