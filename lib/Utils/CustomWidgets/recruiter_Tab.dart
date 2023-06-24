import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Views/accountcreated_Screen.dart';
import 'package:job_dekho_app/Jdx_screens/signin_Screen.dart';

import '../../Jdx_screens/signup_Screen.dart';
import '../color.dart';
import 'TextFields/authTextField.dart';
import 'customTextButton.dart';

class RecruiterTab extends StatelessWidget {
  const RecruiterTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          AuthTextField(iconImage: Image.asset('assets/AuthAssets/Icon material-email.png', scale: 1.3, color: primaryColor,),hintText: "Email",),
          AuthTextField(iconImage: Image.asset('assets/AuthAssets/Icon awesome-user.png', scale: 1.3, color: primaryColor,),hintText: "Full Name",),
          AuthTextField(iconImage: Image.asset('assets/AuthAssets/Icon awesome-user.png', scale: 1.3, color: primaryColor,),hintText: "Company Name",),
          AuthTextField(iconImage: Image.asset('assets/AuthAssets/Icon ionic-ios-call.png', scale: 1.3, color: primaryColor,),hintText: "Mobile No.",),
          AuthTextField(iconImage: Image.asset('assets/AuthAssets/Icon ionic-ios-lock.png', scale: 1.3, color: primaryColor,),hintText: "Password",),
          AuthTextField(iconImage: Image.asset('assets/AuthAssets/Icon ionic-ios-lock.png', scale: 1.3, color: primaryColor,),hintText: "Confirm Password",),
          SizedBox(height: 30,),
          CustomTextButton(buttonText: 'Submit', onTap: (){Get.to(AccountCreatedScreen());},),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("I already have an account! ", style: TextStyle(color: greyColor,fontWeight: FontWeight.bold),),
              GestureDetector(onTap: (){Get.to(SignInScreen());},child: Text("Sign In", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),))
            ],
          )
        ],
      ),
    );
  }
}
