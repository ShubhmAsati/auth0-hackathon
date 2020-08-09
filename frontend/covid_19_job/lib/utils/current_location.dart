import 'dart:ffi';

import 'package:geolocator/geolocator.dart';

class CurrentLocation {

  CurrentLocation();

  static Future<Set<double>> GetLatLng() async{
    return await _getCurrentLocation();
  }

  static Future<Set<double>>_getCurrentLocation() async {
    try {
      final Geolocator geolocator = Geolocator()
        ..forceAndroidLocationManager;
      Position _currentPosition = await geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      print(_currentPosition.latitude);
      print(_currentPosition.longitude);
      return {_currentPosition.latitude, _currentPosition.longitude};
    } catch (e) {
       return {};
    }
  }


  static Future<Placemark> GetLocationData(Set currentlatLng) async{
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          currentlatLng.elementAt(0), currentlatLng.elementAt(1));

      Placemark place = p[0];
     return place;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
