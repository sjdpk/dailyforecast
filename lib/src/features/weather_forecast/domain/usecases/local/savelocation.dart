import 'package:dailyforecast/src/features/weather_forecast/domain/entities/locallocation.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/repository/locallocation_repo.dart';

class SaveLocalLocationUseCase {
  final LocalLocationRepository _locationLocalRepository;
  const SaveLocalLocationUseCase(this._locationLocalRepository);

  void execute({required LocalLocationEntity location}) {
    _locationLocalRepository.saveLocation(location);
  }
}
