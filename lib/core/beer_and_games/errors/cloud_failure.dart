import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloud_failure.freezed.dart';

@freezed
sealed class CloudFailure extends Failure with _$CloudFailure, EquatableMixin {
  CloudFailure._() : super();

  factory CloudFailure.unknown(String message) = Unknown;

  @override
  List<Object?> get props => map(
        unknown: (value) => [value.message],
      );
}
