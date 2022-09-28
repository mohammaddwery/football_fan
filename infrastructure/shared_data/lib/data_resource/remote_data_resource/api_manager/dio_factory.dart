import 'package:dio/dio.dart';

class DioFactory {
  Dio provideDio({required String baseUrl, Interceptor? interceptor}) {
    Dio dio = Dio()..options.baseUrl = baseUrl;
    if(interceptor!=null) dio.interceptors.add(interceptor);
    return dio;
  }
}