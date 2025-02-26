import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

Future<CurrentAddressModel> getCurrentLocation() async {
  var status = await Permission.location.request();
  Fluttertoast.showToast(msg: "Please wait while we fetch your location");

  if (status == PermissionStatus.granted) {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    double? latSender;
    double? longSender;
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks = await placemarkFromCoordinates(
        latSender = position.latitude,
        longSender = position.longitude,
      );
      print("${latSender}Sender L locaton");
      Placemark place = placemarks[0];

     String city = place.locality.toString();
     String zipCode = place.postalCode.toString();
      String state = place.administrativeArea.toString();
      String   addressC =
            '${place.street},${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.country}';

      print('address---> $addressC');
        // senderLocation = addressC.text;

      return CurrentAddressModel(state: state,city: city,long: longSender,lat:latSender ,address:addressC ,zipCode:zipCode );
    } catch (e) {
      print("Error getting location: $e");
      return CurrentAddressModel();
    }
    // Now you have the current location in the `position` variable
    print('Current Location: ${position.latitude}, ${position.longitude}');
  } else {
    return CurrentAddressModel();
    // Location permission denied
    // Handle accordingly (e.g., show a message to the user)
  }
}

class CurrentAddressModel {
  double? lat, long;
  String? address, city, state, zipCode;

  CurrentAddressModel(
      {this.lat, this.long, this.address, this.city, this.state, this.zipCode});
}
