import 'dart:developer';

import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class _AuthAPI {
  Future<Either<CloudFailure, User>> signInWithGoogle();
  Future<Either<CloudFailure, void>> signOutFromGoogle();
}

class AuthAPI extends _AuthAPI {
  final GoogleSignIn googleSignIn;

  AuthAPI({required this.googleSignIn});

  @override
  Future<Either<CloudFailure, User>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;
      if (user == null) {
        return Left(CloudFailure.unknown('User is null'));
      }

      return Right(user);
    } catch (e) {
      log(e.toString());
      return Left(CloudFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CloudFailure, void>> signOutFromGoogle() async {
    try {
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      return const Right(null);
    } catch (e) {
      log(e.toString());
      return Left(CloudFailure.unknown(e.toString()));
    }
  }
}
