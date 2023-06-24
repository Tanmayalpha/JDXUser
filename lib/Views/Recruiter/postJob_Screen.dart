import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customDialogBox.dart';
import 'package:job_dekho_app/Utils/iconUrl.dart';

import '../../Utils/CustomWidgets/jobPostCard.dart';
import '../../Utils/color.dart';
import '../../Jdx_screens/MyProfile.dart';

class PostJobScreen extends StatefulWidget {
  const PostJobScreen({Key? key}) : super(key: key);

  @override
  State<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      backgroundColor: primaryColor,
      floatingActionButton: GestureDetector(
        onTap: (){
          Get.to(CustomDialogBox());
        },
        child: Container(
          width: 64,
          height: 64,
          child: Image.asset(postjobIconR, color: whiteColor),
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(100)
          ),
        ),),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.to(DrawerScreen());
          },
          child: Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
        title: Text("Post Job",style: TextStyle(fontFamily: 'Lora'),),
        centerTitle: true,
      ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(90)),
                color: Colors.white
            ),
            alignment: Alignment.center,
            width: size.width,
            height: size.height,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index){
              return JobPostCard();
            })


            // Column(
            //   //mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     JobPostCard(),
            //     JobPostCard(),
            //     JobPostCard()
            //   ],
            // ),
          ),
        )
    ));
  }
}
