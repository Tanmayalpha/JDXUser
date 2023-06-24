// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:job_dekho_app/Utils/CustomWidgets/TextFields/customTextField.dart';
// import 'package:job_dekho_app/Utils/CustomWidgets/TextFields/passwordTextField.dart';
// import 'package:job_dekho_app/Utils/CustomWidgets/customTextButton.dart';
// import 'package:job_dekho_app/Utils/CustomWidgets/TextFields/customTextFormField.dart';
// import 'package:get/get.dart';
// import 'package:job_dekho_app/Views/Recruiter/appliedjobs_Screens.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Model/ChangepasswordModel.dart';
// import '../Utils/color.dart';
// import 'MyProfile.dart';
// import 'package:http/http.dart' as http;
// import 'notification_Screen.dart';
//
// class ChangePasswordScreen extends StatefulWidget {
//   const ChangePasswordScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
// }
//
// class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
//
//   TextEditingController oldpswController = TextEditingController();
//   TextEditingController newpswController = TextEditingController();
//
//   changePassword() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userid = prefs.getString('userid');
//     var headers = {
//       'Cookie': 'ci_session=b3b229754d182b6e4d05901374d052785b664b07'
//     };
//     var request = http.MultipartRequest('POST', Uri.parse('https://developmentalphawizz.com/JDX/Api/change_password'));
//     request.fields.addAll({
//       'user_id': '${userid}',
//       'current_password': '${oldpswController.text}',
//       'new_password': '${newpswController.text}'
//     });
//
//     request.headers.addAll(headers);
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       print("truuuuuuuuuuuuuu");
//       print(await response.stream.bytesToString());
//
//       Get.to(DrawerScreen());
//
//       // final jsonResponse = ChangepasswordModel.fromJson(json.decode(finalResponse));
//     }
//     else {
//       print(response.reasonPhrase);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return SafeArea(child: Scaffold(
//       backgroundColor: primaryColor,
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: (){
//             Get.to(DrawerScreen());
//           },
//           child: Icon(Icons.arrow_back),
//         ),
//         elevation: 0,
//         backgroundColor: primaryColor,
//         title: Text('Change Password',style: TextStyle(fontFamily: 'Lora'),),
//         centerTitle: true,
//         actions: [
//           Padding(
//             padding:  EdgeInsets.only(right: 10),
//             child: InkWell(
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
//                 },
//                 child: Icon(Icons.notifications,color: Colors.white,)),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           height: MediaQuery.of(context).size.height/1.1,
//           padding: EdgeInsets.symmetric(horizontal: 12),
//           width: size.width,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(topRight: Radius.circular(0))
//           ),
//           //padding: EdgeInsets.symmetric(vertical: 30),
//           child: Column(
//             children: [
//               SizedBox(height: 70,),
//               Material(
//                 elevation: 10,
//                 borderRadius: BorderRadius.circular(10),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width / 1.2,
//                   height: 50,
//                   child: TextField(
//                     controller: oldpswController,
//                     decoration: InputDecoration(
//                       border: const OutlineInputBorder(
//                           borderSide: BorderSide.none
//                       ),
//                       hintText: "Old Password",
//                       prefixIcon: Image.asset('assets/AuthAssets/Icon ionic-ios-lock.png', scale: 2.1, color: primaryColor,),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 40,),
//               Material(
//                 elevation: 10,
//                 borderRadius: BorderRadius.circular(10),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width / 1.2,
//                   height: 50,
//                   child: TextField(
//                     controller: newpswController,
//                     decoration: InputDecoration(
//                       border: const OutlineInputBorder(
//                           borderSide: BorderSide.none
//                       ),
//                       hintText: "New Password",
//                       prefixIcon: Image.asset('assets/AuthAssets/Icon ionic-ios-lock.png', scale: 2.1, color: primaryColor,),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 40,),
//               CustomTextButton(buttonText: "save", onTap: (){
//                 changePassword();
//                 // Get.to(DrawerScreen());
//                 },)
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:job_dekho_app/Jdx_screens/signin_Screen.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customTextButton.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/ChangepasswordModel.dart';
import '../Utils/api_path.dart';
import '../Utils/color.dart';
import 'MyProfile.dart';
import 'package:http/http.dart' as http;
import 'notification_Screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  TextEditingController oldpswController = TextEditingController();
  TextEditingController newpswController = TextEditingController();

  SnackBar snackBar = const SnackBar(
    content: Text('Password Change Successfully',),
  );

  ChangepasswordModel? changepasswordModel;
  changePassword() async {
    print("Change Password");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString('userid');
    var headers = {
      'Cookie': 'ci_session=2642df063cc1a98b4a32209e7aa3505d7f4932a1'
    };
    var request = http.MultipartRequest('POST',Uri.parse('${ApiPath.baseUrl}Authentication/changePassword'));
    request.fields.addAll({
      'user_id': '${userid}',
      'password': newpswController.text,
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();
      final jsonResponse = ChangepasswordModel.fromJson(json.decode(finalResult));
      print("final change passsowrd result>>>>>>> ${finalResult.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(snackBar);


      Get.to(SignInScreen());
      setState(() {
        changepasswordModel = jsonResponse;
      });
    }
    else {
      print(response.reasonPhrase);

    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
        title: Text('Change Password',style: TextStyle(fontFamily: 'Lora'),),
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height/1.1,
          padding: EdgeInsets.symmetric(horizontal: 12),
          width: size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(0))
          ),
          //padding: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              SizedBox(height: 70,),
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  child: TextField(
                    controller: oldpswController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none
                      ),
                      hintText: "Old Password",
                      prefixIcon: Image.asset('assets/AuthAssets/Icon ionic-ios-lock.png', scale: 2.1, color: primaryColor,),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 50,
                  child: TextField(
                    controller: newpswController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none
                      ),
                      hintText: "New Password",
                      prefixIcon: Image.asset('assets/AuthAssets/Icon ionic-ios-lock.png', scale: 2.1, color: primaryColor,),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              CustomTextButton(buttonText: "save", onTap: (){
                changePassword();
                // Get.to(DrawerScreen());
              },),
            ],
          ),
        ),
      ),
    ));
  }
}
