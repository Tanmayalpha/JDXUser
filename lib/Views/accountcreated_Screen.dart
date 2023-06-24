import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customTextButton.dart';
import 'package:job_dekho_app/Jdx_screens/changepassword_Screen.dart';
import 'package:job_dekho_app/Jdx_screens/MyProfile.dart';
import 'package:job_dekho_app/Views/Recruiter/recruitermyprofile_Screen.dart';

class AccountCreatedScreen extends StatelessWidget {
  const AccountCreatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/AuthAssets/accountcreated.png', fit: BoxFit.fitWidth, ),
              Text('Account Created\n Successfully', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,fontFamily: 'Lora'),),
              CustomTextButton(buttonText: "Done", onTap: (){Get.to(DrawerScreen());},)
            ],
          ),
    ));
  }
}
