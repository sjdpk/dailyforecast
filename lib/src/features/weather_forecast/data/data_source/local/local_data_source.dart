import 'package:dailyforecast/main.dart';
import 'package:dailyforecast/src/features/weather_forecast/data/models/locallocation_model.dart';
import 'package:hive/hive.dart';

import 'dao.dart';

abstract class LocalLocationDataSource {
  Future<bool> initDb();
  Future<List<LocalLocationModel>> getAllLocalSavedLocations();
  Future saveLocation(LocalLocationModel location);
  Future deleteSavedLocation(int index);
}

class LocalLocationDataSourceImpl implements LocalLocationDataSource {
  final _kTaskBox = appEnv.envConfig.locationDb;

  @override
  Future<bool> initDb() async {
    try {
      Hive.registerAdapter(LocalLocationDAOAdapter());
      await Hive.openBox<LocalLocationDAO>(_kTaskBox);
      return true;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> saveLocation(LocalLocationModel location) async {
    try {
      final locationBox = Hive.box<LocalLocationDAO>(_kTaskBox);
      final result = locationBox.values.cast<LocalLocationDAO>().toList();

      if (result.any((element) => element.latitude == location.latitude && element.longitude == location.longitude)) return;
      await locationBox.add(
        LocalLocationDAO(
          name: location.name,
          icon: location.icon,
          latitude: location.latitude,
          longitude: location.longitude,
        ),
      );
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<LocalLocationModel>> getAllLocalSavedLocations() async {
    try {
      final locationBox = Hive.box<LocalLocationDAO>(_kTaskBox);
      final result = locationBox.values.map<LocalLocationModel>((e) => LocalLocationModel(name: e.name, icon: e.icon, latitude: e.latitude, longitude: e.longitude)).toList();
      return result;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future deleteSavedLocation(int index) async {
    try {
      final tasksBox = Hive.box<LocalLocationDAO>(_kTaskBox);
      await tasksBox.deleteAt(index);
    } catch (e) {
      rethrow;
    }
  }
}
