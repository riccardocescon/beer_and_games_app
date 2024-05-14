import 'dart:developer';
import 'dart:typed_data';

import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/core/beer_and_games/errors/local_failure.dart';
import 'package:beer_and_games/core/extentions/either_extensions.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/cloud_image_storage_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/local_image_storage_api.dart';
import 'package:dartz/dartz.dart';
import 'package:crypto/crypto.dart' as crypto;

mixin ImageSelectorApiHelper {
  Future<Either<Failure, Uint8List>> getImageBytes({
    required String id,
    required String name,
    required String imagePath,
    required String cloudHash,
    required LocalImageStorageAPI localImageStorageAPI,
    required CloudImageStorageAPI cloudImageStorageAPI,
  }) async {
    final foLocalImage = await localImageStorageAPI.downloadImage(imagePath);
    final isError = foLocalImage.isLeft() && foLocalImage.left is! FileNotFound;
    if (isError) return Left(foLocalImage.left);

    if (foLocalImage.isRight()) {
      final localHash = crypto.md5.convert(foLocalImage.right).toString();
      if (localHash == cloudHash) {
        log(
          'Image $name loaded from local storage',
          name: 'GameRepositoryImpl',
        );
        return Right(foLocalImage.right);
      }
    }

    final foBytes = await cloudImageStorageAPI.downloadImage(imagePath);
    if (foBytes.isLeft()) return Left(foBytes.left);

    final bytes = foBytes.right;

    final foWrite = await localImageStorageAPI.writeImage(imagePath, bytes);
    if (foWrite.isLeft()) {
      log(
        'Error writing image to local storage (${foWrite.left.toString()})',
        name: 'GameRepositoryImpl',
      );
      return Left(foWrite.left);
    }

    log(
      foLocalImage.isLeft()
          ? 'Image $name downloaded from cloud'
          : 'Image $name updated from cloud',
      name: 'GameRepositoryImpl',
    );
    return Right(bytes);
  }
}
