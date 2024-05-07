part of 'wine_usecases.dart';

class WineDeleter extends UseCase<void, WineInfoUpdaterParams> {
  final WineRepository wineRepository;

  WineDeleter({required this.wineRepository});

  @override
  Future<Either<Failure, void>> call(WineInfoUpdaterParams params) async {
    return wineRepository.delete(wine: params.wine);
  }
}

class WineDeleterParams {
  final Wine wine;

  WineDeleterParams({
    required this.wine,
  });
}
