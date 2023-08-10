import 'package:dailyforecast/src/core/network/data_state.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/repository/weather_repo.dart';

import '../entities/weather.dart';

class CurrentWeatherUseCase {
  final WeatherRepository _weatherRepository;
  CurrentWeatherUseCase(this._weatherRepository);

  Future<DataState<WeatherEntity>> execute({required num lat, required num lon}) {
    return _weatherRepository.getCurrentWeather(lat: lat, lon: lon);
  }
}
