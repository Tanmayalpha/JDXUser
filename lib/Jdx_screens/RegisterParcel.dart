import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_dekho_app/Jdx_screens/Dashbord.dart';
import 'package:job_dekho_app/Jdx_screens/Editrecipentcart.dart';
import 'package:job_dekho_app/Jdx_screens/parceldetailsscreen.dart';

//import 'package:place_picker/entities/location_result.dart';
//import 'package:place_picker/widgets/place_picker.dart';
import 'package:http/http.dart' as http;
import 'package:job_dekho_app/Model/getprofilemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/MaterialCategoryModel.dart';
import '../Model/ParcelWeightModel.dart';
import '../Model/registerparcelmodel.dart';
import '../Utils/api_path.dart';
import '../Utils/color.dart';
import 'notification_Screen.dart';

class RegistParcelScreen extends StatefulWidget {
  const RegistParcelScreen({Key? key}) : super(key: key);

  @override
  State<RegistParcelScreen> createState() => _RegistParcelScreenState();
}

class _RegistParcelScreenState extends State<RegistParcelScreen> {
  TextEditingController senderNameController = TextEditingController();
  TextEditingController senderMobileController = TextEditingController();
  TextEditingController recipientAddressCtr = TextEditingController();
  TextEditingController recipientnewAddressCtr = TextEditingController();
  TextEditingController senderAddressCtr = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController senderfulladdressCtr = TextEditingController();
  TextEditingController recipientMobileController = TextEditingController();
  TextEditingController pincodeC = TextEditingController();
  TextEditingController cityC = TextEditingController();
  TextEditingController valueController = TextEditingController();

  // TextEditingController addressC = TextEditingController();
  TextEditingController receiverfulladdressCtr = TextEditingController();
  TextEditingController recipientNameController = TextEditingController();
  TextEditingController stateC = TextEditingController();
  TextEditingController countryC = TextEditingController();
  TextEditingController latitudeC = TextEditingController();
  TextEditingController longitudeC = TextEditingController();

  double lat1 = 0.0;
  double long1 = 0.0;
  double lat2 = 0.0;
  double long2 = 0.0;

  // String radioButtonItem = 'ONE';
  int id = 0;

  Registerparcelmodel? parcelDetailsModel;

  List receiverList = [];

  // List<String>  selectedvalue = [];
  bool isSendParcel = false;
  senParcel() async {
    setState(() {
      isSendParcel = true;
    });
    if (receiverList.isEmpty) {
      receiverList.add({
        "meterial_category": "${selectedValue.toString()}",
        "parcel_weight": "${selectedValue1.toString()}",
        "receiver_address": "${recipientAddressCtr.text}",
        "receiver_latitude": "${lat2}",
        "receiver_longitude": "${long2}",
        "receiver_name": "${recipientNameController.text}",
        "receiver_phone": "${recipientMobileController.text}",
        "reciver_full_address": "${receiverfulladdressCtr.text}",
        "pacel_value": "${valueController.text}"
      });
      parcelImageList.add(imageFile);
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString('userid');

    print("User Id ${userid.toString()}");
    print("Register and Sender Parcel");
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=1b21f643064e1ac4622693b37863ecfa449561dd',
    };
    var request = http.Request(
        'POST', Uri.parse('${ApiPath.baseUrl}payment/send_parcel'));
    request.body = json.encode({
      "sender_name": senderNameController.text,
      "sender_address": senderAddressCtr.text,
      "sender_phone": senderMobileController.text,
      "sender_latitude": lat1.toString(),
      "sender_longitude": long1.toString(),
      "sender_fulladdress": senderfulladdressCtr.text,
      "user_id": "${userid}",
      "data_arr": receiverList,
    });
    log("This is request here>>>>>>>>${request.body}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();

      final jsonResponse =
          Registerparcelmodel.fromJson(json.decode(finalResult));
      String orderid = jsonResponse.orderId.toString();
      await uploadeParcelImage(orderid);
      prefs.setString('orderid', orderid.toString());
      print("thiss is order id=========>${orderid}");
      // String? orderid = preferences.getString("orderid");
      print("Result here Now@@@@@@ ${finalResult.toString()}");
      // print("Result Noww@@@@@@ ${finalResult}");
      setState(() {
        parcelDetailsModel = jsonResponse;
        isSendParcel = false;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ParceldetailsScreen(
                    orderid: orderid,
                    isFromParcelHistory: false,
                  ))).then((value) {
        receiverList = [];
      });
    } else {
      setState(() {
        isSendParcel = false;
      });
      print(response.reasonPhrase);
    }
  }

