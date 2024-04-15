import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
    getIt.get<ApiService>(),
  ));
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);
}
