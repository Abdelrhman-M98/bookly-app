import 'package:bookly_app/Core/utils/api_service.dart';
import 'package:bookly_app/Features/Home/Data/repos/home_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt<ApiService>(),
    ),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepo(
      getIt<ApiService>(),
    ),
  );
}

class AuthRepo {
  final ApiService apiService;
  AuthRepo(this.apiService);
}