  MaterialCategoryModel? materialCategoryModel;

  materialCategory() async {
    var headers = {
      'Cookie': 'ci_session=18b59dc18c8193fd4e5e1c025a6904983b2ca7e4'
    };
    var request = http.MultipartRequest(
        'GET', Uri.parse('${ApiPath.baseUrl}Products/Category'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("Material category");
      var finalResult = await response.stream.bytesToString();
      final jsonResponse =
          MaterialCategoryModel.fromJson(json.decode(finalResult));
      print("final Result>>>>>>> ${finalResult.toString()}");
      setState(() {
        materialCategoryModel = jsonResponse;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  ParcelWeightModel? parcelWeightModel;

  parcelWeight() async {
    var headers = {
      'Cookie': 'ci_session=18b59dc18c8193fd4e5e1c025a6904983b2ca7e4'
    };
    var request = http.MultipartRequest(
        'GET', Uri.parse('${ApiPath.baseUrl}Products/getweight'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();
      final jsonResponse = ParcelWeightModel.fromJson(json.decode(finalResult));
      print("final Result>>>>>>> ${finalResult.toString()}");
      setState(() {
        parcelWeightModel = jsonResponse;
      });
    } else {
      print("Enterrrrrrrrrr");
      print(response.reasonPhrase);
    }
  }

  uploadeParcelImage(String orderId) async {
    var headers = {
      'Cookie': 'ci_session=18b59dc18c8193fd4e5e1c025a6904983b2ca7e4'
    };
    var request = http.MultipartRequest(
        'Post', Uri.parse('${ApiPath.baseUrl}Payment/send_image'));
    request.fields.addAll({'order_id': orderId});

    request.headers.addAll(headers);

    for (int i = 0; i < parcelImageList.length; i++) {
      request.files.add(await http.MultipartFile.fromPath(
          'images[]', parcelImageList[i]?.path ?? ''));
    }

    print('${request.files.length}__________________');

    http.StreamedResponse response = await request.send();
    print('${response.statusCode}__________________');
    print('${await response.stream.bytesToString()}__________________');

    if (response.statusCode == 200) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 100), () {
      return materialCategory();
    });
    Future.delayed(Duration(milliseconds: 100), () {
      return parcelWeight();
    });
    init();
    _getCompensationAmmount();
  }

  final _formKey = GlobalKey<FormState>();
  String? selectedValue;
  String? selectedCategoryName;
  String? selectedValue1;
  String? amt;
  //double? lat;
  //double? long;

  @override
  Widget build(BuildContext context) {
    // Data data = materialCategoryModel!.data![0].title;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,

        backgroundColor: primaryColor,

        title: Text(
          'Register Parcel',
          style: TextStyle(
              color: whiteColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lora'),
        ),

      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),

              ///senderdetails
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Sender Details",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Material(
                      color: splashcolor,
                      elevation: 1,
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 60,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Sender Name';
                            }
                            return null;
                          },
                          controller: senderNameController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: "Sender Name",
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
                      color: splashcolor,
                      elevation: 1,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 60,
                        child: TextFormField(
                          maxLength: 10,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Phone No.";
                            }
                            return null;
                          },
                          controller: senderMobileController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: "Sender Mobile No.",
                            counterText: "",
                            prefixIcon: Image.asset(
                              'assets/AuthAssets/Icon ionic-ios-call.png',
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
                    // _addressField(context),
                    Material(
                      color: splashcolor,
                      elevation: 1,
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 60,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Sender Address';
                            }
                            return null;
                          },
                          readOnly: true,
                          controller: senderAddressCtr,
                          maxLines: 1,
                          onTap: () {
                            //_getLocation1();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlacePicker(
                                  apiKey: Platform.isAndroid
                                      ? "AIzaSyB6Q9MvTpJeex5oDISDFJ6dny488rQfKb0"
                                      : "AIzaSyB6Q9MvTpJeex5oDISDFJ6dny488rQfKb0",
                                  onPlacePicked: (result) {
                                    print(result.formattedAddress);
                                    setState(() {
                                      senderAddressCtr.text =
                                          result.formattedAddress.toString();
                                      lat1 = result.geometry!.location.lat;
                                      long1 = result.geometry!.location.lng;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  initialPosition:
                                      const LatLng(22.719568, 75.857727),
                                  useCurrentLocation: true,
                                  selectInitialPosition: true,
                                  usePlaceDetailSearch: true,
                                  forceSearchOnZoomChanged: true,
                                ),
                              ),
                            );
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: "Sender Address",
                            prefixIcon: Image.asset(
                              'assets/ProfileAssets/locationIcon.png',
                              scale: 1.5,
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
                      color: splashcolor,
                      elevation: 1,
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 80,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This Field Is Required';
                            }
                            return null;
                          },
                          controller: senderfulladdressCtr,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "flat number,floor,building name,etc",
                            prefixIcon: Image.asset(
                              'assets/ProfileAssets/locationIcon.png',
                              scale: 1.7,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ///Card Generate
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: receiverList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 2,
                        color: splashcolor,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.1,
                          // height: 230,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Text("Recipient Name",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xFFBF2331))),
                                        ),
                                        Text(
                                            "${receiverList[index]['receiver_name']}"),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 60,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 28.0),
                                      child: InkWell(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        "Delete Account"),
                                                    content: const Text(
                                                        "Are you sure you want to delete the order"),
                                                    actions: <Widget>[
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor: Color(0xFFBF2331),
                                                        ),
                                                        child:
                                                            const Text("YES"),
                                                        onPressed: () {
                                                          receiverList
                                                              .removeAt(index);
                                                          Navigator.of(context)
                                                              .pop();
                                                          setState(() {});
                                                          // deleteAccount();
                                                          // SystemNavigator.pop();
                                                          // Navigator.pop(context, MaterialPageRoute(builder: (context) => Login()));
                                                        },
                                                      ),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                // primary: colors.primary
                                                                ),
                                                        child: Text("NO"),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      )
                                                    ],
                                                  );
                                                });
                                            Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Container(
                                                    height: 45,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            1.5,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color:
                                                            Color(0xFFBF2331)),
                                                    child: const Center(
                                                      child: Text(
                                                        "Delete Account",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                          child: Icon(Icons.delete,
                                              color: Color(0xFFBF2331))),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          Get.to(EditeRecipentCart());
                                        },
                                        child: Icon(Icons.edit,
                                            color: Color(0xFFBF2331))),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Mobile No",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xFFBF2331)),
                                          ),
                                          Text(
                                              "${receiverList[index]['receiver_phone']}"),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Material category",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xFFBF2331)),
                                            ),
                                            Text(
                                                "${receiverList[index]['cat_name']}"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Recipient Address",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xFFBF2331)),
                                          ),
                                          SizedBox(
                                              width: 180,
                                              child: Text(
                                                "${receiverList[index]['receiver_address']}",
                                                maxLines: 3,
                                              )),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 7),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Parcel weight",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color(0xFFBF2331)),
                                            ),
                                            Text(
                                                "${receiverList[index]['parcel_weight']}"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Recipient Flat Number",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xFFBF2331)),
                                          ),
                                          Text(
                                              "${receiverList[index]['reciver_full_address']}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Parcel Image",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xFFBF2331)),
                                          ),
                                          Image.file(
                                              parcelImageList[index] ??
                                                  File(''),
                                              height: 100,
                                              width: 80),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),

              const SizedBox(
                height: 15,
              ),

              ///recipentdetails
              const SizedBox(
                height: 20,
              ),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Recipient Details",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Material(
                      color: splashcolor,
                      elevation: 1,
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 60,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Recipient Name';
                            }
                            return null;
                          },
                          controller: recipientNameController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: "Recipient Name",
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
                      color: splashcolor,
                      elevation: 1,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 60,
                        child: TextFormField(
                          maxLength: 10,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Phone No.';
                            }
                            return null;
                          },
                          controller: recipientMobileController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Recipient Mobile No.",
                            counterText: '',
                            prefixIcon: Image.asset(
                              'assets/AuthAssets/Icon ionic-ios-call.png',
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
                    // _addressField(context),
                    Material(
                      color: splashcolor,
                      elevation: 1,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 60,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Recipient Address';
                            }
                            return null;
                          },
                          readOnly: true,
                          controller: recipientAddressCtr,
                          maxLines: 1,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlacePicker(
                                  apiKey: Platform.isAndroid
                                      ? "AIzaSyB6Q9MvTpJeex5oDISDFJ6dny488rQfKb0"
                                      : "AIzaSyB6Q9MvTpJeex5oDISDFJ6dny488rQfKb0",
                                  onPlacePicked: (result) {
                                    print(result.formattedAddress);
                                    setState(() {
                                      recipientAddressCtr.text =
                                          result.formattedAddress.toString();
                                      lat2 = result.geometry!.location.lat;
                                      long2 = result.geometry!.location.lng;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  initialPosition:
                                      const LatLng(22.719568, 75.857727),
                                  useCurrentLocation: true,
                                  selectInitialPosition: true,
                                  usePlaceDetailSearch: true,
                                  forceSearchOnZoomChanged: true,
                                ),
                              ),
                            );

                            //_getLocation2();
                          },
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: "Recipient Address",
                            prefixIcon: Image.asset(
                              'assets/ProfileAssets/locationIcon.png',
                              scale: 1.5,
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
                        color: splashcolor,
                        elevation: 1,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 80,
                            child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This Field Is Required';
                                  }
                                  return null;
                                },
                                controller: receiverfulladdressCtr,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText:
                                      "flat number,floor,building name,etc",
                                  prefixIcon: Image.asset(
                                    'assets/ProfileAssets/locationIcon.png',
                                    scale: 1.7,
                                    color: primaryColor,
                                  ),
                                )))),
                  ],
                ),
              ),

              ///parceldetails
              const SizedBox(
                height: 20,
              ),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      "Parcel Details ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Center(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: splashcolor,
                    elevation: 1,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: DropdownButton(
                        isExpanded: true,
                        underline: Container(),
                        value: selectedValue,
                        hint: const Padding(
                          padding: EdgeInsets.all(.0),
                          child: Text("Material Category"),
                        ),
                        icon: const Padding(
                          padding: EdgeInsets.only(left: 56),
                          child: Icon(Icons.keyboard_arrow_down,
                              color: Color(0xFFBF2331)),
                        ),
                        items: materialCategoryModel?.data!.map((items) {
                          return DropdownMenuItem(
                            value: items.id.toString(),
                            child: Text(items.title.toString()),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedValue = newValue!;
                            int? value = materialCategoryModel?.data!
                                .indexWhere(
                                    (element) => element.id == selectedValue);
                            selectedCategoryName =
                                materialCategoryModel?.data![value!].title ??
                                    '';
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: splashcolor,
                    elevation: 1,
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 55,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: DropdownButton(
                        isExpanded: true,
                        hint: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Parcel weight"),
                        ),
                        underline: Container(),
                        value: selectedValue1,
                        icon: const Padding(
                          padding: EdgeInsets.only(left: 140),
                          child: Icon(Icons.keyboard_arrow_down,
                              color: Color(0xFFBF2331)),
                        ),
                        items: parcelWeightModel?.data?.map((items) {
                          return DropdownMenuItem(
                            value: items.weightTo,
                            child: Text(items.weightTo.toString()),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            print("new value ${newValue}");
                            selectedValue1 = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Material(
                    color: splashcolor,
                    elevation: 1,
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 60,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter Parcel value ';
                          }
                          return null;
                        },
                        controller: valueController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          hintText: "Parcel value",
                          prefixIcon: IconButton(
                              onPressed: null,
                              icon: Image.asset(
                                'assets/AuthAssets/rupeesIcon.png',
                                color: primaryColor,
                                height: 20,
                                width: 20,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'We will compensate the value of lost item '
                        'within three working days according to rules. '
                        'maximum compensation -₹${amt}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 140,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: primaryColor)),
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 250,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10))),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Take Image From",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    ListTile(
                                      leading: Image.asset(
                                        'assets/ProfileAssets/cameraicon.png',
                                        scale: 1.5,
                                      ),
                                      title: const Text('Camera',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      onTap: () {
                                        _getFromCamera();
                                      },
                                    ),
                                    ListTile(
                                      leading: Image.asset(
                                        'assets/ProfileAssets/galleryicon.png',
                                        scale: 1.5,
                                      ),
                                      title: const Text('Gallery',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      onTap: () {
                                        _getFromGallery();
                                      },
                                    ),
                                    ListTile(
                                      leading: Image.asset(
                                        'assets/ProfileAssets/cancelicon.png',
                                        scale: 1.5,
                                      ),
                                      title: const Text('Cancel',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      child: Center(
                          child: imageFile == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Upload parcel image',
                                      style: TextStyle(color: Colors.black38),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Icon(Icons.drive_folder_upload)
                                  ],
                                )
                              : Image.file(imageFile ?? File('path'))),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  isSendParcel
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: CustomColors.accentColor,
                          ),
                        )
                      : Column(
                          children: [
                            InkWell(
                              onTap: () {
                                /* "receiver_name": "${recipientNameController
                              .text}",
                          "receiver_phone": "${recipientMobileController
                              .text}",
                          "receiver_address": "${recipientAddressCtr}",
                          "receiver_latitude": "${lat2}",
                          "receiver_longitude": "${long2}",
                          "reciver_full_address": "${receiverfulladdressCtr
                              .text}",
                          "meterial_category": "${selectedValue
                              .toString()}",
                          "parcel_weight": "up to ${selectedValue1
                              .toString()} kg",
                        }*/

                                if (_formKey.currentState!.validate()) {
                                  if (imageFile != null) {
                                    setState(() {
                                      receiverList.add({
                                        "meterial_category":
                                            "${selectedValue.toString()}",
                                        "cat_name": "${selectedCategoryName}",
                                        "parcel_weight":
                                            "${selectedValue1.toString()}",
                                        "receiver_address":
                                            "${recipientAddressCtr.text}",
                                        "receiver_latitude": "${lat2}",
                                        "receiver_longitude": "${long2}",
                                        "receiver_name":
                                            "${recipientNameController.text}",
                                        "receiver_phone":
                                            "${recipientMobileController.text}",
                                        "reciver_full_address":
                                            "${receiverfulladdressCtr.text}",
                                        "pacel_value": "${valueController.text}"
                                      });
                                    });
                                    parcelImageList.add(imageFile);

                                    imageFile = null;

                                    recipientNameController.clear();
                                    recipientnewAddressCtr.clear();
                                    recipientAddressCtr.clear();
                                    recipientMobileController.clear();
                                    receiverfulladdressCtr.clear();
                                    valueController.clear();
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Please add parcel image');
                                  }
                                }
                                // Navigator.pop(context);
                                // setState(() {});
                                //
                                // int materialValue = 0;
                                // int parcelValue = 0;
                                // int recnameValue = 0;
                                // int recaddValue = 0;
                                // int recmobValue = 0;
                                // int recfulladdValue = 0;
                                //
                                // setState(() {
                                // });
                                // for(var i=0; i<receiverList.length; i++){
                                //   materialValue = int.parse(receiverList[i][''].toString());
                                //   print("Material Valueee ${materialValue}");
                                //   setState(() {});
                                // }
                                // setState(() {});
                                //
                                // for(var i=0; i<receiverList.length; i++){
                                //   parcelValue = int.parse(receiverList[i][''].toString());
                                //   print("Parcel Details Value ${parcelValue}");
                                //   setState(() {});
                                // }
                                // setState(() {});
                                //
                                // for(var i=0; i<receiverList.length; i++){
                                //   recnameValue = int.parse(receiverList[i][''].toString());
                                //   print("Parcel Details Value ${recnameValue}");
                                //   setState(() {});
                                // }
                                // setState(() {});
                                //
                                // for(var i=0; i<receiverList.length; i++){
                                //   recaddValue = int.parse(receiverList[i][''].toString());
                                //   print("Parcel Details Value ${recaddValue}");
                                //   setState(() {});
                                // }
                                // setState(() {});
                                //
                                // for(var i=0; i<receiverList.length; i++){
                                //   recfulladdValue = int.parse(receiverList[i][''].toString());
                                //   print("Parcel Details Value ${recfulladdValue}");
                                //   setState(() {});
                                // }
                                // setState(() {});
                                //
                                // for(var i=0; i<receiverList.length; i++){
                                //   recmobValue = int.parse(receiverList[i][''].toString());
                                //   print("Parcel Details Value ${recmobValue}");
                                //   setState(() {});
                                // }

                                //  Get.to(MyStatefulWidget());
                              },
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width / 1.2,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Secondry),
                                child: const Text(
                                  "Add More",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                                onTap: () {
                                  if (receiverList.isEmpty) {
                                    if (_formKey.currentState!.validate()) {
                                      senParcel();
                                      // Get.to(ParceldetailsScreen());
                                    }
                                  } else {
                                    senParcel();
                                  }
                                },
                                child: Container(
                                  height: 45,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Secondry),
                                  child: const Text(
                                    "save",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                )),
                          ],
                        )
                ],
              )),
              // Center(
              //   child: DropdownSearch<String>(
              //     popupProps: PopupProps.menu(
              //       showSelectedItems: true,
              //       showSearchBox: true,
              //       disabledItemFn: (String s) => s.startsWith('I'),
              //     ),
              //
              //     items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada,'],
              //     dropdownDecoratorProps: DropDownDecoratorProps(
              //       dropdownSearchDecoration: InputDecoration(
              //         labelText: "Menu mode",
              //         hintText: "country in menu mode",
              //       ),
              //     ),
              //     onChanged: print,
              //     selectedItem: "Brazil",
              //   ),
              // ),
              //
              // DropdownSearch<String>.multiSelection(
              //   items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
              //   popupProps: PopupPropsMultiSelection.menu(
              //     showSelectedItems: true,
              //     disabledItemFn: (String s) => s.startsWith('I'),
              //   ),
              //   onChanged: print,
              //   selectedItems: ["Brazil"],
              // )
            ],
          ),
        ),
      ),
    );
  }

  // Widget recipietCart(int index) {
  //   return
  //     Center(
  //     child: Card(
  //       elevation: 0,
  //       color: Theme.of(context).colorScheme.surfaceVariant,
  //       child: SizedBox(
  //         width: MediaQuery.of(context).size.width/ 1.2,
  //         height: 80,
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //           Text("Recipient Name"),
  //           Icon(Icons.delete),
  //           Icon(Icons.edit),
  //         ],),
  //       ),
  //     ),
  //   );
  // }

  /* _getLocation1() async {
    LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            PlacePicker(
              "AIzaSyCqQW9tN814NYD_MdsLIb35HRY65hHomco",
            )));
    print(
        "checking adderss detail ${result.country!.name.toString()} and ${result
            .locality.toString()} and ${result.country!.shortName
            .toString()} ");
    setState(() {
      senderAddressCtr.text = result.formattedAddress.toString();
      cityC.text = result.locality.toString();
      stateC.text = result.administrativeAreaLevel1!.name.toString();
      countryC.text = result.country!.name.toString();
      lat1 = result.latLng!.latitude;
      long1 = result.latLng!.longitude;
      pincodeC.text = result.postalCode.toString();
    });
  }*/

  /* _getLocation2() async {
    LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            PlacePicker(
              "AIzaSyCqQW9tN814NYD_MdsLIb35HRY65hHomco",
            )));
    print(
        "checking adderss detail ${result.country!.name.toString()} and ${result
            .locality.toString()} and ${result.country!.shortName
            .toString()} ");
    setState(() {
      recipientAddressCtr.text = result.formattedAddress.toString();
      cityC.text = result.locality.toString();
      stateC.text = result.administrativeAreaLevel1!.name.toString();
      countryC.text = result.country!.name.toString();
      lat2 = result.latLng!.latitude;
      long2 = result.latLng!.longitude;
      pincodeC.text = result.postalCode.toString();
    });
  }*/
  final ImagePicker _picker = ImagePicker();
  File? imageFile;
  List<File?> parcelImageList = [];

  _getFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        print('${imageFile}gggggg');
      });
      Navigator.pop(context);
    }
  }

  _getFromCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      Navigator.pop(context);
    }
  }

  _getCompensationAmmount() async {
    var headers = {
      'Cookie': 'ci_session=406d67c24c747ae88a88a5809e8b6a01e72d97c6'
    };
    var request = http.Request(
        'POST', Uri.parse('${ApiPath.baseUrl}Authentication/get_compensation'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      amt = jsonResponse['data']['compensation'];
      print('__________${amt}_____________');
    } else {
      print(response.reasonPhrase);
    }
  }

  Getprofilemodel? getprofile;
  Future<void> getuserProfile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userid = preferences.getString("userid");
    var headers = {
      'Cookie': 'ci_session=9aba5e78ffa799cbe054723c796d2bd8f2f7d120'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${ApiPath.baseUrl}User_Dashboard/getUserProfile'));
    request.fields.addAll({'user_id': userid.toString()});
    print("this is userId=========>${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();
      final jsonResponse = Getprofilemodel.fromJson(json.decode(finalResult));
      setState(() {
        getprofile = jsonResponse;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  void init() async {
    await getuserProfile();
    Position position = await _determinePosition();

    if ((getprofile?.data?.isNotEmpty ?? false) &&
        getprofile!.data![0].latitude!.isNotEmpty) {
      lat1 = double.parse(getprofile?.data?[0].latitude ?? '0.0');
      long1 = double.parse(getprofile?.data?[0].longitude ?? '0.0');

      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      senderAddressCtr.text =
          '${placemarks.first.name}, ${placemarks.first.subLocality}, ${placemarks.first.locality}, ${placemarks.first.administrativeArea}, ${placemarks.first.postalCode}';
    }
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
}

class Recipient {
  String? receiver_name;
  String? receiver_phone;
  String? receiver_address;
  String? receiver_longitude;
  String? receiver_latitude;
  String? reciver_full_address;
  String? meterial_category;
  String? parcel_weight;

  Recipient(
      {this.meterial_category,
      this.parcel_weight,
      this.receiver_phone,
      this.receiver_name,
      this.receiver_address,
      this.receiver_latitude,
      this.receiver_longitude,
      this.reciver_full_address});
}
