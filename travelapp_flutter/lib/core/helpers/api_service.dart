import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'http://192.168.1.117:5000';
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
          'Authorization':
<<<<<<< Updated upstream
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MmQyNDkzOTc2MjUxMWQ0ZTZjYTg2OCIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IkFiZCIsImxhc3RfbmFtZSI6IkF1c2hhciJ9LCJpYXQiOjE3MTcyNzA3NDB9.qpz2IipqrCzlRDFgn0q0ET_lnPAYCv5F5F7OiwCxDPk',
=======
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2NWVjNmEwNGE3NDcyN2E0ZWIxYjFlNiIsIm5hbWUiOnsiZmlyc3RfbmFtZSI6IkFiZCIsImxhc3RfbmFtZSI6IkF1c2hhciJ9LCJpYXQiOjE3MTc0ODczMTJ9.aV_SZti2MQkLD76c8Ndbt3a-vY2JcL2A58W4SPsmv6E',
>>>>>>> Stashed changes
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
}
