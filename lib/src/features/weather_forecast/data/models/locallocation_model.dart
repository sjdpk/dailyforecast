import 'package:dailyforecast/src/features/weather_forecast/domain/entities/locallocation.dart';

class LocalLocationModel extends LocalLocationEntity {
  const LocalLocationModel({required super.name, required super.latitude, required super.longitude, super.icon});
  LocalLocationEntity toEntity() {
    return LocalLocationEntity(
      name: name,
      icon: icon,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
