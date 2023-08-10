part of 'forecast_weather_bloc.dart';

abstract class WeatherForecastState extends Equatable {
  const WeatherForecastState();

  @override
  List<Object?> get props => [];
}

class WeatherForecastLoadingState extends WeatherForecastState {}

class WeatherForecastDoneState extends WeatherForecastState {
  final List<WeatherEntity> weatherForecastList;
  const WeatherForecastDoneState(this.weatherForecastList);

  @override
  List<Object?> get props => [
        weatherForecastList
      ];
}

class WeatherForecastErrorState extends WeatherForecastState {
  final String? message;
  const WeatherForecastErrorState(this.message);

  @override
  List<Object?> get props => [
        message
      ];
}
