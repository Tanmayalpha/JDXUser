// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:job_dekho_app/Utils/CustomWidgets/customTextButton.dart';
// import 'package:job_dekho_app/Utils/CustomWidgets/TextFields/customTextFormField.dart';
// import '../Utils/color.dart';
// import 'signin_Screen.dart';
//
// class ForgotPasswordScreen extends StatefulWidget {
//   const ForgotPasswordScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
// }
//
// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         //centerTitle: true,
//         backgroundColor: Colors.transparent,
//         leading: GestureDetector(
//           onTap: (){
//             Get.to(SignInScreen());
//           },
//           child: Icon(Icons.arrow_back_ios, color: primaryColor, size: 26),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Container(
//             //   width: 250,
//             //   height: 300,
//             //   child: Image.asset('assets/AuthAssets/forgotpassword.png'),
//             // ),
//             SizedBox(height: 25,),
//             Text("Forget Password?", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,fontFamily: 'Lora'),),
//             SizedBox(height: 20,),
//             Text('Enter email associated \n with your account', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: greyColor1,fontFamily: 'Lora'),textAlign: TextAlign.center,),
//             CustomTextFormField(label: "Email"),
//             SizedBox(height: 50,),
//             CustomTextButton(buttonText: "Submit")
//           ],
//         ),
//       ),
//     ));
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/CustomWidgets/TextFields/customTextFormField.dart';
import '../Utils/color.dart';



class Forget extends StatefulWidget {
  const Forget({Key? key}) : super(key: key);

  @override
  State<Forget> createState() => _ForgetState();
}

class _ForgetState extends State<Forget> {
  bool isloader = false;

  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [CustomColors.accentColor, CustomColors.DarkBrownColor,
                          CustomColors.DarkYellowColor,CustomColors.LightblueColor],
                        stops: [0, 1,2,3]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 150),
                  child: Container(
                    height: 370,
                    width: 340,
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 170.0, left: 30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 48.0),
                        child: Image.asset('assets/AuthAssets/forgotpassword.png',height: 160,width: 300,),
                      ),
                      const Text(
                        'We will send reset link to your email\n address',
                        style: TextStyle(
                          fontSize: 15,),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 50,
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none
                                ),
                                hintText: "Enter Email",
                                prefixIcon: Image.asset('assets/AuthAssets/Icon material-email.png', scale: 1.3, color: primaryColor,),
                              ),),),
                        ),
                      ),
                      SizedBox(height: 30,),
                      InkWell(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder:(context)=> MyStatefulWidget()));
                          setState(() {
                            isloader = true;
                          });
                          // emailPasswordLogin();
                        },
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width/1.6,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Secondry,
                          ),
                          child: isloader == true ? Center(child: CircularProgressIndicator(color: Colors.white,),):
                          const Text("Send",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,fontFamily: 'Lora'),),
                        ),
                      ),

                      // Container(
                      //     height: 50,
                      //     width: 290,
                      //     decoration: BoxDecoration(
                      //         color: CustomColors.TransparentColor,
                      //         borderRadius: BorderRadius.circular(10)),
                      //     child: CustomTextFormField(
                      //       validator: (value) {
                      //         if (value == null || value.isEmpty) {
                      //           return 'Cant Empty';
                      //         }
                      //         return null;
                      //       },
                      //       prefixIcon: Icons.email, controller: emailController, hintText: 'Enter Email', label: '',)
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 70.0),
                      //   child: SizedBox(
                      //       height: 45,
                      //       width: 270,
                      //       child: CustomElevatedButton(text: 'Send', icon:Icons.send, onPressed:(){},)),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
