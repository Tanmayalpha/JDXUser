import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';

class GetLocation {
  LocationData? _currentPosition;
  late String _address = "";
  Location location1 = Location();
  String firstLocation = "", lat = "", lng = "";
  ValueChanged onResult;

  var latitude;
  GetLocation(this.onResult);
  Future<void> getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location1.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location1.requestService();
      if (!_serviceEnabled) {
        print('ek');
        return;
      }
    }

    _permissionGranted = await location1.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location1.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print('no');
        return;
      }
    }

    location1.onLocationChanged.listen((LocationData currentLocation) {
      print("${currentLocation.latitude} : ${currentLocation.longitude}");
      _currentPosition = currentLocation;
      print(currentLocation.latitude);

      /*_getAddress(_currentPosition!.latitude, _currentPosition!.longitude)
            .then((value) {
          _address = ''; //"${value.first.coordinates.longitude}";
          firstLocation = ''; //value.first.subLocality.toString();
          lat = _currentPosition!.latitude.toString();
          lng = _currentPosition!.longitude.toString();
          if (latitude == 0) {
            onResult(value);
          }
        });*/
    });
  }

  /*Future<List<Address>> _getAddress(double? lat, double? lang) async {
    final coordinates = Coordinates(latitude: lat, longitude: lang);
    List<Address> add = [];
    // await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return add;
  }*/
}
