import 'package:logger/logger.dart';

var _errs = 0;

void logError(String message) {
  _log.e(message, null, null);
}

void logStack(StackTrace stack) {
  _log.e('End of should assertion failure #${++_errs}', null, stack);
}

final _log = Logger(
  filter: MyFilter(),
  printer: PrettyPrinter(
      methodCount: 0, // number of method calls to be displayed
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: false, // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
      ),
);

class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
