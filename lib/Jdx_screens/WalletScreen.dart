import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/color.dart';
import 'MyProfile.dart';
import 'notification_Screen.dart';

class MywallwtScreen extends StatefulWidget {
  const MywallwtScreen({Key? key}) : super(key: key);

  @override
  State<MywallwtScreen> createState() => _MywallwtScreenState();
}

class _MywallwtScreenState extends State<MywallwtScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.to(DrawerScreen());
          },
          child: const Icon(Icons.arrow_back),
          // child: Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
        title: const Text("Parcel Status",style: TextStyle(fontFamily: 'Lora'),),
        centerTitle: true,
        actions: [
          Padding(
            padding:  const EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
                },
                child: const Icon(Icons.notifications,color: Colors.white,)),
          )
        ],
      ),

    );
  }
}
