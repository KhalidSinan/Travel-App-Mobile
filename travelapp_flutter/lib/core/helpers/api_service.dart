import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = 'http://10.0.2.2:5000';
  //10.0.2.2
  final Dio _dio;
<<<<<<< HEAD
  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Ijc1MDZhYTBjMGI2YzIzZmE0NmM4NGJkYiIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IlNoYWluYSIsImxhc3RfbmFtZSI6IldlYmVyIn0sImlhdCI6MTcyMzU0MTc3N30.P48tFx8yEb6kAmoDg_b2aFrx-CaFGxS0_puXYYCCywY';
=======
  final String token =
<<<<<<< HEAD
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNiYzRmYWVlYmI5YmMzZWI4ZmVhNGUwYyIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IkFydmlkIiwibGFzdF9uYW1lIjoiS296ZXkifSwiaWF0IjoxNzIzNTY2MzkwfQ.KLbi7ARgj50OPDusDB39aN3D53GMSSTKWyynNmUOdoQ';
=======
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjAxM2Y3YmI0ZmRiNWVmY2VjZTIzZmFhYiIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IkxlbGEiLCJsYXN0X25hbWUiOiJMZWdyb3MifSwiaWF0IjoxNzIzNDc2NDI2fQ.AeK1gEmdchoMoPY6FaERlWOtj5GIdltSWAaXcrPxC1U';
>>>>>>> a4d71f9698209f4f49308153e0ee49ccef7d5529
>>>>>>> 2c44f886ba263ab71a8c6d9cf8f90252042a60ea
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
