import 'package:geolocator/geolocator.dart';

class CurrentLocation {
  double lat, lng;
  String city, state, country, address;
  Position _currentPosition;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  CurrentLocation();
  List<double> getLatLng() {
    print("vpoi");
    this._getCurrentLocation();
    print("bb");
    print(_currentPosition);
    return [this.lat, this.lng];
  }
  printAddress(){
    print('hi');
    this._getAddressFromLatLng();
  }
  _getCurrentLocation() async{


    await geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position)async {
      _currentPosition = position;
      print(_currentPosition);
      this.lat = _currentPosition.latitude;
      this.lng = _currentPosition.longitude;
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];
      print(place.locality+place.postalCode+place.country);
    }).catchError((e) {
      print(e);
    });
  }
  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];
      print(place.locality+place.postalCode+place.country);

    } catch (e) {
      print(e);
    }
  }
}
