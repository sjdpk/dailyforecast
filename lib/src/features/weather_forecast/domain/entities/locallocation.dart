import 'package:equatable/equatable.dart';

class LocalLocationEntity extends Equatable {
  final String name;
  final String? icon;
  final num latitude;
  final num longitude;
  const LocalLocationEntity({
    required this.name,
    this.icon,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
        name,
        icon,
        latitude,
        longitude
      ];
}
