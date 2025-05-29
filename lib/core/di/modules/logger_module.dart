import 'package:chat_bot/core/di/di.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

Logger logger = getIt<Logger>();

@module
abstract class LoggerModule {
  @lazySingleton
  Logger getLogger() {
    Logger logger = Logger(
        filter: DevelopmentFilter(),
        printer: PrettyPrinter(
          methodCount: 2,
          errorMethodCount: 8,
          lineLength: 120,
          colors: true,
          printEmojis: true,
        ));
    return logger;
  }
}
