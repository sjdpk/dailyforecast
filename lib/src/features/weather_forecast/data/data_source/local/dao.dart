import 'package:hive/hive.dart';
part 'dao.g.dart';

@HiveType(typeId: 0)
class LocalLocationDAO {
  @HiveField(0)
  final String name;

  @HiveField(1)
  String? icon;

  @HiveField(2)
  final num latitude;

  @HiveField(3)
  final num longitude;

  LocalLocationDAO({
    required this.name,
    this.icon,
    required this.latitude,
    required this.longitude,
  });
}
