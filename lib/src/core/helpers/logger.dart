import 'dart:convert';

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

  static void data(dynamic msg) {
    debugPrint(_cyan(msg));
  }

  static void json(dynamic msg) {
    const encoder = JsonEncoder.withIndent('  ');
    final String prettyJson = encoder.convert(msg);

    prettyJson.split('\n').forEach((e) => debugPrint(_white(e)));
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

  static String _white(dynamic msg) {
    return '\x1B[97m$msg\x1B[0m';
  }

  static String _cyan(dynamic msg) {
    return '\x1B[36m$msg\x1B[0m';
  }
}
