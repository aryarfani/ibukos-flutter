import 'package:dio/dio.dart';

class BaseService {
  Dio _dio() {
    final options = BaseOptions(baseUrl: 'https://ibukos.arfani.my.id/api/');
    var dio = Dio(options);

    return dio;
  }

  Dio get dio => _dio();
}
