import 'package:dailyforecast/src/config/application_properties.dart';

import 'prod_env.dart';
import 'dev_env.dart';
import 'local_env.dart';

abstract class BaseEnvironment {
  String get applicatioName;
  String get baseUrl;
  String get iconUrl;
  String get openStreetUrl;

  String get weatherApiKey;
  String get locationDb;
}

class Environment {
  Environment._internal();
  static final Environment _singleton = Environment._internal();
  factory Environment() => _singleton;

  // Env
  static const String prod = "PROD";
  static const String dev = "DEV";
  static const String local = "LOCAL";

  late BaseEnvironment envConfig;
  initEnvConfig(String env) {
    envConfig = _getEnvConfig(env);
  }

  BaseEnvironment _getEnvConfig(String env) {
    switch (env) {
      case Environment.prod:
        return ProdEnv();
      case Environment.local:
        return LocalEnvironment();
      default:
        return DevEnvironment();
    }
  }
}

//@desc : specify which env shuould run
const String environment = String.fromEnvironment("ENV", defaultValue: applicationEnv);
