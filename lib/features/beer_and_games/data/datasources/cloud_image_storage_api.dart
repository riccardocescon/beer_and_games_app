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
      if (bytes == null) return Left(CloudFailure.notFound());

      return Right(Uint8List.fromList(bytes));
    } on FirebaseException catch (e) {
      if (e.code == 'object-not-found') return Left(CloudFailure.notFound());
      return Left(CloudFailure.unknown(e.toString()));
    } catch (e) {
      return Left(CloudFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CloudFailure, void>> uploadImage(
    String imagePath,
    Uint8List bytes,
  ) async {
    try {
      await storage.ref().child(imagePath).putData(bytes);
      return const Right(null);
    } catch (e) {
      return Left(CloudFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<CloudFailure, void>> deleteImage(String imagePath) async {
    try {
      final ref = storage.ref().child(imagePath);
      await ref.delete();
      return const Right(null);
    } catch (e) {
      return Left(CloudFailure.unknown(e.toString()));
    }
  }
}
