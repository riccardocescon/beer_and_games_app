import 'package:beer_and_games/features/beer_and_games/data/datasources/hangout_api.dart';
import 'package:beer_and_games/features/beer_and_games/data/repositories/hangout_repository_impl.dart';
import 'package:beer_and_games/features/beer_and_games/domain/repositories/hangout_repository.dart';
import 'package:beer_and_games/features/beer_and_games/domain/usecases/hangout_usecases.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/hangout/hangout_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/edit_hangout/edit_hangout_page_bloc.dart';
import 'package:beer_and_games/features/beer_and_games/presentation/bloc/ui/homepage/homepage_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;
void init() {
  // Bloc
  sl.registerLazySingleton(() => HangoutBloc(hangoutStream: sl()));
  sl.registerLazySingleton(() => HomepageBloc(hangoutBloc: sl()));
  sl.registerFactory(
    () => EditHangoutPageBloc(
      hangoutDateTimeUpdate: sl(),
    ),
  );

  // Use cases
  sl.registerFactory(() => HangoutStream(repository: sl()));
  sl.registerFactory(() => HangoutDateTimeUpdate(repository: sl()));

  // Repository
  sl.registerFactory<HangoutRepository>(
    () => HangoutRepositoryImpl(hangoutAPI: sl()),
  );

  // Data sources
  sl.registerFactory(() => HangoutAPI(firestore: sl()));

  // External
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
}
