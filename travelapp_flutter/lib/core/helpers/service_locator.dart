import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
    getIt.get<ApiService>(),
  ));
}
