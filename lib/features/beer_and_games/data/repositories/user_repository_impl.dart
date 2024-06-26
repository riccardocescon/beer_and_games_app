import 'package:beer_and_games/core/beer_and_games/errors/cloud_failure.dart';
import 'package:beer_and_games/core/beer_and_games/errors/failure.dart';
import 'package:beer_and_games/core/extentions/either_extensions.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/auth_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/local_image_storage_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/user_api.dart';
import 'package:beer_and_games/features/beer_and_games/domain/entities/user.dart';
import 'package:beer_and_games/features/beer_and_games/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl extends UserRepository {
  final AuthAPI authAPI;
  final UserAPI userAPI;
  final LocalImageStorageAPI localImageStorageAPI;

  UserRepositoryImpl({
    required this.authAPI,
    required this.userAPI,
    required this.localImageStorageAPI,
  });

  @override
  Future<Either<CloudFailure, User>> signInWithGoogle() async {
    final foAuth = await authAPI.signInWithGoogle();
    if (foAuth.isLeft()) return Left(foAuth.left);

    final foUser = await userAPI.insert(user: foAuth.right);
    if (foUser.isLeft()) return Left(foUser.left);

    return Right(foUser.right.toEntity);
  }

  @override
  Future<Either<CloudFailure, User>> get({required String email}) async {
    final foUser = await userAPI.select(email: email);
    if (foUser.isLeft()) return Left(foUser.left);

    return Right(foUser.right.toEntity);
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    final foSignOut = await authAPI.signOutFromGoogle();
    if (foSignOut.isLeft()) return Left(foSignOut.left);

    final foDeleteImages = await localImageStorageAPI.deleteAll();

    return foDeleteImages.fold((l) => Left(l), (r) => const Right(null));
  }
}
