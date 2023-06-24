import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:job_dekho_app/Utils/api_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/notifymodel.dart';
import '../Utils/color.dart';
import 'package:http/http.dart' as http;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  Notifymodel? notificationhistory;
  getNotification()async{
    print("Notification Api....");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString('userid');
    var headers = {
      'Cookie': 'ci_session=e27b9a709e79f067f9b5f2e6f6541ff1595521a5'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}Payment/GetNotificationList'));
    request.fields.addAll({
      'user_id': '4'
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = Notifymodel.fromJson(json.decode(finalResponse));

      print("noiiiiiiiiiiiiiiiiiiiiiii==========>${finalResponse}");
      print("noiiiiiiiiiiiiiiiiiiiiiii==========>${jsonResponse}");
      setState(() {
        notificationhistory = jsonResponse;
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 300),(){
      return getNotification();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: primaryColor,
              leading: GestureDetector(
                onTap: (){
               Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios, color: whiteColor, size: 20),
                //Icon(Icons.arrow_back_ios, color: whiteColor, size: 22),
              ),
              title:  Text('Notification', style: TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'Lora'),),
            ),
         // body: Column(
         //   children: [
         //     // child: Text("${parcelhistory.data![0].orderId}")
         //
         //     Text("${notificationhistory!.data![0].notification}")
         //   ],
         // ),
          body: Container(
            padding: EdgeInsets.only(top: 0,bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(0)),
                color: Color(0xffF9F9F9)
            ),
            width: size.width,
            height: size.height,
            child:  notificationhistory == null || notificationhistory == "" ? Center(child: CircularProgressIndicator(),) :
         ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: notificationhistory!.data!.length,
                itemBuilder: (c,i){
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text("${notificationhistory!.data![i].notification}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,fontFamily: 'Lora'),)),
                          Expanded(child: Text("${notificationhistory!.data![i].date}", style: TextStyle(color: greyColor2,fontSize: 12, fontWeight: FontWeight.bold,fontFamily: 'Lora'),)),
                        ],
                      ),
                      Text("${notificationhistory!.data![i].notification}",maxLines: 2,style: TextStyle(fontFamily: 'Lora'),)
                    ],
                  ),
                ),
              );
            })
          )
        ));
  }
}
