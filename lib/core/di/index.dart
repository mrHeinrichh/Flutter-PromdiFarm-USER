import 'package:get_it/get_it.dart';
import 'package:promdifarm_app/data/sources/index.dart';
import 'package:promdifarm_app/domain/repositories/index.dart';
import 'package:promdifarm_app/domain/sources/index.dart';
import 'package:promdifarm_app/view/bloc/button/button.cubit.dart';
import 'package:promdifarm_app/view/bloc/index.dart';
import 'package:promdifarm_app/data/repositories/index.dart';
import 'package:promdifarm_app/core/services/index.dart';

// This is our global ServiceLocator
GetIt sl = GetIt.instance;

void init() {
  // Register Services
  registerServices();

  // Register Sources
  registerSources();

  // Register Repositories
  registerRepositories();

  // Register Cubits
  registerCubits();
}

void registerServices() {
  sl.registerLazySingleton(() => NetworkService());
  sl.registerLazySingleton(() => LocationService());
  sl.registerLazySingleton(() => DirectionsService());
  sl.registerLazySingleton(() => LocalStorageService());
}

void registerSources() {
  sl.registerLazySingleton<DeliverySource>(
    () => DeliverySourceImp(
      netService: sl(),
      dirService: sl(),
      localStorage: sl(),
      locService: sl(),
    ),
  );
  sl.registerLazySingleton<MapSource>(() => MapSourceImp(dirService: sl()));
}

void registerRepositories() {
  sl.registerFactory<DeliveriesRepository>(
    () => DeliveriesRepositoryImp(sl()),
  );
  sl.registerLazySingleton<UsersRepository>(
    () => UsersRepository(
      networkService: sl(),
      localStorage: sl(),
    ),
  );
  sl.registerLazySingleton<MapRepository>(() => MapRepositoryImp(sl()));
}

void registerCubits() {
  sl.registerFactory<DeliveriesCubit>(() => DeliveriesCubit(repository: sl()));
  sl.registerFactory<UserCubit>(() => UserCubit(repository: sl()));
  sl.registerFactory<MapCubit>(() => MapCubit(repository: sl()));
  sl.registerFactory<ButtonCubit>(() => ButtonCubit());
}
