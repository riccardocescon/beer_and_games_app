import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_failure.freezed.dart';

@freezed
sealed class LocalFailure extends Failure with _$LocalFailure, EquatableMixin {
  LocalFailure._() : super();

  factory LocalFailure.fileNotFound() = FileNotFound;
  factory LocalFailure.unknown(String message) = Unknown;

  @override
  List<Object?> get props => map(
        fileNotFound: (_) => [],
        unknown: (value) => [value.message],
      );
}
