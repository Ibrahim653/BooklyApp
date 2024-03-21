import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test/core/utils/api_service.dart';
import 'package:test/features/home/data/repos/home_repo_impl.dart';
import 'package:test/features/search/data/repos/search_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
    getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(getIt.get<ApiService>()));
}
