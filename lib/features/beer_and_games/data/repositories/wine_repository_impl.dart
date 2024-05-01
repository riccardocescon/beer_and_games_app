import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/core/extentions/either_extensions.dart';
import 'package:beer_and_games/core/mixin/image_selector_api_helper.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/cloud_image_storage_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/local_image_storage_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/wine_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/models/wine_model.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/wine.dart';
import 'package:beer_and_games/features/beer_and_games/domain/repositories/wine_repository.dart';
import 'package:dartz/dartz.dart';

class WineRepositoryImpl extends WineRepository with ImageSelectorApiHelper {
  final WineAPI wineAPI;
  final CloudImageStorageAPI cloudImageStorageAPI;
  final LocalImageStorageAPI localImageStorageAPI;

  WineRepositoryImpl({
    required this.wineAPI,
    required this.cloudImageStorageAPI,
    required this.localImageStorageAPI,
  });

  @override
  Stream<Either<Failure, List<Wine>>> select() async* {
    final foWines = await wineAPI.getWines();

    if (foWines.isLeft()) {
      yield Left(foWines.left);
      return;
    }
    final wineModels = foWines.right;
    final wines = wineModels
        .map(
          (e) => Wine(
            id: e.id,
            name: e.name,
            ratings: e.ratings.map((e) => e.toEntity).toList(),
          ),
        )
        .toList();

    yield Right(wines);

    final winesModelsWithImage =
        wineModels.where((element) => element.imageUrl != null);
    final winesWithImage = wines
        .where((element) =>
            winesModelsWithImage.any((model) => element.name == model.name))
        .toList();
    for (final currentWine in winesWithImage) {
      final imagePath = _getImagePath(
        gameId: currentWine.id,
        wineModels: wineModels,
      );

      final foImage = await getImageBytes(
        id: currentWine.id,
        name: currentWine.name,
        imagePath: imagePath,
        localImageStorageAPI: localImageStorageAPI,
        cloudImageStorageAPI: cloudImageStorageAPI,
      );

      yield foImage.fold(
        (l) => Left(l),
        (r) {
          currentWine.imageBytes = r;
          return Right(wines);
        },
      );
    }
  }

  String _getImagePath({
    required String gameId,
    required List<WineModel> wineModels,
  }) =>
      wineModels.firstWhere((element) => element.id == gameId).imageUrl!;
}