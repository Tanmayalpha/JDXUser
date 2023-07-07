import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:http/http.dart' as http;
import 'package:job_dekho_app/Jdx_screens/Mywallet.dart';
import 'package:job_dekho_app/Jdx_screens/parcel_history.dart';
import 'package:job_dekho_app/Jdx_screens/parceldetailsscreen.dart';
import 'package:job_dekho_app/Model/slider_response.dart';

//import 'package:place_picker/entities/location_result.dart';
//import 'package:place_picker/widgets/place_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/ParcelHistoryModel.dart';
import '../Model/bannerModel.dart';
import '../Model/myPlanModel.dart';
import '../Utils/api_path.dart';
import '../Utils/color.dart';
import 'notification_Screen.dart';
import 'signup_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController addressC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController mobileC = TextEditingController();
  TextEditingController pincodeC = TextEditingController();
  TextEditingController cityC = TextEditingController();
  TextEditingController stateC = TextEditingController();
  TextEditingController countryC = TextEditingController();
  double lat = 0.0;
  double long = 0.0;
  int selectedSegmentVal = 0;

  // String radioButtonItem = 'ONE';
  int id = 0;

  List<String> myIds = [];

  bool isLoading = false ;

  String? planStatus;

  MyPlanModel? myPlanModel;
  var myPlanId;

  bool ResponseCode = false;

  ParcelhistoryModel? parcelhistory;
  String? userid;



  void initState() {
    // TODO: implement initState
    super.initState();

      parcelHistory(1);
    getbanner();

  }

  

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   PushNotificationService pushNotificationService = new PushNotificationService(context: context);
  //   pushNotificationService.initialise();
  //   super.initState();
  //   Future.delayed(Duration(milliseconds: 300),(){
  //   });
  //
  //   // Future.delayed(Duration(seconds: 1),(){
  //   //   return getParentCheckStudent();
  //   // });
  //
  //l
  //
  //   Future.delayed(Duration(milliseconds: 500),(){
  //     return getbanner();
  //   });
  //   Future.delayed(Duration(milliseconds: 300),(){
  //   });
  // }

  SliderDataResponse? bannerModel;

  getbanner() async {
    var headers = {
      'Cookie': 'ci_session=cf3c69364b479a1553327c57f04f890a05359969'
    };
    var request = http.Request('GET', Uri.parse('${ApiPath.baseUrl}Payment/slider'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();
      final jsonResponse = SliderDataResponse.fromJson(json.decode(finalResult));
      setState(() {
        bannerModel = jsonResponse;
        print('__________${bannerModel?.amount}___banner__________');
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  int? currentindex;

  showChildDialog() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpScreen()));
    if (result == true) {
      //  getbanner();
    }
  }

  Future _refreshLocalGallery() async {
    getbanner();
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Exit App',
              style: TextStyle(fontFamily: 'Lora'),
            ),
            content: Text(
              'Do you want to exit an App?',
              style: TextStyle(fontFamily: 'Lora'),
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: Text(
                  'No',
                  style: TextStyle(fontFamily: 'Lora'),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                onPressed: () {
                  exit(0);
                  // Navigator.pop(context,true);
                  // Navigator.pop(context,true);
                },
                //return true when click on "Yes"
                child: Text(
                  'Yes',
                  style: TextStyle(fontFamily: 'Lora'),
                ),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshLocalGallery,
      child: WillPopScope(
        onWillPop: showExitPopup,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 3),
                    //height: MediaQuery.of(context).size.height / 1.1,
                    decoration: const BoxDecoration(
                        color: Color(0xffF9F9F9),
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(0))),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              decoration:  BoxDecoration(
                                  color: splashcolor,
                                  borderRadius:
                                  const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft:Radius.circular(10) )),

                              width: MediaQuery.of(context).size.width / 1.26,
                              height: 50,
                              child: TextField(
                                readOnly: true,
                                controller: addressC,
                                maxLines: 1,
                                onTap: () {
                                  //_getLocation();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PlacePicker(
                                        apiKey: Platform.isAndroid
                                            ? "AIzaSyB0uPBgryG9RisP8_0v50Meds1ZePMwsoY"
                                            : "AIzaSyB0uPBgryG9RisP8_0v50Meds1ZePMwsoY",
                                        onPlacePicked: (result) {
                                          print(result.formattedAddress);
                                          setState(() {
                                            addressC.text =
                                                result.formattedAddress.toString();
                                            lat = result.geometry!.location.lat;
                                            long = result.geometry!.location.lng;
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        initialPosition: LatLng(
                                            22.719568,75.857727),
                                        useCurrentLocation: true,
                                      ),
                                    ),
                                  );
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: "Current Location",
                                  hintStyle:
                                      TextStyle(fontWeight: FontWeight.bold),
                                  prefixIcon: Image.asset(
                                    'assets/ProfileAssets/locationIcon.png',
                                    scale: 1.6,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(right: 10),
                                height: 50,

                                decoration:  BoxDecoration(
                                    color: splashcolor,
                                    borderRadius:
                                    const BorderRadius.only(topRight: Radius.circular(0),bottomRight:Radius.circular(0) )),
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const NotificationScreen()));
                                    },
                                    child: const Icon(
                                      Icons.notification_add_outlined,
                                      color: Colors.black,
                                    )),
                              ),
                            ),

                            Expanded(
                              flex: 1,
                              child: InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyWallet()));
                                  },
                                child: Container(
                                    padding: const EdgeInsets.only(right: 10),
                                    height: 50,

                                    decoration:  BoxDecoration(
                                        color: splashcolor,
                                        borderRadius:
                                        const BorderRadius.only(topRight: Radius.circular(10),bottomRight:Radius.circular(10) )),
                                    child: Icon(Icons.account_balance_wallet, color: primaryColor,)),
                              ),
                            )


                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        /*Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: splashcolor,
                            ),
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Search ",
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),*/
                        const SizedBox(
                          height: 15,
                        ),
                        // bannerModel == null ? Center(child: CircularProgressIndicator(),) : bannerModel!.data!.length == 0 ?
                        // Center(child: Text("No slider to show",style: TextStyle(fontFamily: 'Lora'),),),
                        //  :  Container(
                        //   height: 180,
                        //   width: double.infinity,
                        //   // width: double.infinity,
                        //   child:  CarouselSlider(
                        //     options: CarouselOptions(
                        //       viewportFraction: 1.2,
                        //       initialPage: 0,
                        //       enableInfiniteScroll: true,
                        //       reverse: false,
                        //       autoPlay: true,
                        //       autoPlayInterval: Duration(seconds: 3),
                        //       autoPlayAnimationDuration:
                        //       Duration(milliseconds: 120),
                        //       enlargeCenterPage: false,
                        //       scrollDirection: Axis.horizontal,
                        //       height: 180,
                        //       onPageChanged: (position, reason) {
                        //         setState(() {
                        //           currentindex = position;
                        //         });
                        //         print(reason);
                        //         print(CarouselPageChangedReason.controller);
                        //       },
                        //     ),
                        //     items: bannerModel!.data!.map((val) {
                        //       print("ooooooo ${ApiPath.imgUrl}${val.image}");
                        //       return Container(
                        //         width: MediaQuery.of(context).size.width,
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(20)
                        //         ),
                        //         // height: 180,
                        //         // width: MediaQuery.of(context).size.width,
                        //         child: ClipRRect(
                        //             borderRadius: BorderRadius.circular(20),
                        //             child: Image.network(
                        //               "${ApiPath.imgUrl}${val.image}",
                        //               fit: BoxFit.fill,
                        //             )),
                        //       );
                        //     }).toList(),
                        //   ),
                        //
                        //   // ListView.builder(
                        //   //   scrollDirection: Axis.horizontal,
                        //   //   shrinkWrap: true,
                        //   //   //physics: NeverScrollableScrollPhysics(),
                        //   //   itemCount: homeSliderList!.banneritem!.length,
                        //   //   itemBuilder: (context, index) {
                        //   //     return
                        //   //
                        //   //     //   InkWell(
                        //   //     //   onTap: () {
                        //   //     //     // Get.to(ProductListScreen(
                        //   //     //     //     parentScaffoldKey: widget.parentScaffoldKey));
                        //   //     //     widget.callback!.call(11);
                        //   //     //   },
                        //   //     //   child: Image.network("${Urls.imageUrl}${sliderBanner!.banneritem![0].bimg}"),
                        //   //     //   // Container(
                        //   //     //   //   margin: getFirstNLastMergin(index, 5),
                        //   //     //   //   width: MediaQuery.of(context).size.width * 0.8,
                        //   //     //   //   decoration: BoxDecoration(
                        //   //     //   //       color: (index + 1) % 2 == 0
                        //   //     //   //           ? AppThemes.lightRedColor
                        //   //     //   //           : AppThemes.lightYellowColor,
                        //   //     //   //       borderRadius:
                        //   //     //   //           BorderRadius.all(Radius.circular(10))
                        //   //     //   //   ),
                        //   //     //   // ),
                        //   //     // );
                        //   //   },
                        //   // ),
                        // ),
                        SizedBox(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child:bannerModel== null ?  Center(child: CircularProgressIndicator(color: splashcolor,)) :  ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                 '${ApiPath.imgUrl}${bannerModel?.amount}',
                                fit: BoxFit.fill,
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Parcel History',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            /*InkWell(
                                onTap: () {
                                  Get.to(const ParcelHistory());
                                },
                                child: Text(
                                  'View All',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: primaryColor),
                                )),*/
                          ],
                        ),
                        _segmentButton(),
                        SizedBox(

                          child: isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : parcelhistory?.data?.isEmpty ??false
                                  ? const Center(
                                      child: Text(
                                        "Not any order",
                                        style: TextStyle(fontFamily: 'Lora'),
                                      ),
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      itemCount:int.parse((parcelhistory!.data!.length).toStringAsFixed(0))
                                          ,
                                      itemBuilder: (c, i) {
                                        return parcelhistory?.data?[i].parcelDetails?.isEmpty ?? true ? SizedBox():  Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ParceldetailsScreen(
                                                            orderid: parcelhistory!
                                                                .data![i].orderId,isFromParcelHistory: true,
                                                          )));
                                            },
                                            child: Card(
                                              elevation: 1,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                     CircleAvatar(

                                                       backgroundColor: whiteColor,


                                                      radius: 40,
                                                      child: Image.asset('assets/order.png',),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          "Order ID",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  'Lora'),
                                                        ),
                                                        Text(
                                                          "${parcelhistory!.data![i].orderId}",
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'Lora'),
                                                        ),

                                                        // Text("202",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,fontFamily: 'Lora'),),
                                                        const Text(
                                                          "Total Amount",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  'Lora'),
                                                        ),
                                                        Text(
                                                          "${parcelhistory!.data![i].orderAmount}",
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'Lora'),
                                                        ),
                                                        const Text(
                                                          "Order Status",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                              fontFamily:
                                                              'Lora'),
                                                        ),
                                                        SizedBox(height: 5,),
                                                       /* InkWell(
                                                          onTap: (){
                                                           *//* String lat =
                                                                parcelhistory!.data![i].senderLatitude.toString() ?? '';//'22.7177'; //
                                                            String lon =
                                                                parcelhistory!.data![i].senderLongitude.toString() ?? '';//'75.8545'; //
                                                            String CURENT_LAT =
                                                                parcelhistory!.data![i].receiverLatitude.toString() ?? '';
                                                            String CURENT_LONG =
                                                                item.receiverLongitude.toString() ?? '';*//*

                                                           *//* final Uri url = Uri.parse(
                                                                'https://www.google.com/maps/dir/?api=1&origin=' +
                                                                    CURENT_LAT +
                                                                    ',' +
                                                                    CURENT_LONG +
                                                                    ' &destination=' +
                                                                    lat.toString() +
                                                                    ',' +
                                                                    lon.toString() +
                                                                    '&travelmode=driving&dir_action=navigate');

                                                            _launchURL(url);*//*

                                                          },
                                                          child: Container(
                                                            padding:
                                                            const EdgeInsets.only(
                                                                left: 10,
                                                                right: 10,
                                                                top: 2,
                                                                bottom: 2),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(15),
                                                                color: primaryColor),
                                                            child: const Text(
                                                              'Track',
                                                              style: TextStyle(
                                                                  color: Colors.white),
                                                            ),
                                                          ),
                                                        )*/

                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          "Parcel Count",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  'Lora'),
                                                        ),
                                                        Text(
                                                          "${parcelhistory!.data![i].parcelDetails?.length}",
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'Lora'),
                                                        ),
                                                        const Text(
                                                          "Order Date",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  'Lora'),
                                                        ),
                                                        Text(
                                                          "${parcelhistory!.data![i].onDate.toString().substring(0, 10)}",
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'Lora'),
                                                        ),
                                                         Text(
                                                          orderStatus(parcelhistory!.data![i].orderStatus ?? 'cancel'),
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 14,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                              fontFamily:
                                                              'Lora'),
                                                        ),
                                                        const SizedBox(height: 5,),
                                               parcelhistory!.data![i].orderStatus == '7' ? InkWell(
                                                          onTap: (){
                                                            cancelOrder(parcelhistory!.data![i].orderId ?? '44', i);
                                                          },
                                                          child: Container(
                                                            padding:
                                                            const EdgeInsets.only(
                                                                left: 10,
                                                                right: 10,
                                                                top: 2,
                                                                bottom: 2),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(15),
                                                                color: primaryColor),
                                                            child: const Text(
                                                              'Cancel',
                                                              style: TextStyle(
                                                                  color: Colors.white),
                                                            ),
                                                          ),
                                                        ) : SizedBox.shrink()
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

