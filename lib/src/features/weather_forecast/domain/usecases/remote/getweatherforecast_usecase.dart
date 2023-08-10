import 'package:dailyforecast/src/core/network/data_state.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/repository/weather_repo.dart';

import '../../entities/weather.dart';

class WeatherForecastListUseCase {
  final WeatherRepository _weatherRepository;
  WeatherForecastListUseCase(this._weatherRepository);

  Future<DataState<List<WeatherEntity>>> execute({required num locationId}) {
    return _weatherRepository.getweaterForecastList(locationId: locationId);
  }
}
