part of 'wine_usecases.dart';

class WineInfoUpdater extends UseCase<void, WineInfoUpdaterParams> {
  final WineRepository wineRepository;

  WineInfoUpdater({required this.wineRepository});

  @override
  Future<Either<Failure, void>> call(WineInfoUpdaterParams params) async {
    return wineRepository.updateInfo(wine: params.wine);
  }
}

class WineInfoUpdaterParams {
  final Wine wine;

  WineInfoUpdaterParams({
    required this.wine,
  });
}
