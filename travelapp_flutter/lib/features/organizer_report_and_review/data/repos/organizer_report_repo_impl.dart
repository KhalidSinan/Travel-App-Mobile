import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/status_code_handlers.dart';
import 'package:travelapp_flutter/features/organizer_report_and_review/data/repos/organizer_report_repo.dart';

class OrganizerReportRepoImpl extends OrganizerReportRepo {
  OrganizerReportRepoImpl(this.apiService);
  final ApiService apiService;

  @override
  Future<Either<Failure, Map<String, dynamic>>> getOrganizersForReport() async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: '/reports/organizers');
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      }
      return left(Failure(errMessage: 'Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> reportOrganizer({
    required String organizerId,
    required String title,
    required String message,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: '/reports/organizers/$organizerId',
        body: {
          "report_title": title,
          "report_message": message,
        },
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      }
      return left(Failure(errMessage: 'Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> reviewOrganizer({
    required String tripId,
    required int rate,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: '/organized-trips/$tripId/rate',
        body: {
          "rating": rate,
        },
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
            Failure.fromDioException(e, getIt.get<DefaultStatusCodeHandler>()));
      }
      return left(Failure(errMessage: 'Something went wrong'));
    }
  }
}
