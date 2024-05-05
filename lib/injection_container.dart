import 'package:beer_and_games/features/beer_and_games/data/datasources/auth_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/beer_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/cloud_image_storage_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/game_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/hangout_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/local_image_storage_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/user_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/datasources/wine_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/repositories/beer_repository_impl.dart';
import 'package:beer_and_games/features/beer_and_games/data/repositories/game_repository_impl.dart';
import 'package:beer_and_games/features/beer_and_games/data/repositories/hangout_repository_impl.dart';
import 'package:beer_and_games/features/beer_and_games/data/repositories/user_repository_impl.dart';
import 'package:beer_and_games/features/beer_and_games/data/repositories/wine_repository_impl.dart';
import 'package:beer_and_games/features/beer_and_games/domain/repositories/beer_repository.dart';
import 'package:beer_and_games/features/beer_and_games/domain/repositories/game_repository.dart';
import 'package:beer_and_games/features/beer_and_games/domain/repositories/hangout_repository.dart';
import 'package:beer_and_games/features/beer_and_games/domain/repositories/user_repository.dart';
import 'package:beer_and_games/features/beer_and_games/domain/repositories/wine_repository.dart';
import 'package:beer_and_games/features/beer_and_games/domain/usecases/games/games_selector.dart';
import 'package:beer_and_games/features/beer_and_games/domain/usecases/hangout/hangout_usecases.dart';
import 'package:beer_and_games/features/beer_and_games/domain/usecases/user/user_usecases.dart';
import 'package:beer_and_games/features/beer_and_games/domain/usecases/wines/wine_usecases.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/hangout/hangout_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/items/items_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/edit_hangout/edit_hangout_page_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/hangout_stats_page/hangout_stats_page_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/homepage/homepage_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/homepage/widgets/homepage_vote_area_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/user_bloc.dart/user_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'features/beer_and_games/domain/usecases/beers/beer_usecases.dart';

GetIt sl = GetIt.instance;
void init() {
  // Bloc
  sl.registerLazySingleton(
    () => HangoutBloc(
      hangoutStream: sl(),
      hangoutDateTimeUpdate: sl(),
      hangoutUpdateVote: sl(),
      hangoutGetUsersPresence: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => UserBloc(
      userGetter: sl(),
      userSigner: sl(),
      userLogout: sl(),
    ),
  );
  sl.registerLazySingleton(() => HomepageBloc(hangoutBloc: sl()));
  sl.registerFactory(
    () => EditHangoutPageBloc(
      hangoutBloc: sl(),
    ),
  );
  sl.registerFactory(() => HomepageVoteAreaBloc(hangoutBloc: sl()));
  sl.registerFactory(() => HangoutStatsPageBloc(hangoutBloc: sl()));
  sl.registerFactory(
    () => ItemsBloc(
      gamesSelector: sl(),
      beersSelector: sl(),
      beersRatiningUpdater: sl(),
      winesSelector: sl(),
      wineRatingUpdates: sl(),
      beerInfoUpdater: sl(),
    ),
  );

  // Use cases
  sl.registerFactory(() => HangoutStream(repository: sl()));
  sl.registerFactory(() => HangoutDateTimeUpdate(repository: sl()));
  sl.registerFactory(() => HangoutUpdateVote(repository: sl()));
  sl.registerFactory(() => HangoutGetUsersPresence(repository: sl()));
  sl.registerFactory(() => GamesSelector(gameRepository: sl()));
  sl.registerFactory(() => BeersSelector(beerRepository: sl()));
  sl.registerFactory(() => WinesSelector(wineRepository: sl()));
  sl.registerFactory(() => UserGetter(userRepository: sl()));
  sl.registerFactory(() => UserSigner(userRepository: sl()));
  sl.registerFactory(() => UserLogout(userRepository: sl()));
  sl.registerFactory(() => BeersRatiningUpdater(beerRepository: sl()));
  sl.registerFactory(() => WineRatingUpdates(wineRepository: sl()));
  sl.registerFactory(() => BeerInfoUpdater(beerRepository: sl()));

  // Repository
  sl.registerFactory<HangoutRepository>(
    () => HangoutRepositoryImpl(hangoutAPI: sl()),
  );
  sl.registerFactory<GameRepository>(
    () => GameRepositoryImpl(
      gameAPI: sl(),
      cloudImageStorageAPI: sl(),
      localImageStorageAPI: sl(),
    ),
  );
  sl.registerFactory<BeerRepository>(
    () => BeerRepositoryImpl(
      beerAPI: sl(),
      cloudImageStorageAPI: sl(),
      localImageStorageAPI: sl(),
    ),
  );
  sl.registerFactory<WineRepository>(
    () => WineRepositoryImpl(
      wineAPI: sl(),
      cloudImageStorageAPI: sl(),
      localImageStorageAPI: sl(),
    ),
  );
  sl.registerFactory<UserRepository>(
    () => UserRepositoryImpl(
      authAPI: sl(),
      userAPI: sl(),
    ),
  );

  // Data sources
  sl.registerFactory(() => HangoutAPI(firestore: sl()));
  sl.registerFactory(() => GameAPI(firestore: sl()));
  sl.registerFactory(() => BeerAPI(firestore: sl()));
  sl.registerFactory(() => CloudImageStorageAPI(storage: sl()));
  sl.registerFactory(() => LocalImageStorageAPI());
  sl.registerFactory(() => WineAPI(firestore: sl()));
  sl.registerFactory(() => AuthAPI(googleSignIn: sl()));
  sl.registerFactory(() => UserAPI(firestore: sl()));

  // External
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton(() => FirebaseStorage.instance);
  sl.registerLazySingleton(() => GoogleSignIn());
}
