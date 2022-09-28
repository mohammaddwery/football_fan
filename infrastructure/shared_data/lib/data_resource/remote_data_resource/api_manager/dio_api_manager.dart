import 'package:flutter/cupertino.dart';
import 'package:shared_data/data_resource/remote_data_resource/helper/api_error_handler.dart';
import 'package:dio/dio.dart';
import 'api_manager.dart';

class DioApiManager with ApiManager {
  final Dio _dio;
  DioApiManager({
    required dio,
  }) : _dio = dio;

  static const String logTag = 'DioApiManager';

  Future<dynamic> _handleApiRequest({
    required Future<Response<dynamic>> request,
  }) async {
    try {
      final response = await request;
      debugPrint('----------------------------------------');
      debugPrint('RESPONSE: $response');
      debugPrint('----------------------------------------');
      return response.data;
    } on DioError catch (e) {
      debugPrint('----------------------------------------');
      debugPrint('DioError: $e');
      debugPrint('----------------------------------------');
      ApiErrorHandler.onError(e);
    } catch (e) {
      debugPrint('----------------------------------------');
      debugPrint('Exception: $e');
      debugPrint('----------------------------------------');
      throw const FormatException('something_went_wrong');
    }
  }


  @override
  close({bool force= false}) {
    _dio.close(force: force);
  }

  @override
  Future<dynamic> get({required String url, Map<String, String?> headers = const {}}) async {
    debugPrint('----------------------------------------');
    debugPrint('URL: $url');
    return await _handleApiRequest(
      request: _dio.get(url, options: Options(headers: headers,),),
    );
  }

}