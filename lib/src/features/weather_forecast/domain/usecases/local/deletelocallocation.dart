import 'package:dailyforecast/src/features/weather_forecast/domain/repository/locallocation_repo.dart';

class DeleteLocalLocationUseCase {
  final LocalLocationRepository _locationLocalRepository;
  const DeleteLocalLocationUseCase(this._locationLocalRepository);

  Future<void> execute({required int index}) async {
    await _locationLocalRepository.deleteSavedLocation(index);
  }
}
