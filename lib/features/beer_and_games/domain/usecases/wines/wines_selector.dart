part of 'wine_usecases.dart';

class WinesSelector extends StreamUseCase<List<Wine>, void> {
  final WineRepository wineRepository;

  WinesSelector({required this.wineRepository});

  @override
  Stream<Either<Failure, List<Wine>>> call(void params) async* {
    yield* wineRepository.select();
  }
}
