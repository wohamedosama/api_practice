import 'package:api_practice/bloc/cubit/user_cubit.dart';
import 'package:api_practice/repo/my_repo.dart';
import 'package:api_practice/services/web_services.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void getInject() {
  getIt.registerLazySingleton<UserCubit>(() => UserCubit(getIt()));
  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetupDio()));
}
