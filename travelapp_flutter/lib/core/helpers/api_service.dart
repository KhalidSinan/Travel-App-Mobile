import 'package:dio/dio.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';

class ApiService {
  final String baseUrl = 'http://10.0.2.2:5000';
  //10.0.2.2
  final Dio _dio;
<<<<<<< HEAD
  // final String token =
  //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNmZmNlNGY1NWYzYzAyZGI5ZjU1Y2I3YyIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6Ik1hcmlhbSIsImxhc3RfbmFtZSI6IkJlcmdzdHJvbSJ9LCJpYXQiOjE3MjM3MzYxOTh9.yxeil1og7S4PvyvJbfLfBm6WwSGBNrNSVgsM5X_DxQk';
=======


  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE3OGY2YTdjNmJkZTdlYjBmMGZkZWJkMCIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IkNhbXJ5biIsImxhc3RfbmFtZSI6IkZyaWVzZW4ifSwiaWF0IjoxNzIzNzg4NTAxfQ.YBkBIm-o7wX1RnDK22KYhrKNGdmO8_tsNP5e0ONeEQ8';
>>>>>>> d7d934584a424f7c1f6990003654c6ce4ac59de9
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async {
    var response = await _dio.get(
      '$baseUrl$endPoint',
      options: Options(
        headers: headers ??
            {
              'Authorization': 'Bearer ${getIt.get<AuthRepoImpl>().token}',
            },
        extra: extra,
      ),
    );
    print(response.statusCode);
     print(response);
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required dynamic body,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await _dio.post(
      '$baseUrl$endPoint',
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${getIt.get<AuthRepoImpl>().token}',
        },
      ),
    );
    print(response.statusCode);
    print(response);
    return response.data;
  }

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    required dynamic body,
  }) async {
    var response = await _dio.delete(
      '$baseUrl$endPoint',
      data: body,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${getIt.get<AuthRepoImpl>().token}',
        },
      ),
    );
    print(response.statusCode);
    print(response);
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    required dynamic body,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await _dio.put(
      '$baseUrl$endPoint',
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${getIt.get<AuthRepoImpl>().token}',
        },
      ),
    );
    print(response.statusCode);
    print(response);
    return response.data;
  }
}
