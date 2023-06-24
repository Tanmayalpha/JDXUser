import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customTextButton.dart';
import 'package:job_dekho_app/Utils/color.dart';
import 'package:job_dekho_app/Views/Recruiter/recruitermyprofile_Screen.dart';
import 'package:job_dekho_app/Jdx_screens/signin_Screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: (){
                Get.to(SignInScreen());
              },
              child: Icon(Icons.arrow_back_ios, color: primaryColor, size: 26),
            ),
            title:  Text('Verification', style: TextStyle(color: primaryColor, fontSize: 21, fontWeight: FontWeight.bold,fontFamily: 'Lora'),),
          ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            alignment: Alignment.center,
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                SizedBox(height: 50,),
                Text("Code has sent to \n           Email", style: TextStyle(fontSize: 22, color: primaryColor,fontFamily: 'Lora'),),
                // SizedBox(height: 5,),
                // Text("+61261960198", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),),
                SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: PinCodeTextField(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    appContext: (context),
                    onChanged: (value){},
                    length: 4,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                        activeColor: primaryColor,
                        fieldWidth: 48,
                        fieldHeight: 48,
                        selectedColor:  greyColor,
                        borderWidth: 2,
                        inactiveColor: Colors.grey
                    ),
                  ),
                ),
                SizedBox(height: 30,child: Text("Haven't received the verification code?", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),),),
                Text("Resend", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,fontFamily: 'Lora'),),
                SizedBox(height: 50 ,),
                CustomTextButton(buttonText: "Verify Authentication Code", onTap: (){Get.to(RecruiterMyProfileScreen());},),
              ],
            ),
          ),
        )
    ));
  }
}

