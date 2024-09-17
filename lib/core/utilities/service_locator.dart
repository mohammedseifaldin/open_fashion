import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../sources/dio_helper.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///USE CASES
    // sl.registerLazySingleton(() => LoginUserUseCase(sl()));
    // sl.registerLazySingleton(() => RegisterUserUseCase(sl()));
    // sl.registerLazySingleton(() => LogoutUserUseCase());
    // sl.registerLazySingleton(() => PrivacyPolicyUseCase(sl()));
    // sl.registerLazySingleton(() => UseTermsUseCase(sl()));
    // // sl.registerLazySingleton(() => GetUserUseCase(sl()));
    // // sl.registerLazySingleton(() => UpdateUserDataUseCase(sl()));
    // // sl.registerLazySingleton(() => UpdateUserPhotoUseCase(sl()));
    // // sl.registerLazySingleton(() => UpdateUserPasswordUseCase(sl()));

    // ///REPOSITORY
    // sl.registerLazySingleton<BaseLoginRepo>(() => LoginRepository(sl()));
    // // sl.registerLazySingleton<BaseProfileRepo>(() => ProfileRepository(sl()));

    // ///DATA SOURCE
    // sl.registerLazySingleton<LoginController>(() => LoginController(sl()));
    // // sl.registerLazySingleton<ProfileController>(() => ProfileController(sl()));
    // // sl.registerLazySingleton<DataSource>(() => DataSource());

    ///DIO HELPER
    sl.registerLazySingleton<DioHelper>(() => DioHelper());
    sl.registerLazySingleton<DotEnv>(() => DotEnv());
    sl.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());
  }
}
