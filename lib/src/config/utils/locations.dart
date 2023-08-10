import 'package:geolocator/geolocator.dart';

LocationUtils locationUtils = LocationUtils();

class LocationUtils {
  // @desc : request device location permission
  // return sucesss-permission true else false
  Future<bool> requestLocationPermission() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
          return false;
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  // @desc : get device current location
  Future<Position> getCurrentPosition() async {
    final Position position = await Geolocator.getCurrentPosition();
    return position;
  }

// @desc :check location permission is enable or not
  Future<LocationPermission> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    return permission;
  }

// @desc :check device gps is enable or not

  Future<bool> checkLocationStatus() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    return isLocationServiceEnabled;
  }
}
