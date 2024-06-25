import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:job_dekho_app/Jdx_screens/signin_Screen.dart';
//import 'package:place_picker/entities/location_result.dart';
//import 'package:place_picker/widgets/place_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/api_path.dart';
import '../Utils/color.dart';
import 'Dashbord.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  SignUpScreen({this.id});
  final String? id;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController mobileC = TextEditingController();
  TextEditingController pincodeC = TextEditingController();
  TextEditingController cityC = TextEditingController();
  TextEditingController stateC = TextEditingController();
  TextEditingController buildingC = TextEditingController();
  TextEditingController countryC = TextEditingController();
  double lat = 0.0;
  double long = 0.0;
  // String radioButtonItem = 'ONE';
  int id = 0;

  final _formKey = GlobalKey<FormState>();

  SharedPreferences? preferences;
  String userID = '';
  String userEmail = '';
  String userName = '';
  String userMobile = '';
  String userCity = '';
  String userPic = '';
  String wallet = '';

  String? token;

  getToken() async {
    var fcmToken = await FirebaseMessaging.instance.getToken();
    setState(() {
      token = fcmToken.toString();
    });
    print("FCM ID Is $token");
  }

  registerUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {
      'Cookie': 'ci_session=aa0c171db25cefd1a0e5b170be945d1492f56aba'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${ApiPath.baseUrl}Authentication/registration'));
    request.fields.addAll({
      'user_fullname': '${nameController.text}',
      'user_phone': '${mobileController.text}',
      'user_email': '${emailController.text}',
      'user_password': '${passwordController.text}',
      'firebaseToken': token.toString(),
      'user_bdate': '5',
      'referral_code': '5',
      'user_city': '${addressC.text}',
    });
    print("Checking All Details fields ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      print('___________${finalResponse}__________');
      final jsonResponse = json.decode(finalResponse);
      Fluttertoast.showToast(msg: '${jsonResponse['message']}');

      // String userid = jsonResponse['data']['user_id'];

      // prefs.setString('userid', userid.toString());

      if (jsonResponse['status'] == true) {
        Fluttertoast.showToast(msg: '${jsonResponse['message']}');
        setState(() {});
        Fluttertoast.showToast(msg: "${jsonResponse['message']}");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignInScreen()));
      } else {
        Fluttertoast.showToast(msg: "${jsonResponse['message']}");
        setState(() {});
      }
    } else {
      setState(() {});
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      print("rrrrrrrrrrrrrrrrrrrr==============>${finalResponse}");
      print(jsonResponse.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: SafeArea(
          child: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () {
                  Get.to(SignInScreen());
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 25,
                ),
              ),
              elevation: 0,
              backgroundColor: primaryColor,
              title: Text(
                'SignUp',
                style: TextStyle(fontFamily: 'Lora'),
              ),
              centerTitle: true,
              actions: [],
            ),
            backgroundColor: splashcolor,
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Container(
                  //
                  //   height: 60,
                  //   decoration: BoxDecoration(
                  //     color: primaryColor,
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       'Sign Up',
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.bold, fontSize: 22,color: whiteColor,),
                  //     ),
                  //   ),
                  //   // child: Image.asset(
                  //   //   'assets/egate_logo.png', color: primaryColor,
                  //   //   // scale: 1.5,
                  //   // ),
                  //
                  // ),

                  // Container(
                  //   height: size.height / 5.5 ,
                  //   decoration: BoxDecoration(
                  //     color: primaryColor,
                  //   ),
                  //   child: Image.asset('assets/egate_logo.png', scale: 1.3,),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Column(
                      children: [
                        ListView(shrinkWrap: true, children: [
                          const Align(
                            alignment: Alignment.center,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Column(
                            children: [
                              Container(
                                width: size.width,
                                height: size.height / 1.3,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      topLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                      bottomLeft: Radius.circular(30)),
                                ),
                                child: ListView(shrinkWrap: true, children: [
                                  const Align(
                                    alignment: Alignment.center,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Material(
                                              elevation: 10,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.2,
                                                height: 60,
                                                child: TextFormField(
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please Enter Name';
                                                    }
                                                    return null;
                                                  },
                                                  controller: nameController,
                                                  decoration: InputDecoration(
                                                    border:
                                                        const OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                    hintText: "User Name",
                                                    prefixIcon: Image.asset(
                                                      'assets/AuthAssets/Icon awesome-user.png',
                                                      scale: 2.1,
                                                      color: primaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Material(
                                              elevation: 10,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.2,
                                                height: (_formKey.currentState
                                                            ?.validate() ??
                                                        true)
                                                    ? 60
                                                    : 80,
                                                child: TextFormField(
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please Enter Email';
                                                    } else if (!value
                                                        .contains('@')) {
                                                      return 'Please Enter valid Email';
                                                    }
                                                    return null;
                                                  },
                                                  controller: emailController,
                                                  decoration: InputDecoration(
                                                    border:
                                                        const OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                    hintText: "Email",
                                                    prefixIcon: Image.asset(
                                                      'assets/AuthAssets/Icon material-email.png',
                                                      scale: 2.1,
                                                      color: primaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Material(
                                              elevation: 10,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.2,
                                                height: 60,
                                                child: TextFormField(
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please Enter Phone No.';
                                                    }
                                                    return null;
                                                  },
                                                  keyboardType:
                                                      TextInputType.number,
                                                  autovalidateMode:
                                                      AutovalidateMode.disabled,
                                                  controller: mobileController,
                                                  decoration: InputDecoration(
                                                    border:
                                                        const OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                    hintText: "Mobile No.",
                                                    prefixIcon: Image.asset(
                                                      'assets/AuthAssets/Icon ionic-ios-call.png',
                                                      scale: 2.1,
                                                      color: primaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            // _addressField(context),
                                            Material(
                                              elevation: 10,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.2,
                                                height: (_formKey.currentState
                                                            ?.validate() ??
                                                        true)
                                                    ? 60
                                                    : 80,
                                                child: TextFormField(
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please Enter Your Location';
                                                    }
                                                    return null;
                                                  },
                                                  readOnly: true,
                                                  controller: addressC,
                                                  maxLines: 1,
                                                  onTap: () {
                                                    //_getLocation();
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            PlacePicker(
                                                          apiKey: Platform
                                                                  .isAndroid
                                                              ? "AIzaSyB0uPBgryG9RisP8_0v50Meds1ZePMwsoY"
                                                              : "AIzaSyB0uPBgryG9RisP8_0v50Meds1ZePMwsoY",
                                                          onPlacePicked:
                                                              (result) {
                                                            print(result
                                                                .formattedAddress);
                                                            setState(() {
                                                              addressC.text = result
                                                                  .formattedAddress
                                                                  .toString();
                                                              lat = result
                                                                  .geometry!
                                                                  .location
                                                                  .lat;
                                                              long = result
                                                                  .geometry!
                                                                  .location
                                                                  .lng;
                                                            });
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          initialPosition:
                                                              LatLng(22.719568,
                                                                  75.857727),
                                                          useCurrentLocation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  decoration: InputDecoration(
                                                    border:
                                                        const OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide
                                                                    .none),
                                                    hintText: "Location",
                                                    prefixIcon: Image.asset(
                                                      'assets/ProfileAssets/locationIcon.png',
                                                      scale: 1.5,
                                                      color: primaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Material(
                                              elevation: 10,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.2,
                                                height: 60,
                                                child: TextFormField(
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Please Enter Your Password';
                                                    }
                                                    return null;
                                                  },
                                                  controller:
                                                      passwordController,
                                                  decoration: InputDecoration(
                                                    border:
                                                        const OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    hintText: "Password",
                                                    prefixIcon: Image.asset(
                                                      'assets/AuthAssets/Icon ionic-ios-lock.png',
                                                      scale: 2.1,
                                                      color: primaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // SizedBox(height: 20,),
                                            // Material(
                                            //   elevation: 10,
                                            //   borderRadius: BorderRadius.circular(10),
                                            //   child: Container(
                                            //     width: MediaQuery.of(context).size.width / 1.2,
                                            //     height: 50,
                                            //     child: TextField(
                                            //       controller: passwordController,
                                            //       decoration: InputDecoration(
                                            //         border: const OutlineInputBorder(
                                            //           borderSide: BorderSide.none,
                                            //         ),
                                            //         hintText: "Confirm Password",
                                            //         prefixIcon: Image.asset('assets/AuthAssets/Icon ionic-ios-lock.png', scale: 2.1, color: primaryColor,
                                            //         ),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  registerUser();
                                                }
                                              },
                                              child: Container(
                                                height: 60,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.4,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: Secondry),
                                                // child: isloader == true ? Center(child: CircularProgressIndicator(color: Colors.white,),) :
                                                child: Text(
                                                  "Sign up",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // InkWell(
                                            //   onTap: (){
                                            //     registerUser();
                                            //   },
                                            //   child: Container(
                                            //     height: 50,
                                            //     width: MediaQuery.of(context).size.width/1.4,
                                            //     alignment: Alignment.center,
                                            //     decoration: BoxDecoration(
                                            //         borderRadius: BorderRadius.circular(30),
                                            //         color: Secondry
                                            //     ),
                                            //     child: Text("Sign up",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14,),),
                                            //   ),
                                            // ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  "Already have an account? ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.to(SignInScreen());
                                                  },
                                                  child: Text(
                                                    "Login",
                                                    style: TextStyle(
                                                        color: primaryColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 50,
                                            ),
                                            // CustomTextButton(buttonText: 'Sign In', onTap: (){
                                            //   // Navigator.push(context, MaterialPageRoute(builder: (context)=> SeekerDrawerScreen()));
                                            // }),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                              ),
                            ],
                          ),
                        ])
                      ],
                    ),
                  ),
                ],
              ),
            )),
      )),
    );
  }

  Widget _addressField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        color: Colors.red,
        width: MediaQuery.of(context).size.width / 1.2,
        height: 50,
        child: TextField(
          readOnly: true,
          controller: addressC,
          maxLines: 1,
          onTap: () {
            _getLocation();
          },
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            hintText: "Location",
            prefixIcon: Image.asset(
              'assets/ProfileAssets/locationIcon.png',
              scale: 2.1,
              color: primaryColor,
            ),
          ),
        ),
      ),
      // Container(
      //   child: TextFormField(
      //     readOnly: true,
      //     controller: addressC,
      //     maxLines: 1,
      //     // labelText: "Address",
      //     // hintText: "Enter Address",
      //     // textInputAction: TextInputAction.next,
      //     // suffixIcon: Icon(Icons.location_searching),
      //
      //   ),
      // ),
    );
  }

  _getLocation() async {
    /* LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PlacePicker(
          "AIzaSyCqQW9tN814NYD_MdsLIb35HRY65hHomco",
        )));
    print("checking adderss detail ${result.country!.name.toString()} and ${result.locality.toString()} and ${result.country!.shortName.toString()} ");
    setState(() {
      addressC.text = result.formattedAddress.toString();
      cityC.text = result.locality.toString();
      stateC.text = result.administrativeAreaLevel1!.name.toString();
      countryC.text = result.country!.name.toString();
      lat = result.latLng!.latitude;
      long = result.latLng!.longitude;
      pincodeC.text = result.postalCode.toString();
    });*/
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  void init() async {
    Position location = await _determinePosition();

    List<Placemark> placemarks =
        await placemarkFromCoordinates(location.latitude, location.longitude);

    addressC.text =
        '${placemarks.first.name}, ${placemarks.first.subLocality}, ${placemarks.first.locality}, ${placemarks.first.administrativeArea}, ${placemarks.first.postalCode}';
  }
}
