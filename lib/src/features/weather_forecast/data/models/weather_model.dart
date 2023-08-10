import 'package:dailyforecast/src/features/weather_forecast/domain/entities/weather.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    super.id,
    super.lat,
    super.lon,
    super.cityName,
    super.country,
    super.visibility,
    super.dateTime,
    super.main,
    super.description,
    super.iconCode,
    super.temperature,
    super.minTemp,
    super.maxTemp,
    super.feelsLike,
    super.pressure,
    super.humidity,
    super.windSpeed,
    super.windDeg,
    super.cloudAll,
    super.rain3h,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'],
      lat: json['coord'] != null ? json['coord']['lat'] : null,
      lon: json['coord'] != null ? json['coord']['lon'] : null,
      cityName: json['name'],
      country: json['sys'] != null ? json['sys']['country'] : null,
      visibility: json['visibility'],
      dateTime: json["dt_txt"],
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      iconCode: json['weather'][0]['icon'],
      temperature: json['main'] != null ? json['main']['temp'] : null,
      minTemp: json['main'] != null ? json['main']['temp_min'] : null,
      maxTemp: json['main'] != null ? json['main']['temp_max'] : null,
      feelsLike: json['main'] != null ? json['main']['feels_like'] : null,
      pressure: json['main'] != null ? json['main']['pressure'] : null,
      humidity: json['main'] != null ? json['main']['humidity'] : null,
      windSpeed: json['wind'] != null ? json['wind']['speed'] : null,
      windDeg: json['wind'] != null ? json['wind']['deg'] : null,
      cloudAll: json['clouds'] != null ? json['clouds']['all'] : null,
      rain3h: json['rain'] != null ? json['rain']['3h'] : null,
    );
  }
  WeatherEntity toEntity() {
    return WeatherEntity(
      id: id,
      lat: lat,
      lon: lon,
      cityName: cityName,
      country: country,
      visibility: visibility,
      dateTime: dateTime,
      main: main,
      description: description,
      iconCode: iconCode,
      temperature: temperature,
      minTemp: minTemp,
      maxTemp: maxTemp,
      feelsLike: feelsLike,
      pressure: pressure,
      humidity: humidity,
      windSpeed: windSpeed,
      windDeg: windDeg,
      cloudAll: cloudAll,
      rain3h: rain3h,
    );
  }
}
