import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'http://192.168.1.107:5000';
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
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MmI0MjQxYmEyOGM4MzM3ZjJmYjMyNiIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IkFiZCIsImxhc3RfbmFtZSI6IkF1c2hhciJ9LCJpYXQiOjE3MTQyMTIxNzF9.2IFqpwvbouYJ37ms4YpbutMnGOGKvcYQ4_HnrGXtmA0',
        },
      ),
    );
    return response.data;
  }
}
