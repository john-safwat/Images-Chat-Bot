import 'package:chat_bot/core/di/di.dart';
import 'package:chat_bot/core/di/modules/logger_module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:no_screenshot/no_screenshot.dart';

@singleton
class AppInitialization {
  Future<void> initApp() async {
    await isAppAvailable();
  }

  Future<void> isAppAvailable() async {
    try {
      var response = await FirebaseFirestore.instance
          .collection("api_checks")
          .doc("available")
          .get();
      var apiKey = await response.get("apiKey");
      if (apiKey != null) {
        getIt<Dio>().options.headers["Authorization"] = "Bearer $apiKey";
      }
      logger.e("App Screen show : $apiKey");
    } catch (e) {
      logger.e(e.toString());
    }
  }

  Future<void> enableScreenShot() async {
    await NoScreenshot.instance.screenshotOn();
  }

  Future<void> disableScreenShot() async {
    await NoScreenshot.instance.screenshotOn();
  }
}
