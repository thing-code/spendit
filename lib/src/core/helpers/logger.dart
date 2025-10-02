import 'package:flutter/widgets.dart';

abstract final class SiLogger {
  const SiLogger._();

  static void warning(dynamic msg) {
    debugPrint(_yellow(msg));
  }

  static void error(dynamic msg) {
    debugPrint(_red(msg));
  }

  static void success(dynamic msg) {
    debugPrint(_green(msg));
  }

  static void print(dynamic msg) {
    debugPrint(_cyan(msg));
  }

  static void info(dynamic msg) {
    debugPrint(_magenta(msg));
  }

  static String _green(dynamic msg) {
    return '\x1B[32m$msg\x1B[0m';
  }

  static String _yellow(dynamic msg) {
    return '\x1B[33m$msg\x1B[0m';
  }

  static String _red(dynamic msg) {
    return '\x1B[31m$msg\x1B[0m';
  }

  static String _magenta(dynamic msg) {
    return '\x1B[35m$msg\x1B[0m';
  }

  static String _cyan(dynamic msg) {
    return '\x1B[36m$msg\x1B[0m';
  }
}