String orderStatus(String status ){
  print('__________${status}_____________');
    if(status == '0'){
      return 'Searching Driver';
    }else if(status == '1'){
      return 'Confirm';
    }else if(status == '2'){
      return 'Order Received';
    }else if(status == '3'){
      return 'Order Picked up';
    }else if(status == '4'){
      return 'Complete';
    }else if(status == '5'){
      return 'Order Delivered';
    }else if(status == '6'){
      return 'Order Complete';
    }else {

      return 'cancel';
    }

}

 /* _getLocation() async {
    LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PlacePicker(
              "AIzaSyCqQW9tN814NYD_MdsLIb35HRY65hHomco",
            )));
    print(
        "checking adderss detail ${result.country!.name.toString()} and ${result.locality.toString()} and ${result.country!.shortName.toString()} ");
    setState(() {
      addressC.text = result.formattedAddress.toString();
      cityC.text = result.locality.toString();
      stateC.text = result.administrativeAreaLevel1!.name.toString();
      countryC.text = result.country!.name.toString();
      lat = result.latLng!.latitude;
      long = result.latLng!.longitude;
      pincodeC.text = result.postalCode.toString();
    });
  }*/

  setSegmentValue(int i) {
    selectedSegmentVal = i;
    String status;
    if (i == 0) {
      parcelHistory(1);
    } else if (i == 1) {
      parcelHistory(2);
    }
    setState(() {

    });
   // getOrderList(status: status);

  }

  Widget _segmentButton() => Container(
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(45),
      color: Colors.white,
    ),
    margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
    child: Row(
      children: [
        Expanded(
          child: Container(
            height: 30,
            decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: selectedSegmentVal == 0
                        ? [primaryColor, Colors.redAccent]
                        : [Colors.transparent, Colors.transparent])),
            child: MaterialButton(
              shape: const StadiumBorder(),
              onPressed: () => setSegmentValue(0),
              child: Text(
                'Active',
                style:  TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 14,
                    color: selectedSegmentVal == 0
                        ? Colors.white
                        : Colors.black),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 30,
            decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: selectedSegmentVal == 1
                        ? [primaryColor, Colors.redAccent]
                        : [Colors.transparent, Colors.transparent])),
            child: MaterialButton(
              shape: const StadiumBorder(),
              onPressed: () => setSegmentValue(1),
              child: FittedBox(
                child: Text(
                  'Complete',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14,
                      color: selectedSegmentVal == 1
                          ? Colors.white
                          : Colors.black),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );

  parcelHistory(int? status) async {
    isLoading = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
   userid = preferences.getString("userid");
    var headers = {
      'Cookie': 'ci_session=c4d89ea1aafd386c2dd6a6d1913c38e59c817e3d'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${ApiPath.baseUrl}payment/parcel_history'));
    request.fields.addAll({
      'user_id': userid.toString(),
      'status': status.toString()
    });
    print("${request.fields}");
    print("${request}");

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print("thi555555555555555=?>${response.statusCode}");
    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();
      final jsonResponse =
      ParcelhistoryModel.fromJson(json.decode(finalResult));
      //log("Response Here===========>${jsonResponse}");
      log("Final Result Here===========>${finalResult}");
      setState(() {
        parcelhistory = jsonResponse;
        isLoading = false;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  cancelOrder(String orderId, int i) async{
    var request = http.MultipartRequest('POST', Uri.parse('https://developmentalphawizz.com/JDX/api/Authentication/update_parcel_status'));
    request.fields.addAll({
      'user_id': userid ?? '315',
      'order_id': orderId,
      'status': '7'
    });


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Order Cancel successfully')));

      parcelhistory?.data?.removeAt(i) ;
      setState(() {

      });
    }
    else {
    print(response.reasonPhrase);
    }
  }
}
