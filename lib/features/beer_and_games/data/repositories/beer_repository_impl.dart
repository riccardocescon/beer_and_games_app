import 'dart:developer';
import 'dart:typed_data';

import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/core/enums/rating.dart';
import 'package:beer_and_games/core/extentions/either_extensions.dart';
import 'package:beer_and_games/core/extentions/list_extensions.dart';
import 'package:beer_and_games/core/mixin/image_item_entity_model_getter.dart';
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
import 'package:crypto/crypto.dart' as crypto;

class BeerRepositoryImpl extends BeerRepository
    with ImageSelectorApiHelper, ImageItemEntityModelGetter<BeerModel> {
  final BeerAPI beerAPI;
  final CloudImageStorageAPI cloudImageStorageAPI;
  final LocalImageStorageAPI localImageStorageAPI;

  BeerRepositoryImpl({
    required this.beerAPI,
    required this.cloudImageStorageAPI,
    required this.localImageStorageAPI,
  });

  @override
  Future<Either<CloudFailure, void>> insert({
    required String name,
    required List<int>? imageBytes,
  }) async {
    final foInsert = await beerAPI.insert(name: name);
    if (foInsert.isLeft()) return foInsert;

    if (imageBytes == null) return const Right(null);

    final id = foInsert.right;
    final path = '/cespuglio/beers/$id.png';
    final hash = crypto.md5.convert(imageBytes).toString();

    final foCloudUpload = await cloudImageStorageAPI.uploadImage(
      path,
      Uint8List.fromList(imageBytes),
    );
    if (foCloudUpload.isLeft()) log(foCloudUpload.left.toString());

    final foLocalUpload = await localImageStorageAPI.uploadImage(
      path,
      Uint8List.fromList(imageBytes),
    );
    if (foLocalUpload.isLeft()) log(foLocalUpload.left.toString());

    final foUpdate = await beerAPI.updateInfo(
      beerId: id,
      name: name,
      imagePath: path,
      imageHash: hash,
    );

    return foUpdate.fold(
      (l) {
        if (l is NotFound) return const Right(null);

        return Left(l);
      },
      (r) => const Right(null),
    );
  }

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
        final currentBeerModel = searchModel(
          id: currentBeer.id,
          models: beerModels,
        );

        final foImage = await getImageBytes(
          id: currentBeer.id,
          name: currentBeer.name,
          imagePath: currentBeerModel.imageUrl!,
          cloudHash: currentBeerModel.imageHash!,
          localImageStorageAPI: localImageStorageAPI,
          cloudImageStorageAPI: cloudImageStorageAPI,
        );

        yield foImage.fold(
          (l) {
            if (l is NotFound) return Right(beers);

            return Left(l);
          },
          (r) {
            currentBeer.imageBytes = r;
            return Right(beers);
          },
        );
      }
    }
  }

  BeerModel _getImageModel({
    required String gameId,
    required List<BeerModel> beerModels,
  }) =>
      beerModels.firstWhere((element) => element.id == gameId);

  @override
  Future<Either<CloudFailure, void>> updateRating({
    required String userEmail,
    required Rating rating,
    required RateableItem item,
    required bool remove,
  }) async {
    final foVote =
        item.ratings.firstWhereOrNull((e) => e.userEmail == userEmail);
    if (foVote != null) {
      if (remove) {
        item.ratings.remove(foVote);
      } else {
        final index = item.ratings.indexOf(foVote);
        item.ratings[index] = foVote.copyWith(rating: rating);
      }
    } else {
      if (remove) return const Right(null);
      item.ratings.add(UserRating(userEmail: userEmail, rating: rating));
    }
    return await beerAPI.updateRating(
      beerId: item.id,
      ratings: item.ratings,
    );
  }

  @override
  Future<Either<CloudFailure, void>> updateInfo({required Beer beer}) async {
    final path = '/cespuglio/beers/${beer.id}.png';
    final hash = beer.imageBytes == null || beer.imageBytes!.isEmpty
        ? null
        : crypto.md5.convert(beer.imageBytes!).toString();

    if (hash == null) {
      final foCloudDelete = await cloudImageStorageAPI.deleteImage(path);
      if (foCloudDelete.isLeft()) log(foCloudDelete.left.toString());

      final foLocalDelete = await localImageStorageAPI.deleteImage(path);
      if (foLocalDelete.isLeft()) log(foLocalDelete.left.toString());
    } else {
      final foCloudUpdate = await cloudImageStorageAPI.uploadImage(
        path,
        Uint8List.fromList(beer.imageBytes!),
      );
      if (foCloudUpdate.isLeft()) log(foCloudUpdate.left.toString());

      final foLocalUpdate = await localImageStorageAPI.uploadImage(
        path,
        Uint8List.fromList(beer.imageBytes!),
      );
      if (foLocalUpdate.isLeft()) log(foLocalUpdate.left.toString());
    }

    return await beerAPI.updateInfo(
      beerId: beer.id,
      name: beer.name,
      imagePath: path,
      imageHash: hash,
    );
  }

  @override
  Future<Either<CloudFailure, void>> delete({required Beer beer}) async {
    final path = '/cespuglio/beers/${beer.id}.png';
    final hasImage = beer.imageBytes != null;

    if (hasImage) {
      final foCloudDelete = await cloudImageStorageAPI.deleteImage(path);
      if (foCloudDelete.isLeft()) log(foCloudDelete.left.toString());

      final foLocalDelete = await localImageStorageAPI.deleteImage(path);
      if (foLocalDelete.isLeft()) log(foLocalDelete.left.toString());
    }

    return await beerAPI.delete(beerId: beer.id);
  }
}
