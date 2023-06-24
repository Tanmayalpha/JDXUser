import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:job_dekho_app/Jdx_screens/parceldetailsscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/ParcelHistoryModel.dart';
import '../Utils/api_path.dart';
import '../Utils/color.dart';
import 'MyProfile.dart';
import 'notification_Screen.dart';
import 'package:http/http.dart' as http;

class ParcelHistory extends StatefulWidget {
  const ParcelHistory({Key? key}) : super(key: key);

  @override
  State<ParcelHistory> createState() => _ParcelHistoryState();
}

class _ParcelHistoryState extends State<ParcelHistory> {
  ParcelhistoryModel? parcelhistory;

  parcelHistory() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userid = preferences.getString("userid");
    var headers = {
      'Cookie': 'ci_session=c4d89ea1aafd386c2dd6a6d1913c38e59c817e3d'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${ApiPath.baseUrl}payment/parcel_history'));
    request.fields.addAll({'user_id': userid.toString()});
    print("thi555555555555555=?>${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print("thi555555555555555=?>${response.statusCode}");
    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();
      final jsonResponse =
          ParcelhistoryModel.fromJson(json.decode(finalResult));
      print("aaaaaaaaaaaaaaaaaa===========>${jsonResponse}");
      print("aaaaaaaaaaaaaaaaaa===========>${finalResult}");
      setState(() {
        parcelhistory = jsonResponse;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      return parcelHistory();
    });
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
          "Parcel History",
          style: TextStyle(fontFamily: 'Lora'),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
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
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
              // child: Text("${parcelhistory!.data![0].orderId}")
              children: [
            parcelhistory == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : parcelhistory! == null
                    ? Center(
                        child: Text(
                          "No data to show",
                          style: TextStyle(fontFamily: 'Lora'),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: parcelhistory!.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      // print("_____________________${parcelhistory!.data![index].isTabbed}");
                                      // parcelhistory!.data![index].isTabbed = ! (parcelhistory!.data![index].isTabbed ?? false) ;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ParceldetailsScreen(
                                                    orderid: parcelhistory!
                                                        .data![index].orderId,isFromParcelHistory: true,
                                                  )));
                                    });
                                  },
                                  child: orderCard(context, index)),
                              /*Visibility(
                              visible:parcelhistory!.data![index].isTabbed ?? false,
                              child: SizedBox(
                                height: 200,
                                child: ListView.builder(
                                  itemCount: parcelhistory!.data?[index]
                                      .parcelDetails?.length,
                                  itemBuilder: (context, i) {
                                    return parcelCard(context, i, index);
                                  },),
                              ))*/
                            ],
                          );
                        }),
          ])),
    );
  }

  Widget orderCard(BuildContext c, int index) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: whiteColor,
                  radius: 40,
                  child: Image.asset(
                    'assets/order.png',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Order ID",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Lora'),
                    ),
                    Text(
                      "${parcelhistory!.data![index].orderId}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'Lora'),
                    ),

                    // Text("202",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,fontFamily: 'Lora'),),
                    Text(
                      "Total Amount",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Lora'),
                    ),
                    Text(
                      "${parcelhistory!.data![index].orderAmount}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'Lora'),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Parcel Count",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Lora'),
                    ),
                    Text(
                      "${parcelhistory!.data![index].parcelDetails?.length}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'Lora'),
                    ),
                    const Text(
                      "Order Date",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Lora'),
                    ),
                    Text(
                      "${parcelhistory!.data![index].onDate}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          fontFamily: 'Lora'),
                    ),
                  ],
                )
              ],
            ),
            /*SizedBox(height: 20,),
            Visibility(
                visible:parcelhistory!.data![index].isTabbed ?? false,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width:MediaQuery.of(context).size.width *.85 ,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: parcelhistory!.data?[index]
                        .parcelDetails?.length,
                    itemBuilder: (context, i) {
                      return parcelCard(context, i,index);
                    },),
                ))*/
          ],
        ),
      ),
    );
  }

 /* Widget parcelCard(
    BuildContext c,
    int i,
    int index,
  ) {
    var item = parcelhistory!.data?[index].parcelDetails?[i];
    print("${parcelhistory!.data?[index].orderId}");

    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 1,
            spreadRadius: 0,
          )
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(bottom: 0),
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              height: 50,
              width: 50,
              child: Image.network(item?.parcelPhoto ?? '')),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                *//*Text(
                  item?. ?? '',
                  style: const TextStyle(color: Colors.red),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),*//*
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textColumn('IsPaid', item?.isPaid ?? '-'),
                    textColumn('Status', item?.status ?? '-'),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Order Id',
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        ),
                        const SizedBox(height: 8),
                        FittedBox(
                          child: Text(
                            '${item?.orderId ?? '-'}',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    // textColumn('Rate', '\u{20B9}${item.rate.toString()}'),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Amount',
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        ),
                        const SizedBox(height: 8),
                        FittedBox(
                          child: Text(
                            '\u{20B9} ${item?.totalAmount ?? '-'}',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    //textColumn('Amount', '\u{20B9}${item.amount.toString()}'),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Track Parcel:',
                          style: TextStyle(color: Colors.red),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DeliveryTimelineApp(),
                                ));
                            *//*String lat =
                                item?.senderLatitude.toString() ?? '';//'22.7177'; //
                            String lon =
                                item?.senderLongitude.toString() ?? '';//'75.8545'; //
                            String CURENT_LAT =
                                _position?.latitude.toString() ?? '';
                            String CURENT_LONG =
                                _position?.longitude.toString() ?? '';

                            final Uri url = Uri.parse(
                                'https://www.google.com/maps/dir/?api=1&origin=' +
                                    CURENT_LAT +
                                    ',' +
                                    CURENT_LONG +
                                    ' &destination=' +
                                    lat.toString() +
                                    ',' +
                                    lon.toString() +
                                    '&travelmode=driving&dir_action=navigate');*//*
                            *//* String url = 'https://www.google.com';'https://www.google.com/maps/dir/?api=1&origin=' +
                          CURENT_LAT+
                          ','+
                          CURENT_LONG+
                          ' &destination='+
                          lat.toString()+
                          ','+
                          lon.toString()+
                          '&travelmode=driving&dir_action=navigate'; *//*

                         //   _launchURL(url);
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: primaryColor),
                            child: const Text(
                              'Track',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    *//*Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Track receiver',
                          style: TextStyle(color: Colors.red),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          onTap: () {
                            String lat =
                                item?.receiverLatitude.toString() ?? '';//'22.7177';
                            String lon =
                                item?.receiverLongitude.toString() ?? '';//'75.8545';
                            String CURENT_LAT =
                                _position?.latitude.toString() ?? '';
                            String CURENT_LONG =
                                _position?.longitude.toString() ?? '';

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
                            *//*
                  ],
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }*/

  Widget textColumn(String title, String subTitle) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 12, color: Colors.red),
        ),
        const SizedBox(height: 8),
        Text(
          subTitle,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        )
      ],
    );
  }
}
