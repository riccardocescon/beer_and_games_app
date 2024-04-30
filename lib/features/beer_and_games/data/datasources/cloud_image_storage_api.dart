import 'dart:typed_data';

import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/core/data/datasource/image_storage_api.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CloudImageStorageAPI extends ImageStorageAPI {
  final FirebaseStorage storage;

  CloudImageStorageAPI({required this.storage});

  @override
  Future<Either<CloudFailure, Uint8List>> downloadImage(
    String imagePath,
  ) async {
    try {
      final bytes = await storage.ref().child(imagePath).getData();
      //TODO: handle null case
      return Right(Uint8List.fromList(bytes!));
    } catch (e) {
      return Left(CloudFailure.unknown(e.toString()));
    }
  }
}
