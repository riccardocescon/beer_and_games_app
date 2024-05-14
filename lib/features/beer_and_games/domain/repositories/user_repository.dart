import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<CloudFailure, User>> signInWithGoogle();
  Future<Either<CloudFailure, User>> get({required String email});
  Future<Either<Failure, void>> signOut();
}
