import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:job_dekho_app/Jdx_screens/share_qr.dart';
import 'package:job_dekho_app/Model/coupon_code_response.dart';
import 'package:job_dekho_app/Model/distance_data_fee_response.dart';
import 'package:job_dekho_app/Model/get_app_url_response.dart';
import 'package:job_dekho_app/Model/get_driver_rating_response.dart';
import 'package:job_dekho_app/Model/weight_data_fee_response.dart';
import 'package:job_dekho_app/Services/api.dart';
import 'package:job_dekho_app/Services/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Model/parceldetailsmodel.dart';
import '../Utils/api_path.dart';
import '../Utils/color.dart';
import 'Payment method.dart';
import 'RegisterParcel.dart';
import 'notification_Screen.dart';
import 'package:http/http.dart ' as http;

class ParceldetailsScreen extends StatefulWidget {
  final String? orderid;
  final bool isFromParcelHistory;

  ParceldetailsScreen({this.orderid, required this.isFromParcelHistory});

  //const ParceldetailsScreen({Key? key}) : super(key: key);

  @override
  State<ParceldetailsScreen> createState() => _ParceldetailsScreenState();
}

class _ParceldetailsScreenState extends State<ParceldetailsScreen> {
  Parceldetailsmodel? parceldetails;
  GetDistanceFeeResponse? distanceFeesRangeList;

  GetWeightFeeResponse? weightFeesRangeList;

  CouponCodeResponse? couponCode;
  GetAppUrl? appUrl;

  bool isloader = false;

  TextEditingController _couponController = TextEditingController();

  double? _totalPrice;

  double _deliveryCharge = 10.0;
  double _discount = 0.0;
  double _finalPrice = 0.0;
  double totalKm = 0;

  double totalKg = 0;

  double kgPrice = 0;

  double kmPrice = 0;

  double totalPrice = 0;

  double couponValue = 0;

  List<String> driverRating = [];

