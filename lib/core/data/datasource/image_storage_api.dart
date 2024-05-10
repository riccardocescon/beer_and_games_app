import 'dart:typed_data';

import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ImageStorageAPI {
  Future<Either<Failure, void>> uploadImage(
    String imagePath,
    Uint8List bytes,
  );
  Future<Either<Failure, Uint8List>> downloadImage(String imagePath);
  Future<Either<Failure, void>> deleteImage(String imagePath);
}
