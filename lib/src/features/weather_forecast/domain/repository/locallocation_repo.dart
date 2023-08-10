import 'package:dailyforecast/src/core/network/data_state.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/entities/locallocation.dart';

abstract class LocalLocationRepository {
  Future<DataState<List<LocalLocationEntity>>> getAllLocalSavedLocations();
  Future<void> saveLocation(LocalLocationEntity location);
  Future<void> deleteSavedLocation(int index);
}
