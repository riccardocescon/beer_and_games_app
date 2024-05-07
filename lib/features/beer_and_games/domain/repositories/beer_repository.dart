import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/core/enums/rating.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/ratable_item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/beer.dart';
import 'package:dartz/dartz.dart';

abstract class BeerRepository {
  Stream<Either<Failure, List<Beer>>> select();
  Future<Either<CloudFailure, void>> updateRating({
    required String userEmail,
    required Rating rating,
    required RateableItem item,
  });
  Future<Either<CloudFailure, void>> updateInfo({required Beer beer});
  Future<Either<CloudFailure, void>> delete({required Beer beer});
}
