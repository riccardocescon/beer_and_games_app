import 'dart:typed_data';

import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ImageStorageAPI {
  // Future<String> uploadImage(
  //   String path,
  //   String imageName,
  //   String imageExtension,
  // );
  Future<Either<Failure, Uint8List>> downloadImage(String imagePath);
  // Future<void> deleteImage(
  //   String path,
  //   String imageName,
  //   String imageExtension,
  // );
}
