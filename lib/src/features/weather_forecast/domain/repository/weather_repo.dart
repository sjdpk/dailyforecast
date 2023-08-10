import 'package:dailyforecast/src/core/network/data_state.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/entities/location.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<DataState<WeatherEntity>> getCurrentWeather({required num lat, required num lon});
  Future<DataState<List<WeatherEntity>>> getweaterForecastList({required num locationId});
  Future<DataState<List<LocationEntity>>> getLocationList({required String query});
}
