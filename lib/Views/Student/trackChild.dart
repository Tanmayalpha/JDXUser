import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class OrderTrackingPage extends StatefulWidget {
  final Position position;
  final String? dlat,dlong,glat,glong;
  OrderTrackingPage({required this.position,this.glong,this.glat,this.dlong,this.dlat});


  @override
  State<OrderTrackingPage> createState() => _OrderTrackingPageState();
}

class _OrderTrackingPageState extends State<OrderTrackingPage> {

  final Completer<GoogleMapController> _controller = Completer();


  List<LatLng> polylineCoordinates = [];
   getPolyPoints() async {

    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyBmUCtQ_DlYKSU_BV7JdiyoOu1i4ybe-z0", // Your Google Map Key
      PointLatLng(double.parse(widget.glat!), double.parse(widget.glong!)),
      PointLatLng(double.parse(widget.dlat!), double.parse(widget.dlong!)),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach(
            (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(milliseconds: 500),(){
      return getPolyPoints();
    });
  //  getCurrentLocation();
  //   Future.delayed(Duration(milliseconds: 500),(){
  //     return getLocation();
  //   });
 //   getLocation();
    super.initState();

  }

  Position? position;
   getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
     position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    print("lati" + position!.latitude.toString());
    print("longi" + position!.longitude.toString());
  }

  @override
  Widget build(BuildContext context) {

   //   LatLng sourceLocation = LatLng(widget.position!.latitude, widget.position!.longitude);

    return Scaffold(

      body: widget.glat == null ? Center(child: Text("Loading..."),) : GoogleMap(
        initialCameraPosition:  CameraPosition(
          target: LatLng(double.parse(widget.glat!), double.parse(widget.glong!)),
          zoom: 13.5,
        ),
        markers: {
           Marker(
            markerId: MarkerId("source"),
            position: LatLng(double.parse(widget.glat!), double.parse(widget.glong!)),
          ),
           Marker(
            markerId: MarkerId("destination"),
            position:  LatLng(double.parse(widget.dlat!), double.parse(widget.dlong!)),
          ),
        },
        polylines: {
          Polyline(
            polylineId: const PolylineId("route"),
            points: polylineCoordinates,
            color: Color(0xFF7B61FF),
            width: 6,
          ),
        },
        onMapCreated: (mapController) {
          _controller.complete(mapController);
        },
      ),
    );
  }
}
