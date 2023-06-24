import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:job_dekho_app/Jdx_screens/MyProfile.dart';

import '../Utils/color.dart';
import 'notification_Screen.dart';

class ParcelStetus extends StatefulWidget {
  const ParcelStetus({Key? key}) : super(key: key);

  @override
  State<ParcelStetus> createState() => _ParcelStetusState();
}

class _ParcelStetusState extends State<ParcelStetus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.to(DrawerScreen());
          },
          child: Icon(Icons.arrow_back),
          // child: Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
        title: Text("Parcel Status",style: TextStyle(fontFamily: 'Lora'),),
        centerTitle: true,
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                },
                child: Icon(Icons.notifications,color: Colors.white,)),
          )
        ],
      ),
    );
  }
}
