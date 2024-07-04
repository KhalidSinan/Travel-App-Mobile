import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/status_code_handlers.dart';
import 'package:travelapp_flutter/features/settings/data/repos/settings_repo.dart';

class SettingsRepoImpl extends SettingsRepo {
  final ApiService apiService;

  SettingsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getCities()async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: "/hotels/cities");
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      } else {
        return left(Failure(errMessage: 'Something went wrong'));
      }
    }
  }
}