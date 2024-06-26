import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:qhali_app/controller/user_cubit.dart';
import 'package:qhali_app/services/user_service.dart';

final injector = GetIt.instance;

Future<void> init() async {
  // Bloc
  injector.registerFactory(() => UserCubit(injector()));

  // Remote Data sources
  injector.registerLazySingleton(() => UserService(injector()));

  // External Services
  injector.registerLazySingleton(() => Dio(
        BaseOptions(
          headers: {
            'Content-Type': 'application/json',
            'Accept': '*/*',
          },
          baseUrl: 'https://jsonplaceholder.typicode.com',
          receiveTimeout: const Duration(seconds: 150),
          connectTimeout: const Duration(seconds: 150),
        ),
      ));
}
