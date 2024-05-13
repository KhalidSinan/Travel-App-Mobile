import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://9f98-46-53-13-33.ngrok-free.app';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get(
      {required String endPoint, Map<String, dynamic>? headers}) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint',
      options: Options(
        headers: headers,
      ),
    );
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
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NDFkNGExZTQwYmZmNzM5N2M0NmU5MiIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IkFiZCIsImxhc3RfbmFtZSI6IkF1c2hhciJ9LCJpYXQiOjE3MTU1OTY0MTl9.vEbH-nGvX94KmgMBX3k3k1yFypB-lQU8KnYbZeq5ouw',
        },
      ),
    );
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
}
