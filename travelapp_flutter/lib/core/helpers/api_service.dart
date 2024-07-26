import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'http://10.0.2.2:5000';
  //10.0.2.2
  final Dio _dio;
  final String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2OTdlZWRlNzY1NDhjMzBhM2EwNWVhNCIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IkFiZCIsImxhc3RfbmFtZSI6IkF1c2hhciJ9LCJpYXQiOjE3MjE5ODQ3OTV9.6ryrGuI7PL5YoO52tB8OncnUPJInyzZi21frFkwgmss';
  ApiService(this._dio);

  Future<Map<String, dynamic>> get(
      {required String endPoint,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? extra}) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint',
      options: Options(
        headers: headers ??
            {
              'Authorization': 'Bearer $token',
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
      '$_baseUrl$endPoint',
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
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
    Map<String, dynamic>? headers,
  }) async {
    var response = await _dio.delete(
      '$_baseUrl$endPoint',
      data: body,
      options: Options(
        headers: headers,
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
      '$_baseUrl$endPoint',
      data: body,
      queryParameters: queryParameters,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
    print(response.statusCode);
    print(response);
    return response.data;
  }
}
