import 'package:get/get.dart';
import 'package:location/location.dart';

Future<LocationData?> getLocation() async {
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  await Future.delayed(500.milliseconds);

  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    await Future.delayed(500.milliseconds);

    if (!_serviceEnabled) {
      return null;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return null;
    }
  }

  _locationData = await location.getLocation();
  return _locationData;
}
