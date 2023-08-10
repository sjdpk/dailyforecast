import 'dart:developer' as developer;

class Logger {
  // @desc : Info Response Color [Blue]
  static void info(String msg) {
    developer.log('\x1B[34m$msg\x1B[0m');
  }

  // @desc : Sucess Response Color [Green]
  static void success(String msg) {
    developer.log('\x1B[32m$msg\x1B[0m');
  }

  // @desc : Warning Response Color [Yellow]
  static void warning(String msg) {
    developer.log('\x1B[33m$msg\x1B[0m');
  }

  // @desc : Warning Response Color [Red]
  static void error(String msg) {
    developer.log('\x1B[31m$msg\x1B[0m');
  }
}
