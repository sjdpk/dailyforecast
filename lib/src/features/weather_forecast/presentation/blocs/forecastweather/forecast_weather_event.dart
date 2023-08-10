part of 'forecast_weather_bloc.dart';

class WeatherForecastEvent extends Equatable {
  const WeatherForecastEvent();

  @override
  List<Object?> get props => [];
}

class GetWeatherForecastEvents extends WeatherForecastEvent {
  final num locationId;
  const GetWeatherForecastEvents({required this.locationId});

  @override
  List<Object?> get props => [
        locationId
      ];
}
