import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/wine.dart';
import 'package:dartz/dartz.dart';

abstract class WineRepository {
  Stream<Either<Failure, List<Wine>>> select();
}
