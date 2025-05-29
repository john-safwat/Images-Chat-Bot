import 'package:chat_bot/core/constants/api_constants.dart';
import 'package:chat_bot/core/di/di.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio provideDio() {
    Dio dio = Dio();

    dio.options.baseUrl = ApiConstants.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 100);
    dio.options.contentType = "application/json";
    dio.options.receiveTimeout = const Duration(seconds: 100);
    dio.options.headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer sk_c74IkrgzmWgMo2mWbfzXrGwc"
    };
    dio.options.validateStatus = (status) {
      return true;
    };
    dio.interceptors.add(getIt<PrettyDioLogger>());
    return dio;
  }

  @lazySingleton
  PrettyDioLogger providePrettyDioLogger() {
    return PrettyDioLogger(
      enabled: kDebugMode,
      error: true,
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    );
  }
}
