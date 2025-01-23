import 'package:logger/logger.dart';

import '../const/app_enums.dart';

class Logging {
  static Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // Number of method calls to be displayed
      errorMethodCount: 8, // Number of method calls if stacktrace is provided
      lineLength: 120, // Width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      // Should each log print contain a timestamp
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  static void log(message, {LogLevel logLevel = LogLevel.debug}) {
    switch (logLevel) {
      case LogLevel.trace:
        logger.t(message);
      case LogLevel.debug:
        logger.d(message);
      case LogLevel.info:
        logger.i(message);
      case LogLevel.warning:
        logger.w(message);
      case LogLevel.error:
        logger.e(message);
      case LogLevel.fatal:
        logger.f(message);
    }
  }
}
