import 'package:dio/dio.dart';
import 'package:travelapp_flutter/core/helpers/service_locator.dart';
import 'package:travelapp_flutter/features/auth/data/repos/auth_repo_impl.dart';

class ApiService {
  final String baseUrl = 'http://10.0.2.2:5000';
  //10.0.2.2
  final Dio _dio;
<<<<<<< Updated upstream
  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImVjODYwY2VlYmFlZTZmOTBlN2UxYmM4MiIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IkRhbWVvbiIsImxhc3RfbmFtZSI6IlB1cmR5In0sImlhdCI6MTcyMzc1MDk3OX0.-nm3Pw-LoEiW5hjUQf_YDym9jurLOfdTP68LD8iLsfA';
=======
  // final String token =
  //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNmZmNlNGY1NWYzYzAyZGI5ZjU1Y2I3YyIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6Ik1hcmlhbSIsImxhc3RfbmFtZSI6IkJlcmdzdHJvbSJ9LCJpYXQiOjE3MjM3MzYxOTh9.yxeil1og7S4PvyvJbfLfBm6WwSGBNrNSVgsM5X_DxQk';
>>>>>>> Stashed changes
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
