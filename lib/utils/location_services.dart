import 'package:location/location.dart';

class LocationServices {
  Location location = Location();
  Future<bool> checkAndRequestLocationService() async {
    bool isEnabled = await location.serviceEnabled();
    if (!isEnabled) {
      isEnabled = await location.requestService();
      if (!isEnabled) {
        return false;
      }
    }
    return true;
  }

  checkAndRequestLocationPermission() async {
    PermissionStatus permissinState = await location.hasPermission();
    if (permissinState == PermissionStatus.deniedForever) {
      return false;
    }
    if (permissinState == PermissionStatus.denied) {
      permissinState = await location.requestPermission();
      return permissinState == PermissionStatus.granted;
    }
    return true;
  }

  getLocationData(void Function(LocationData)? onData) {
    location.changeSettings(
      distanceFilter: 2,
    );
    location.onLocationChanged.listen(onData);
  }
}
