import 'dart:io';
import 'dart:typed_data';

import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/core/beer_and_games/errors/local_failure.dart';
import 'package:beer_and_games/core/data/datasource/image_storage_api.dart';
import 'package:dartz/dartz.dart';
import 'package:path_provider/path_provider.dart';

class LocalImageStorageAPI extends ImageStorageAPI {
  Future<Directory> get _appDocumentsDir async =>
      await getApplicationDocumentsDirectory();

  Future<Either<LocalFailure, void>> writeImage(
    String imagePath,
    Uint8List bytes,
  ) async {
    try {
      final path = (await _appDocumentsDir).path + imagePath;
      final file = File(path);
      if (!file.existsSync()) file.createSync(recursive: true);
      await file.writeAsBytes(bytes);
      return const Right(null);
    } catch (e) {
      return Left(LocalFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<LocalFailure, Uint8List>> downloadImage(
    String imagePath,
  ) async {
    try {
      final path = (await _appDocumentsDir).path + imagePath;
      final file = File(path);
      if (!file.existsSync()) return Left(LocalFailure.fileNotFound());

      final bytes = await file.readAsBytes();
      return Right(Uint8List.fromList(bytes));
    } catch (e) {
      return Left(LocalFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> uploadImage(
    String imagePath,
    Uint8List bytes,
  ) async {
    try {
      final path = (await _appDocumentsDir).path + imagePath;
      final file = File(path);
      if (!file.existsSync()) return Left(LocalFailure.fileNotFound());

      await file.writeAsBytes(bytes);
      return const Right(null);
    } catch (e) {
      return Left(LocalFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteImage(String imagePath) async {
    try {
      final path = (await _appDocumentsDir).path + imagePath;
      final file = File(path);
      if (!file.existsSync()) return const Right(null);
      await file.delete();
      return const Right(null);
    } catch (e) {
      return Left(LocalFailure.unknown(e.toString()));
    }
  }

  Future<Either<Failure, void>> deleteAll() async {
    try {
      final dir = await _appDocumentsDir;
      final files = dir.listSync();
      for (final file in files) {
        if (file is File) {
          await file.delete();
        } else if (file is Directory) {
          await file.delete(recursive: true);
        }
      }
      return const Right(null);
    } catch (e) {
      return Left(LocalFailure.unknown(e.toString()));
    }
  }
}
