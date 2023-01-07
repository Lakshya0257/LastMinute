import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../utils/error_handler/error_handler.dart';


class NetworkRequester {
  late Dio _dio;

  NetworkRequester._privateConstructor() {
    prepareRequest();
  }

  static final NetworkRequester shared = NetworkRequester._privateConstructor();

  void prepareRequest() {
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 10000,
      baseUrl: 'https://api.distancematrix.ai/maps/api/distancematrix/',
      contentType: Headers.formUrlEncodedContentType,
      responseType: ResponseType.json,
      
    );
    

    _dio = Dio(dioOptions);

    _dio.interceptors.clear();

    _dio.interceptors.addAll([
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        logPrint: _printLog,
      )
    ]);
  }

  _printLog(Object object) => log(object.toString());

  Future<dynamic> get({
    required String path,
    
  }) async {
    try {
      final response = await _dio.get(path);
      return response.data;
    } on Exception catch (exception) {
      return ExceptionHandler.handleError(exception);
    }
  }

  
}