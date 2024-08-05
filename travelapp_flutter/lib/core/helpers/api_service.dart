import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'http://192.168.1.5:5000';
  //10.0.2.2
  final Dio _dio;
  final String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVlNWRmZDhhOGY3ZTUxNmJiZTdmMzI3YiIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IkJyaWNlIiwibGFzdF9uYW1lIjoiS2lybGluIn0sImlhdCI6MTcyMjc4MTE1OX0.msTEbmDnjML1GkHxzy_aDnOo9mr4XCdPxNUdAlSUacY';
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
