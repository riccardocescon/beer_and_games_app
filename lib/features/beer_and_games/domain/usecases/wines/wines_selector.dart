import 'package:beer_and_games/core/beer_and_games/domain/usecases/usecase.dart';
import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/wine.dart';
import 'package:beer_and_games/features/beer_and_games/domain/repositories/wine_repository.dart';
import 'package:dartz/dartz.dart';

class WinesSelector extends StreamUseCase<List<Wine>, void> {
  final WineRepository wineRepository;

  WinesSelector({required this.wineRepository});

  @override
  Stream<Either<Failure, List<Wine>>> call(void params) async* {
    yield* wineRepository.select();
  }
}
