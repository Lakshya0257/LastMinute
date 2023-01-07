import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:last_minute_driver/utils/error_handler/error_text.dart';
class APIException implements Exception{
  final String message;

  APIException({required this.message});
}

class ExceptionHandler {
  ExceptionHandler._privateConstructor();

  static APIException handleError(Exception error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.sendTimeout:
          return APIException(message: ErrorMessages.noInternet);
        case DioErrorType.connectTimeout:
          return APIException(message: ErrorMessages.connectionTimeout);
        case DioErrorType.response:
          
            return APIException(message: ErrorMessages.networkGeneral);
          
        default:
          if (error.error is SocketException) {
            return APIException(
              message:
              error.error.osError?.message ?? ErrorMessages.networkGeneral,
            );
          }
          return APIException(message: ErrorMessages.networkGeneral);
      }
    } else {
      return APIException(message: ErrorMessages.networkGeneral);
    }
  }
}

class ErrorHandler {
  ErrorHandler._privateConstructor();

  static handleError(APIException? error) {
    displayError(error?.message ?? ErrorMessages.networkGeneral);
  }

  static displayError(String? error) {
    Get.rawSnackbar(message: error ?? ErrorMessages.networkGeneral);
  }
}
