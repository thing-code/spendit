import 'package:talker_logger/talker_logger.dart';

abstract final class SiLogger {
  const SiLogger._();

  static final _logger = TalkerLogger();

  static void debug(dynamic msg) {
    _logger.debug(msg);
  }

  static void warning(dynamic msg) {
    _logger.warning(msg);
  }

  static void error(dynamic msg) {
    _logger.error(msg);
  }

  static void verbose(dynamic msg) {
    _logger.verbose(msg);
  }
}