  void initState() {
    // TODO: implement initState
    super.initState();

    ParcelDetails();

    getWeightFeeData();
    getCoupon();
    getAppUrl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
          // child: Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
        title: const Text(
          "Parcel Details",
          style: TextStyle(fontFamily: 'Lora'),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()));
                },
                child: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: parceldetails?.data?.isEmpty ?? true
            ? Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2.8,
                  ),
                  Center(
                      child: CircularProgressIndicator(
                    color: splashcolor,
                  ))
                ],
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 3,
                        color: splashcolor,
                        child: Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
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
                                          const Text("Sender Name",
                                              style:
                                                  TextStyle(color: Colors.red)),
                                          Text(
                                              "${parceldetails?.data![0].senderName}"),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("Sender Mobile No.",
                                              style:
                                                  TextStyle(color: Colors.red)),
                                          Text(
                                              "${parceldetails?.data![0].phoneNo}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("Total Ammount",
                                              style:
                                                  TextStyle(color: Colors.red)),
                                          SizedBox(
                                              width: 100,
                                              child: Text(
                                                  "${parceldetails!.data![0].totalAmount}")),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Sender Address",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          SizedBox(
                                              width: 120,
                                              child: Text(
                                                "${parceldetails!.data![0].senderAddress}",
                                                maxLines: 3,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("Flat and floor no.",
                                              style:
                                                  TextStyle(color: Colors.red)),
                                          Text(
                                              "${parceldetails?.data![0].senderFulladdress}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    child: ListView.builder(
                      itemCount: parceldetails!.data!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var item = parceldetails!.data![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 3,
                              color: splashcolor,
                              child: Center(
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                                const Text("Parcel Id",
                                                    style: TextStyle(
                                                        color: Colors.red)),
                                                Text("${item.parcelHistory}"),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                    "Order Date            ",
                                                    style: TextStyle(
                                                        color: Colors.red)),
                                                Text("${item.onDate}"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        widget.isFromParcelHistory ?   Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text("Parcel Status",
                                                    style: TextStyle(
                                                        color: Colors.red)),
                                                Text(
                                                    "${orderStatus(item.status ?? '')}"),
                                              ],
                                            ),
                                            driverRating.isEmpty ? SizedBox() : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                    "Driver Rating         ",
                                                    style: TextStyle(
                                                        color: Colors.red)),
                                                Text("${driverRating.first}"),
                                              ],
                                            ),
                                          ],
                                        ) : SizedBox(),
                                        const SizedBox(height: 10),
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
                                                const Text("Recipient Name",
                                                    style: TextStyle(
                                                        color: Colors.red)),
                                                Text("${item.receiverName}"),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text("Recipient Number",
                                                    style: TextStyle(
                                                        color: Colors.red)),
                                                Text("${item.receiverPhone}"),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 14,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text("Recipient Address",
                                                    style: TextStyle(
                                                        color: Colors.red)),
                                                SizedBox(
                                                  width: 100,
                                                    child: Text("${item.receiverAddress}")),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "Share QR",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.red),
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.qr_code,
                                                      size: 40,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ShareQRCode(
                                                                      appUrl: appUrl
                                                                          ?.data
                                                                          .liveUrl,
                                                                      parcel:
                                                                          item),
                                                            ));
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                right: 10,
                                                                top: 5,
                                                                bottom: 5),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            color:
                                                                primaryColor),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: const [
                                                            Icon(
                                                              Icons.arrow_back,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              'Share',
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .white),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        item.status == '5' ? SizedBox() : Column(children: [
                                          widget.isFromParcelHistory
                                              ? Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              const Text("Track Parcel:",
                                                  style: TextStyle(
                                                      color: Colors.red)),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  String lat = item
                                                      .senderLatitude
                                                      .toString() ??
                                                      ''; //'22.7177'; //
                                                  String lon = item
                                                      .senderLongitude
                                                      .toString() ??
                                                      ''; //'75.8545'; //
                                                  String CURENT_LAT = item
                                                      .driverDetails
                                                      ?.latitude
                                                      .toString() ??
                                                      '';
                                                  String CURENT_LONG = item
                                                      .driverDetails
                                                      ?.longitude
                                                      .toString() ??
                                                      '';

                                                  final Uri url = Uri.parse(
                                                      'https://www.google.com/maps/dir/?api=1&origin=' +
                                                          CURENT_LAT +
                                                          ',' +
                                                          CURENT_LONG +
                                                          ' &destination=' +
                                                          lat.toString() +
                                                          ',' +
                                                          lon.toString() +
                                                          '&travelmode=driving&dir_action=navigate');

                                                  _launchURL(url);
                                                },
                                                child: Container(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 10,
                                                      right: 10,
                                                      top: 5,
                                                      bottom: 5),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius
                                                          .circular(15),
                                                      color: primaryColor),
                                                  child: const Text(
                                                    'Track',
                                                    style: TextStyle(
                                                        color:
                                                        Colors.white),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text("OTP:",
                                                  style: TextStyle(
                                                      color: Colors.red)),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text("${item.otp}",
                                                  style: TextStyle(
                                                      color: Colors.black))
                                            ],
                                          )
                                              : const SizedBox(),
                                          widget.isFromParcelHistory
                                              ? const Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("Driver Detail:",
                                                style: TextStyle(
                                                    color: Colors.red)),
                                          )
                                              : SizedBox(),
                                          widget.isFromParcelHistory
                                              ? drivercard(
                                              image: item
                                                  .driverDetails?.userImage,
                                              name: item.driverDetails
                                                  ?.userFullname,
                                              phone: item
                                                  .driverDetails?.userPhone,
                                              email: item
                                                  .driverDetails?.userEmail,
                                              vehicleNo: item
                                                  .driverDetails?.vehicleNo)
                                              : SizedBox()
                                        ],)
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        );
                      },
                    ),
                  ),
                  widget.isFromParcelHistory
                      ? const SizedBox.shrink()
                      : SizedBox(
                          height: 50,
                          child: ListView.builder(
                            itemCount: couponCode?.data?.length,
                            itemBuilder: (context, index) {
                              print(
                                  '__________${couponCode?.data?[index].couponCode}_______hiii______');

                              return Card(
                                child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          couponCode?.data?[index].couponCode ??
                                              '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              if (double.parse(couponCode
                                                          ?.data?[index]
                                                          .cartValue ??
                                                      '0') <=
                                                  totalPrice) {
                                                couponValue = double.parse(
                                                    couponCode?.data?[index]
                                                            .discountValue ??
                                                        '0.0');
                                                _discount = double.parse(
                                                    couponCode?.data?[index]
                                                            .discountValue ??
                                                        '0.0');

                                                _calculateFinalPrice();
                                              } else {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Not Valid Coupon code');
                                                _calculateFinalPrice();
                                              }
                                            },
                                            child: const Text('Apply')),
                                      ],
                                    )),
                              );
                            },
                          ),
                        ),
                  widget.isFromParcelHistory
                      ? const SizedBox.shrink()
                      : Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              /*Text(
                          'Total Price: \$$totalPrice',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        SizedBox(height: 10.0),*/
                              Text(
                                'Delivery Charge: ₹$totalPrice',
                                style: const TextStyle(fontSize: 20.0),
                              ),
                              const SizedBox(height: 10.0),
                              /*TextField(
                          controller: _couponController,
                          decoration: InputDecoration(
                            hintText: 'Enter coupon code',
                          ),
                        ),
                        SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () => _applyCoupon(_couponController.text),
                          child: Text('Apply Coupon'),
                        ),
                        SizedBox(height: 10.0),*/
                              Text(
                                'Discount: ₹$_discount',
                                style: const TextStyle(fontSize: 20.0),
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                'Final Price: ₹$_finalPrice',
                                style: const TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              // SizedBox(height: 20.0),
                              /*ElevatedButton(
                          onPressed: () => print('Payment button pressed'),
                          child: Text('Pay Now'),
                        ),*/
                            ],
                          ),
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  widget.isFromParcelHistory
                      ? const SizedBox.shrink()
                      : InkWell(
                          onTap: () {
                            Get.to(PaymentMethod(
                              orderid: parceldetails?.data![0].orderId,
                              totalAmount: _finalPrice,
                            ));
                            // emailPasswordLogin();
                          },
                          child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width / 1.4,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Secondry,
                            ),
                            child: isloader == true
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text(
                                    "Pay Now",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Lora'),
                                  ),
                          ),
                        ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
      ),
    );
  }

  Widget drivercard(
      {String? image,
      String? name,
      String? email,
      String? phone,
      String? vehicleNo}) {
    return Card(
        color: greyColor,
        elevation: 4,
        child: Column(
          children: [
            Text("Driver Detail",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: splashcolor.withOpacity(0.5),
                    backgroundImage: NetworkImage(
                        'https://developmentalphawizz.com/JDX/${image}'),
                    radius: 30,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: $name',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        /*SizedBox(height: 8),
                  Text('Email: $email'),*/
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text('$phone'),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                                onTap: () async {
                                  var url = "tel:${phone}";
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: Icon(
                                  Icons.local_phone,
                                  color: primaryColor,
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                                onTap: () {
                                  whatsAppLaunch(phone ??'');
                                },
                                child: Image.asset(
                                  'assets/whatsapplogo.webp',
                                  scale: 35,
                                ))
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Vehicle: $vehicleNo',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  void whatsAppLaunch( String num) async{
      var whatsapp = "${num}";
      // var whatsapp = "+919644595859";
      var whatsappURl_android = "whatsapp://send?phone=" + whatsapp +
          "&text=Hello, I am messaging from Courier Delivery App, I am interested to send my parcel, Can we have chat? ";
      var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
      if (Platform.isIOS) {
        // for iOS phone only
        if (await canLaunch(whatappURL_ios)) {
          await launch(whatappURL_ios, forceSafariVC: false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content:  Text("Whatsapp does not exist in this device")));
        }
      } else {
        // android , web
        if (await canLaunch(whatsappURl_android)) {
          await launch(whatsappURl_android);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content:  Text("Whatsapp does not exist in this device")));
        }
      }

  }

  void _launchURL(Uri url) async {
    if (await launchUrl(url)) {
      //await launch(url);
    } else {
      Fluttertoast.showToast(msg: 'Could not launch ');
      throw 'Could not launch $url';
    }
  }

  void _applyCoupon(String couponCode) {
    // check if coupon code is valid
    // if valid, set the discount and recalculate final price
    setState(() {
      _discount = 10.0; // set discount to $10 for demonstration purposes
      _calculateFinalPrice();
    });
  }

  void _calculateFinalPrice() {
    setState(() {
      totalPrice = kmPrice + kgPrice;
      _finalPrice = totalPrice - couponValue;
    });
  }

  getDriverRating(String driverId) async {
    var headers = {
      'Cookie': 'ci_session=6e2bbfaeac31fb0c3fcbcd0ae36ef35cb60a73d9'
    };
    var request = http.MultipartRequest('POST',
        Uri.parse('${ApiPath.baseUrl}Authentication/get_delivery_boy_rating'));
    request.fields.addAll({'delivery_boy_id': driverId});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print('__________${request.fields}_____________');

    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult = GetDriverRating.fromJson(jsonDecode(result));
      driverRating.add(finalResult.rating);
    } else {
      print(response.reasonPhrase);
    }
  }

  ParcelDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userid = preferences.getString("userid");
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    //String? totalAmount = preferences.getString("totalAmount");
    print("${userid}_________");

    var headers = {
      'Cookie': 'ci_session=6270d4c5b5ff060b06d5851397d2f4a1397a5ca9'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${ApiPath.baseUrl}Payment/parcel_details'));
    request.fields.addAll({
      'user_id': "${userid}",
      'order_id': widget.orderid ?? '',
    });
    request.headers.addAll(headers);
    print("request param ${request.fields}");
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();
      print(finalResult);
      final jsonResponse =
          Parceldetailsmodel.fromJson(json.decode(finalResult));
      String totalAmount = jsonResponse.data![0].totalAmount.toString();
      preferences.setString('totalAmount', totalAmount.toString());

      //print("thiss is total amount=========>${totalAmount}");
      // print("parcel detailss===>${jsonResponse}");
      //print("this is my Final resultss${finalResult}");
      await getDistanceFeeData();
      jsonResponse.data?.forEach((element) {
        getDriverRating(element.deliveryBoyId ?? '300');
      });
      setState(() {
        parceldetails = jsonResponse;

        _totalPrice =
            double.parse(parceldetails?.data?.first.totalAmount ?? '0');

        parceldetails?.data?.forEach((element) {
          calculateDistance(element.senderLatitude, element.senderLongitude,
              element.receiverLatitude, element.receiverLongitude);

          _calculateFinalWeit(element.totalKg ?? '0.0');
        });
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  getDistanceFeeData() async {
    var headers = {
      'Cookie': 'ci_session=4bd2882fa2500dda3ff73580f6997f15388877a0'
    };
    var request = http.Request(
        'GET', Uri.parse('${ApiPath.baseUrl}Payment/get_delivery_fee'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var finalResult = await response.stream.bytesToString();
      final jsonResponse =
          GetDistanceFeeResponse.fromJson(json.decode(finalResult));
      setState(() {
        distanceFeesRangeList = jsonResponse;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  getWeightFeeData() async {
    var headers = {
      'Cookie': 'ci_session=a453fb56503c7622338d95666be133057c1b12f1'
    };
    var request = http.Request(
        'GET', Uri.parse('${ApiPath.baseUrl}Payment/delivery_fee_weight'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();
      final jsonResponse =
          GetWeightFeeResponse.fromJson(json.decode(finalResult));

      setState(() {
        weightFeesRangeList = jsonResponse;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  void getCoupon() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userid = preferences.getString("userid");

    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=9a6cdba1ed76b7e3ccb05196897d2a5afac87be7'
    };
    var request =
        http.Request('GET', Uri.parse('${ApiPath.baseUrl}Products/couponList'));
    request.body = json.encode({"user_id": userid});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();
      final jsonResponse =
          CouponCodeResponse.fromJson(json.decode(finalResult));
      setState(() {
        couponCode = jsonResponse;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  String calculateDistance(late1, lone1, late2, lone2) {
    double lat1, lat2, lon1, lon2;
    print("$late1 $late2 $lone1 $lone2");
    if (late1 != null &&
        late2 != null &&
        lone1 != null &&
        lone2 != null &&
        late1 != "" &&
        late2 != "" &&
        lone1 != "" &&
        lone2 != "") {
      lat1 = double.parse(late1.toString());
      lat2 = double.parse(late2.toString());
      lon1 = double.parse(lone1.toString());
      lon2 = double.parse(lone2.toString());
    } else {
      return "0.0 km";
    }

    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    double km = 12742 * asin(sqrt(a));
    print('${km}____________');
    _calculateFinalDistance(km);
    return km.toStringAsFixed(2) + " km";
  }

  void _calculateFinalDistance(double km) {
    for (var number in distanceFeesRangeList?.amount ?? []) {
      if (km < double.parse(number.maxAmount ?? '0')) {
        kmPrice = kmPrice + double.parse(number.feeCharge ?? '');
        print("${kmPrice}_______kmPrice");
        break;
      }
    }

    _calculateFinalPrice();

    /* distanceFeesRangeList?.amount?.forEach((element) {

      if(km < double.parse(element.maxAmount ?? '0')){
        kmPrice = kmPrice + double.parse(element.feeCharge ?? '') ;
      }
    });*/
  }

  void _calculateFinalWeit(String kg) {
    totalKg = double.parse(kg);
    print("${totalKg}totalKg");
    for (var number in weightFeesRangeList?.amount ?? []) {
      if (totalKg < double.parse(number.maxWeight ?? '0')) {
        kgPrice = kgPrice + double.parse(number.feeCharge ?? '');
        print("${kgPrice}_______kgPrice");
        break;
      }
    }
    _calculateFinalPrice();

    /* weightFeesRangeList?.amount?.forEach((element) {
      if(totalKg < double.parse(element.maxWeight ?? '0')){


      }

    });*/
  }

  String orderStatus(String status) {
    if (status == '0') {
      return 'Searching Driver';
    } else if (status == '1') {
      return 'Confirm';
    } else if (status == '2') {
      return 'Order Received';
    } else if (status == '3') {
      return 'Order Picked up';
    } else if (status == '4') {
      return 'Complete';
    } else if (status == '5') {
      return 'Order Delivered';
    } else if (status == '6') {
      return 'Order Complete';
    } else {
      return 'cancel';
    }
  }

  getAppUrl() async {
    var headers = {
      'Cookie': 'ci_session=abd9c0600c8ebcb8ed6a9e9cc88ae3c1c5b6035a'
    };
    var request = http.Request('POST',
        Uri.parse('${ApiPath.baseUrl}Authentication/get_application_url'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult = GetAppUrl.fromJson(jsonDecode(result));

      appUrl = finalResult;
    } else {
      print(response.reasonPhrase);
    }
  }
}
