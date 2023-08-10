part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherLoadingState extends WeatherState {}

class WeatherDoneState extends WeatherState {
  final WeatherEntity weatherEntity;
  const WeatherDoneState(this.weatherEntity);

  @override
  List<Object?> get props => [
        weatherEntity
      ];
}

class WeatherErrorState extends WeatherState {
  final String? message;
  const WeatherErrorState(this.message);

  @override
  List<Object?> get props => [
        message
      ];
}
