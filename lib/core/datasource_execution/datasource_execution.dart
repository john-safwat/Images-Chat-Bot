import 'dart:async';
import 'dart:io';

import 'package:chat_bot/core/datasource_execution/app_exception.dart';
import 'package:chat_bot/core/datasource_execution/results.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
mixin class DataSourceExecution {
  Future<Results<T>> execute<T>(Future<Results<T>> Function() apiCall) async {
    try {
      Results<T> response = await apiCall();
      return response;
    } on FirebaseException catch (e) {
      return Failure<T>(e);
    } on SocketException catch (e) {
      return Failure<T>(e);
    } on TimeoutException catch (e) {
      return Failure<T>(e);
    } on HttpException catch (e) {
      return Failure<T>(e);
    } on DioException catch (e) {
      return Failure<T>(e);
    } on FormatException catch (e) {
      return Failure<T>(e);
    } on IOException {
      return Failure<T>(InternetConnectionException());
    } catch (e) {
      return Failure<T>(Exception(e.toString()));
    }
  }
}
