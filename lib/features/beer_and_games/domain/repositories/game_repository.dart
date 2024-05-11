import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/game.dart';
import 'package:dartz/dartz.dart';

abstract class GameRepository {
  Stream<Either<Failure, List<Game>>> select();
  Future<Either<CloudFailure, void>> markAddPlayed({required String gameId});
  Future<Either<CloudFailure, void>> markRemovePlayed({required String gameId});
  Future<Either<CloudFailure, void>> updateInfo({required Game game});
  Future<Either<CloudFailure, void>> delete({required Game game});
}
