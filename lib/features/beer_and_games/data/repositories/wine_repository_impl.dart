import 'dart:developer';
import 'dart:typed_data';

import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/core/enums/rating.dart';
import 'package:beer_and_games/core/extentions/either_extensions.dart';
import 'package:beer_and_games/core/extentions/list_extensions.dart';
import 'package:beer_and_games/core/mixin/image_item_entity_model_getter.dart';
import 'package:beer_and_games/core/mixin/image_selector_api_helper.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/cloud_image_storage_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/local_image_storage_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/wine_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/models/wine_model.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/abstractions/ratable_item.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/user_rating.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/wine.dart';
import 'package:beer_and_games/features/beer_and_games/domain/repositories/wine_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:crypto/crypto.dart' as crypto;

class WineRepositoryImpl extends WineRepository
    with ImageSelectorApiHelper, ImageItemEntityModelGetter<WineModel> {
  final WineAPI wineAPI;
  final CloudImageStorageAPI cloudImageStorageAPI;
  final LocalImageStorageAPI localImageStorageAPI;

  WineRepositoryImpl({
    required this.wineAPI,
    required this.cloudImageStorageAPI,
    required this.localImageStorageAPI,
  });

  @override
  Future<Either<CloudFailure, void>> insert({
    required String name,
    required List<int>? imageBytes,
  }) async {
    final foInsert = await wineAPI.insert(name: name);
    if (foInsert.isLeft()) return foInsert;

    if (imageBytes == null) return const Right(null);

    final id = foInsert.right;
    final path = '/cespuglio/wines/$id.png';
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

    final foUpdate = await wineAPI.updateInfo(
      wineId: id,
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
  Stream<Either<Failure, List<Wine>>> select() async* {
    final foWinesStream = wineAPI.getWines();

    await for (final foWines in foWinesStream) {
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
        final wineModel = searchModel(
          id: currentWine.id,
          models: wineModels,
        );

        final foImage = await getImageBytes(
          id: currentWine.id,
          name: currentWine.name,
          imagePath: wineModel.imageUrl!,
          cloudHash: wineModel.imageHash!,
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
  }

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
    return await wineAPI.updateRating(
      beerId: item.id,
      ratings: item.ratings,
    );
  }

  @override
  Future<Either<CloudFailure, void>> updateInfo({required Wine wine}) async {
    final path = '/cespuglio/wines/${wine.id}.png';
    final hash = wine.imageBytes == null || wine.imageBytes!.isEmpty
        ? null
        : crypto.md5.convert(wine.imageBytes!).toString();

    if (hash == null) {
      final foCloudDelete = await cloudImageStorageAPI.deleteImage(path);
      if (foCloudDelete.isLeft()) log(foCloudDelete.left.toString());

      final foLocalDelete = await localImageStorageAPI.deleteImage(path);
      if (foLocalDelete.isLeft()) log(foLocalDelete.left.toString());
    } else {
      final foCloudUpdate = await cloudImageStorageAPI.uploadImage(
        path,
        Uint8List.fromList(wine.imageBytes!),
      );
      if (foCloudUpdate.isLeft()) log(foCloudUpdate.left.toString());

      final foLocalUpdate = await localImageStorageAPI.uploadImage(
        path,
        Uint8List.fromList(wine.imageBytes!),
      );
      if (foLocalUpdate.isLeft()) log(foLocalUpdate.left.toString());
    }

    return await wineAPI.updateInfo(
      wineId: wine.id,
      name: wine.name,
      imagePath: path,
      imageHash: hash,
    );
  }

  @override
  Future<Either<CloudFailure, void>> delete({required Wine wine}) async {
    final path = '/cespuglio/wines/${wine.id}.png';
    final hasImage = wine.imageBytes != null;

    if (hasImage) {
      final foCloudDelete = await cloudImageStorageAPI.deleteImage(path);
      if (foCloudDelete.isLeft()) log(foCloudDelete.left.toString());

      final foLocalDelete = await localImageStorageAPI.deleteImage(path);
      if (foLocalDelete.isLeft()) log(foLocalDelete.left.toString());
    }

    return await wineAPI.delete(wineId: wine.id);
  }
}
