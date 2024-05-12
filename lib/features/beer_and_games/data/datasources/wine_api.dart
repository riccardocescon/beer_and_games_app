import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/features/beer_and_games/data/models/wine_model.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/user_rating.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class _WineAPI {
  Stream<Either<CloudFailure, List<WineModel>>> getWines();
  Future<Either<CloudFailure, String>> insert({
    required String name,
  });
  Future<Either<CloudFailure, void>> updateRating({
    required String beerId,
    required List<UserRating> ratings,
  });
  Future<Either<CloudFailure, void>> updateInfo({
    required String wineId,
    required String name,
    required String imagePath,
    required String imageHash,
  });
  Future<Either<CloudFailure, void>> delete({required String wineId});
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

  @override
  Future<Either<CloudFailure, String>> insert({
    required String name,
  }) async {
    final data = <String, dynamic>{
      'name': name,
    };

    try {
      final doc = await firestore
          .collection('hangout')
          .doc('cespuglio')
          .collection('wines')
          .add(data);
      return Right(doc.id);
    } catch (e) {
      return Left(CloudFailure.unknown(e.toString()));
    }
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
          .collection('wines')
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
    required String wineId,
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
          .collection('wines')
          .doc(wineId)
          .update(data);
      return const Right(null);
    } catch (e) {
      return Left(CloudFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CloudFailure, void>> delete({required String wineId}) async {
    try {
      await firestore
          .collection('hangout')
          .doc('cespuglio')
          .collection('wines')
          .doc(wineId)
          .delete();
      return const Right(null);
    } catch (e) {
      return Left(CloudFailure.unknown(e.toString()));
    }
  }
}
