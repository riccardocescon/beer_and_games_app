import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/core/enums/rating.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/ratable_item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/wine.dart';
import 'package:dartz/dartz.dart';

abstract class WineRepository {
  Stream<Either<Failure, List<Wine>>> select();
  Future<Either<CloudFailure, void>> updateRating({
    required String userEmail,
    required Rating rating,
    required RateableItem item,
  });
  Future<Either<CloudFailure, void>> updateInfo({required Wine wine});
  Future<Either<CloudFailure, void>> delete({required Wine wine});
}
