import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data/login/repos/login_repo.dart';
import '../../data/sign_up/repos/sign_up_repo.dart';
import '../../features/auth/login/cubit/login_cubit.dart';
import '../../features/auth/sign_up/cubit/sign_up_cubit.dart';
import '../api_helper/dio_factory.dart';
import '../networking/api_manager.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiManager>(
    () => ApiManager(dio),
  );
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(getIt()),
  );

  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(loginRepo: getIt()),
  );

  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepo(apiManager: getIt()),
  );

  getIt.registerFactory<SignUpCubit>(
    () => SignUpCubit(signUpRepo: getIt()),
  );
}
