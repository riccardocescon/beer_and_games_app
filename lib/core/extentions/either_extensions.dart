import 'package:dartz/dartz.dart';

extension RightLeft<L, R> on Either<L, R> {
  L get left => fold((l) => l, (r) => throw Exception('No left value'));
  R get right => fold((l) => throw Exception('No right value'), (r) => r);
}
