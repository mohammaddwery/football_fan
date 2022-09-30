import 'package:dio/dio.dart';

class DioFactory {
  Dio provideDio({required String baseUrl, required String apiKey}) {
    Dio dio = Dio();
    Map<String, dynamic> headers = {
      'x-rapidapi-host': 'v3.football.api-sports.io',
      'x-rapidapi-key': apiKey,
    };
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      headers: headers,
    );
    return dio;
  }
}