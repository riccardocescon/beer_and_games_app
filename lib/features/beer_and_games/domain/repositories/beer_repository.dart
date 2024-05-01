import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/beer.dart';
import 'package:dartz/dartz.dart';

abstract class BeerRepository {
  Stream<Either<Failure, List<Beer>>> select();
}
