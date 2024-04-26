import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, P> {
  Future<Either<CloudFailure, T>> call(P params);
}

abstract class StreamUseCase<T, P> {
  Stream<Either<CloudFailure, T>> call(P params);
}
