part of 'weather_bloc.dart';

class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class GetWeatherEvents extends WeatherEvent {
  final num? lat;
  final num? lon;
  const GetWeatherEvents({this.lat, this.lon});

  @override
  List<Object?> get props => [
        lat,
        lon,
      ];
}
