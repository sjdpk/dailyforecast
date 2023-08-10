import 'package:dailyforecast/src/features/weather_forecast/domain/entities/location.dart';

class LocationModel extends LocationEntity {
  const LocationModel({super.placeId, super.lat, super.lon, super.displayName, super.country, super.icon});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      placeId: "${json['place_id']}",
      lat: json['lat'],
      lon: json['lon'],
      displayName: json['display_name'],
      country: json['address'] != null ? json['address']['country'] : null,
      icon: json['icon'],
    );
  }

  LocationEntity toEntity() {
    return LocationEntity(
      placeId: placeId,
      lat: lat,
      lon: lon,
      displayName: displayName,
      country: country,
      icon: icon,
    );
  }
}
