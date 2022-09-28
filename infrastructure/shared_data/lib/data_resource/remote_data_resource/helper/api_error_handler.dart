import 'package:core/core.dart';
import 'package:dio/dio.dart';

class ApiErrorHandler {

  static void onError(DioError dioError,) {
    switch (dioError.type) {
      case DioErrorType.response:
        _handleApiResponseError(dioError.response!);
        break;

      case DioErrorType.other:
        throw const FormatException(AppConstants.connectionErrorMessageKey);

      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        throw const FormatException(AppConstants.timeoutMessageKey);

      default: throw const FormatException(AppConstants.generalErrorMessageKey);
    }
  }

  static _handleApiResponseError(Response errorResponse) {
    final String errorMessage = errorResponse.data['message']??AppConstants.generalErrorMessageKey;
    throw FormatException(errorMessage);
  }

}