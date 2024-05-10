import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/features/beer_and_games/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class _UserAPI {
  Future<Either<CloudFailure, UserModel>> insert({required User user});
  Future<Either<CloudFailure, UserModel>> select({required String email});
}

class UserAPI extends _UserAPI {
  final FirebaseFirestore firestore;

  UserAPI({required this.firestore});

  @override
  Future<Either<CloudFailure, UserModel>> insert({
    required User user,
  }) async {
    try {
      await firestore.collection('users').doc(user.email!).set({});

      return Right(UserModel(email: user.email!));
    } catch (e) {
      return Left(CloudFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CloudFailure, UserModel>> select({
    required String email,
  }) async {
    try {
      final doc = await firestore.collection('users').doc(email).get();
      if (!doc.exists) {
        return Left(CloudFailure.notFound());
      }

      return Right(UserModel(email: email));
    } catch (e) {
      return Left(CloudFailure.unknown(e.toString()));
    }
  }
}
