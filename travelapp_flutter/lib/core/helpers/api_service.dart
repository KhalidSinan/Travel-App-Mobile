import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'http://192.168.1.7:5000';
  final Dio _dio;
//http://10.0.2.2:5000
  ApiService(this._dio);

  Future<Map<String, dynamic>> get(
      {required String endPoint,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? extra}) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint',
      options: Options(
        headers: headers,
        extra: extra,
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
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NTVjNzc5MjI2NzY1Y2VjYzVlNzZiMCIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6InRpbWEiLCJsYXN0X25hbWUiOiJkYXdhYSJ9LCJpYXQiOjE3MTcyMzI0NjF9.1O2pEyIztv5ddmUt9VUnc3fVRqQ4JCcofvzK8CijHb0',
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
