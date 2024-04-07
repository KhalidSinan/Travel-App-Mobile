import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://52e6-46-53-127-125.ngrok-free.app';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required dynamic body,
  }) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: body,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    return response.data;
  }
}
