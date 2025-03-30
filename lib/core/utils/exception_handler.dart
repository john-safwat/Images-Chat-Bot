import 'dart:async';
import 'dart:io';

import 'package:chat_bot/core/di/di.dart';
import 'package:chat_bot/core/l10n/translations/app_localizations.dart';
import 'package:chat_bot/core/providers/app_config_provider.dart';
import 'package:chat_bot/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ExceptionHandler on Cubit {
  String mapExceptionToErrorMessage(Exception exception) {
    var locale = getIt<AppConfigProvider>().locale;
    if (exception is SocketException) {
      return locale.socketExceptionMessage;
    } else if (exception is TimeoutException) {
      return locale.timeoutExceptionMessage;
    } else if (exception is HttpException) {
      return locale.httpExceptionMessage;
    } else if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.connectionTimeout:
          return locale.formatExceptionMessage;
        case DioExceptionType.sendTimeout:
          return locale.ioExceptionMessage;
        case DioExceptionType.receiveTimeout:
          return locale.dioConnectTimeoutMessage;
        case DioExceptionType.badCertificate:
          return locale.dioResponseMessage;
        case DioExceptionType.badResponse:
          return locale.dioDefaultMessage;
        case DioExceptionType.cancel:
          return locale.dioConnectionTimeoutMessage;
        case DioExceptionType.connectionError:
          return locale.dioSendTimeoutMessage;
        case DioExceptionType.unknown:
          return locale.dioReceiveTimeoutMessage;
      }
    } else if (exception is FormatException) {
      return locale.dioBadCertificateMessage;
    } else if (exception is IOException) {
      return locale.dioBadResponseMessage;
    } else {
      return locale.dioCancelMessage;
    }
  }
}
