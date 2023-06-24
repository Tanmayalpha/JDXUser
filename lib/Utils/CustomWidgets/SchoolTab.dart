import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Views/Recruiter/recruitermyprofile_Screen.dart';
import 'package:job_dekho_app/Views/accountcreated_Screen.dart';
import 'package:job_dekho_app/Jdx_screens/signin_Screen.dart';

import '../../Jdx_screens/signup_Screen.dart';
import '../color.dart';
import 'TextFields/authTextField.dart';
import 'customTextButton.dart';

class SchoolTab extends StatefulWidget {
  const SchoolTab({Key? key}) : super(key: key);

  @override
  State<SchoolTab> createState() => _SchoolTabState();
}

class _SchoolTabState extends State<SchoolTab> {
  // TextEditingController nameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // TextEditingController mobileController = TextEditingController();
  // TextEditingController ageController = TextEditingController();
  // TextEditingController dateofbirthaController = TextEditingController();
  // TextEditingController classController = TextEditingController();
  // TextEditingController parentsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          AuthTextField(iconImage: Image.asset('assets/AuthAssets/Icon awesome-user.png', scale: 1.3, color: primaryColor,),hintText: "School Name",),
          AuthTextField(iconImage: Image.asset('assets/AuthAssets/Icon material-email.png', scale: 1.3, color: primaryColor,),hintText: "School Email",),
          AuthTextField(iconImage: Image.asset('assets/AuthAssets/Icon ionic-ios-lock.png', scale: 1.3, color: primaryColor,),hintText: "School Dise Code",),
          AuthTextField(iconImage: Image.asset('assets/AuthAssets/Icon ionic-ios-call.png', scale: 1.3, color: primaryColor,),hintText: "Mobile No.",),
          AuthTextField(iconImage: Image.asset('assets/AuthAssets/Icon awesome-user.png', scale: 1.3, color: primaryColor,),hintText: "Driver Name",),
          AuthTextField(iconImage: Image.asset('assets/AuthAssets/Icon material-email.png', scale: 1.3, color: primaryColor,),hintText: "Driver Email",),
          AuthTextField(iconImage: Image.asset('assets/AuthAssets/Icon ionic-ios-call.png', scale: 1.3, color: primaryColor,),hintText: "Driver Mobile",),
          AuthTextField(iconImage: Image.asset('assets/AuthAssets/Icon material-email.png', scale: 1.3, color: primaryColor,),hintText: "Driver Shift",),
          AuthTextField(iconImage: Image.asset('assets/AuthAssets/Icon material-email.png', scale: 1.3, color: primaryColor,),hintText: "Driver Vehicle",),
          AuthTextField(iconImage: Image.asset('assets/AuthAssets/Icon material-email.png', scale: 1.3, color: primaryColor,),hintText: "Driver Vehicle No.",),
          // SizedBox(height: 30,),
          // CustomTextButton(buttonText: 'Submit', onTap: (){Get.to(AccountCreatedScreen());},
          // ),
          // SizedBox(height: 20,),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text("I already have an account! ", style: TextStyle(color: greyColor,fontWeight: FontWeight.bold),),
          //     GestureDetector(onTap: (){Get.to(SignInScreen());},child: Text("Log In", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),))
          //   ],
          // )
        ],
      ),
    );
  }
}
