import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final String? placeId;
  final String? lat;
  final String? lon;
  final String? displayName;
  final String? country;
  final String? icon;

  const LocationEntity({this.placeId, this.lat, this.lon, this.displayName, this.country, this.icon});

  @override
  List<Object?> get props => [
        placeId,
        lat,
        lon,
        displayName,
        country,
        icon
      ];
}
