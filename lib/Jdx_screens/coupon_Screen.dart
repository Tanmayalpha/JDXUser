import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:job_dekho_app/Model/coupon_code_response.dart';
import 'package:job_dekho_app/Utils/api_path.dart';
import 'package:job_dekho_app/Utils/color.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CouponScreen extends StatefulWidget {
  const CouponScreen({Key? key, this.totalPrice}) : super(key: key);

  final double? totalPrice;

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  double? couponValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCoupon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
          // child: Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
        title: const Text(
          "Coupons",
          style: TextStyle(fontFamily: 'Lora'),
        ),
        centerTitle: true,
        actions: [
          /*Padding(
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
          ),*/
        ],
      ),
      body: ListView.builder(
        itemCount: couponCode?.data?.length ?? 0,
        itemBuilder: (context, index) {
          var item = couponCode?.data?[index];
          return Container(
            //height: 180,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item?.couponName ?? "New Coupon",
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 18,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        item?.couponDescription ?? "fdfsdffsf",
                        style: TextStyle(
                          color: greyColor,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Coupon Code: ',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: item?.couponCode ?? "ABCD",
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Minimum Amount: ',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: item?.cartValue ?? "50",
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Coupon Amount: ',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: item?.discountValue ?? "50",
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Ex Date: ',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: DateFormat('yyyy-MM-dd').format(
                                  DateTime.tryParse(item?.validTo.toString() ??
                                          DateTime.now().toString()) ??
                                      DateTime.now()),
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (double.parse(
                                  couponCode?.data?[index].cartValue ?? '0') <=
                              (widget.totalPrice ?? 0.0)) {
                            couponValue = double.parse(
                                couponCode?.data?[index].discountValue ??
                                    '0.0');
                            Navigator.pop(context, [
                              couponValue,
                              couponCode?.data?[index].couponName
                            ]);
                          } else {
                            Fluttertoast.showToast(
                                msg: 'Coupon not applicable');
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 150,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: gradient.defoultColor),
                          ),
                          child: const Text(
                            "Apply coupons",
                            style: TextStyle(color: gradient.defoultColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 130,
                  width: 100,
                  alignment: Alignment.center,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage.assetNetwork(
                        placeholderCacheHeight: 50,
                        placeholderCacheWidth: 50,
                        placeholderFit: BoxFit.cover,
                        placeholder: "assets/ezgif.com-crop.gif",
                        image:
                            "https://rewardbloggers.com/assets/upload/1586769506.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  CouponCodeResponse? couponCode;

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
}
