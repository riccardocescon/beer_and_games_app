import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/core/enums/rating.dart';
import 'package:beer_and_games/core/extentions/either_extensions.dart';
import 'package:beer_and_games/core/extentions/list_extensions.dart';
import 'package:beer_and_games/core/mixin/image_selector_api_helper.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/beer_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/cloud_image_storage_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/local_image_storage_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/models/beer_model.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/ratable_item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/beer.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/user_rating.dart';
import 'package:beer_and_games/features/beer_and_games/domain/repositories/beer_repository.dart';
import 'package:dartz/dartz.dart';

class BeerRepositoryImpl extends BeerRepository with ImageSelectorApiHelper {
  final BeerAPI beerAPI;
  final CloudImageStorageAPI cloudImageStorageAPI;
  final LocalImageStorageAPI localImageStorageAPI;

  BeerRepositoryImpl({
    required this.beerAPI,
    required this.cloudImageStorageAPI,
    required this.localImageStorageAPI,
  });

  @override
  Stream<Either<Failure, List<Beer>>> select() async* {
    final foBeersStream = beerAPI.getBeers();

    await for (final foBeers in foBeersStream) {
      if (foBeers.isLeft()) {
        yield Left(foBeers.left);
        return;
      }
      final beerModels = foBeers.right;
      final beers = beerModels
          .map(
            (e) => Beer(
              id: e.id,
              name: e.name,
              ratings: e.ratings.map((e) => e.toEntity).toList(),
            ),
          )
          .toList();

      yield Right(beers);

      final beersModelsWithImage =
          beerModels.where((element) => element.imageUrl != null);
      final beersWithImage = beers
          .where((element) =>
              beersModelsWithImage.any((model) => element.name == model.name))
          .toList();
      for (final currentBeer in beersWithImage) {
        final imagePath = _getImagePath(
          gameId: currentBeer.id,
          beerModels: beerModels,
        );

        final foImage = await getImageBytes(
          id: currentBeer.id,
          name: currentBeer.name,
          imagePath: imagePath,
          localImageStorageAPI: localImageStorageAPI,
          cloudImageStorageAPI: cloudImageStorageAPI,
        );

        yield foImage.fold(
          (l) => Left(l),
          (r) {
            currentBeer.imageBytes = r;
            return Right(beers);
          },
        );
      }
    }
  }

  String _getImagePath({
    required String gameId,
    required List<BeerModel> beerModels,
  }) =>
      beerModels.firstWhere((element) => element.id == gameId).imageUrl!;

  @override
  Future<Either<CloudFailure, void>> updateRating({
    required String userEmail,
    required Rating rating,
    required RateableItem item,
  }) async {
    final foVote =
        item.ratings.firstWhereOrNull((e) => e.userEmail == userEmail);
    if (foVote != null) {
      final index = item.ratings.indexOf(foVote);
      item.ratings[index] = foVote.copyWith(rating: rating);
    } else {
      item.ratings.add(UserRating(userEmail: userEmail, rating: rating));
    }
    return await beerAPI.updateRating(
      beerId: item.id,
      ratings: item.ratings,
    );
  }
}
