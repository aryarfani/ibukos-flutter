import 'package:dio/dio.dart';
import 'package:ibukos/core/utils/logging_interceptors.dart';

class BaseService {
  Dio _dio() {
    final options = BaseOptions(
      baseUrl: 'https://ibukos.arfani.my.id/api/',
    );
    var dio = Dio(options);

    // adding logging interceptor
    // to show all data flow
    // and add token on specific request
    dio.interceptors.add(LoggingInterceptors());

    return dio;
  }

  Dio get dio => _dio();
}
