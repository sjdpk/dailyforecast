import 'package:dailyforecast/src/core/network/data_state.dart';
import 'package:dailyforecast/src/features/weather_forecast/data/data_source/local/local_data_source.dart';
import 'package:dailyforecast/src/features/weather_forecast/data/models/locallocation_model.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/entities/locallocation.dart';
import 'package:dailyforecast/src/features/weather_forecast/domain/repository/locallocation_repo.dart';

class LocalLocationRepositoryImpl implements LocalLocationRepository {
  final LocalLocationDataSource _localDataSource;
  LocalLocationRepositoryImpl(this._localDataSource);

  @override
  Future<void> saveLocation(LocalLocationEntity location) async {
    try {
      await _localDataSource.saveLocation(
        LocalLocationModel(
          name: location.name,
          icon: location.icon,
          latitude: location.latitude,
          longitude: location.longitude,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DataState<List<LocalLocationEntity>>> getAllLocalSavedLocations() async {
    try {
      final response = await _localDataSource.getAllLocalSavedLocations();
      return DataSucessState(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteSavedLocation(int index) async {
    try {
      await _localDataSource.deleteSavedLocation(index);
    } catch (e) {
      rethrow;
    }
  }
}
