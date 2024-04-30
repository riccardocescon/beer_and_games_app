import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, P> {
  Future<Either<Failure, T>> call(P params);
}

abstract class StreamUseCase<T, P> {
  Stream<Either<Failure, T>> call(P params);
}
