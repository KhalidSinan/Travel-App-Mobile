import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = 'http://10.0.2.2:5000';
  //10.0.2.2
  final Dio _dio;
  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjRiZjlhMjdmOTg1MjBjNTA4YWJjMTYwMiIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IlNjb3R0eSIsImxhc3RfbmFtZSI6IldpbGwifSwiaWF0IjoxNzIzNjYzMTI1fQ.-evnCZ6SQROxoveGMPqzak2jAefpN1MmjcLJ5AXru_0';
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
              'Authorization': 'Bearer $token',
            },
        extra: extra,
      ),
    );
    print(response.statusCode);
    // print(response);
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
  }) async {
    var response = await _dio.delete(
      '$baseUrl$endPoint',
      data: body,
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
          'Authorization': 'Bearer $token',
        },
      ),
    );
    print(response.statusCode);
    print(response);
    return response.data;
  }
}
