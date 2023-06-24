import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customProfileCard.dart';
import 'package:job_dekho_app/Views/Recruiter/recruiterprofiledetails_Screen.dart';

import '../../Utils/color.dart';
import '../../Jdx_screens/MyProfile.dart';

class AppliedJobsScreen extends StatefulWidget {
  const AppliedJobsScreen({Key? key}) : super(key: key);

  @override
  State<AppliedJobsScreen> createState() => _AppliedJobsScreenState();
}

class _AppliedJobsScreenState extends State<AppliedJobsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.to(DrawerScreen());
          },
          child: Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
        title: Text("Applied",style: TextStyle(fontFamily: 'Lora'),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          padding: EdgeInsets.symmetric(vertical: 18),
          height: size.height,
          decoration : BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(70))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomProfileCard(
                jobId: "10",name: "Rahulaj Singh", mobileNumber: "9773939666", email: 'meera@gmail.com',
                onTap: (){Get.to(RecruiterProfileDetailScreen());},
              ),
              CustomProfileCard(
                jobId: "9",name: "Rahulaj Singh", mobileNumber: "9773939666", email: 'meera@gmail.com',
                onTap: (){Get.to(RecruiterProfileDetailScreen());},
              ),
              CustomProfileCard(
                jobId: "7",name: "Rahulaj Singh", mobileNumber: "9773939666", email: 'meera@gmail.com',
                onTap: (){Get.to(RecruiterProfileDetailScreen());},

              ),
            ],
          ),
        ),
      )
    ));
  }
}
