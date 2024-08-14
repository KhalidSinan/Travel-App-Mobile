import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travelapp_flutter/core/helpers/api_service.dart';
import 'package:travelapp_flutter/core/helpers/failure.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/core/helpers/status_code_handlers.dart';
import 'package:travelapp_flutter/features/announcements/data/repos/announcements_repo.dart';

class AnnouncementsRepoImpl extends AnnouncementsRepo {
  AnnouncementsRepoImpl(this.apiService);
  final ApiService apiService;

  @override
  Future<Either<Failure, Map<String, dynamic>>> getAnnouncementsOptions({
    required String tripId,
  }) async {
    try {
      Map<String, dynamic> response =
          await apiService.get(endPoint: '/announcements/$tripId/options');
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
  Future<Either<Failure, Map<String, dynamic>>> makeAnnouncement({
    required String tripId,
    required int duration,
    required String location,
    String? title,
    String? body,
  }) async {
    try {
      Map<String, dynamic> response = await apiService.post(
        endPoint: '/announcements/$tripId',
        body: {
          "announcement_title": title,
          "announcement_body": body,
          "num_of_days": duration,
          "location": location,
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
