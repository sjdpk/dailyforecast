import 'package:dailyforecast/main.dart';
import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final num? id;
  final num? lat;
  final num? lon;
  final String? cityName;
  final String? country;
  // meter. The maximum value of the visibility is 10 km
  final num? visibility;
  final String? dateTime;
  // weather
  //Group of weather parameters (Rain, Snow, Clouds etc.)
  final String? main;
  final String? description;
  final String? iconCode;

  // main
  //Temperature. Unit Default: Kelvin
  final num? temperature;
  final num? minTemp;
  final num? maxTemp;
  // human perception of weather
  final num? feelsLike;
  //Atmospheric pressure on the sea level, hPa
  final num? pressure;
  //Humidity, %
  final num? humidity;

  //wind
  final num? windSpeed;
  final num? windDeg;

  // clouds
  final num? cloudAll;
  // rain
  final num? rain3h;
  num? get temp => double.parse((temperature! - 273.15).toStringAsFixed(2));
  num? get fLike => double.parse((feelsLike! - 273.15).toStringAsFixed(2));
  num? get mTemp => double.parse((minTemp! - 273.15).toStringAsFixed(2));
  num? get mxTemp => double.parse((maxTemp! - 273.15).toStringAsFixed(2));
  String get weatherIcon => "${appEnv.envConfig.iconUrl}/${iconCode!}.png";

  const WeatherEntity({
    this.id,
    this.lat,
    this.lon,
    this.cityName,
    this.country,
    this.visibility,
    this.dateTime,
    this.main,
    this.description,
    this.iconCode,
    this.temperature,
    this.minTemp,
    this.maxTemp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.windSpeed,
    this.windDeg,
    this.cloudAll,
    this.rain3h,
  });
  @override
  List<Object?> get props => [
        id,
        lat,
        lon,
        cityName,
        country,
        visibility,
        dateTime,
        main,
        description,
        iconCode,
        temperature,
        minTemp,
        maxTemp,
        feelsLike,
        pressure,
        humidity,
        windSpeed,
        windDeg,
        cloudAll,
        rain3h,
      ];
}
