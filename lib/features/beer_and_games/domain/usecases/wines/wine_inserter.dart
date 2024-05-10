part of 'wine_usecases.dart';

class WineInserter extends UseCase<void, WineInserterParams> {
  final WineRepository wineRepository;

  WineInserter({required this.wineRepository});

  @override
  Future<Either<Failure, void>> call(WineInserterParams params) async {
    return wineRepository.insert(
      name: params.name,
      imageBytes: params.imageBytes,
    );
  }
}

class WineInserterParams {
  final String name;
  final List<int>? imageBytes;

  WineInserterParams({
    required this.name,
    required this.imageBytes,
  });
}
