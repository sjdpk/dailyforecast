import 'package:dailyforecast/src/core/network/data_state.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/entities/location.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/repository/weather_repo.dart';

class LocationListUseCase {
  final WeatherRepository _weatherRepository;
  const LocationListUseCase(this._weatherRepository);

  Future<DataState<List<LocationEntity>>> execute({required String query}) {
    return _weatherRepository.getLocationList(query: query);
  }
}
