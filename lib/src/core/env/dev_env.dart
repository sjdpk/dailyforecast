import 'base_env.dart';

class DevEnvironment implements BaseEnvironment {
  @override
  String get applicatioName => "Daily Forecast";

  @override
  String get baseUrl => "https://api.openweathermap.org/data/2.5";

  @override
  String get openStreetUrl => "https://nominatim.openstreetmap.org";

  @override
  String get weatherApiKey => "15b2d170d074ef1ff7827172218c657f";

  @override
  String get iconUrl => "https://openweathermap.org/img/w";

  @override
  String get locationDb => "locations";
}
