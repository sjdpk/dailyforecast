import 'package:dailyforecast/src/core/network/data_state.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/entities/locallocation.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/repository/locallocation_repo.dart';

class GetAllLocalLocationUseCase {
  final LocalLocationRepository _locationLocalRepository;
  const GetAllLocalLocationUseCase(this._locationLocalRepository);

  Future<DataState<List<LocalLocationEntity>>> execute() {
    return _locationLocalRepository.getAllLocalSavedLocations();
  }
}
