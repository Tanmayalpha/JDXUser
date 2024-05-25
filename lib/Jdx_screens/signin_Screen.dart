// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:job_dekho_app/Utils/CustomWidgets/email_Tab.dart';
// import 'package:job_dekho_app/Utils/color.dart';
// import 'package:job_dekho_app/Views/forgotpassword_Screen.dart';
// import '../Utils/ApiModel/LoginModel.dart';
// import '../Utils/CustomWidgets/mobile_Tab.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// import '../Utils/api_path.dart';
// import 'Recruiter/recruitermyprofile_Screen.dart';
// import 'signup_Screen.dart';
//
// class SignInScreen extends StatefulWidget {
//   const SignInScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }
//
// class _SignInScreenState extends State<SignInScreen> {
//
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//
//   // var _value = 0;
//   bool isEmail = true;
//
//   Future<LoginModel?> loginEmail() async {
//     print("Api Working@@@");
//     var headers = {
//       'Cookie': 'ci_session=ad447bdb61848f5c85e9459927a16a9bf91e1a0f'
//     };
//     var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.login}'));
//     request.fields.addAll({
//       'email': '${emailController.text}',
//       'password': '${passwordController.text}',
//     });
//
//     print(request);
//     print("this is new request =====>>> ${request.fields}");
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       var finalResponse = await response.stream.bytesToString();
//       final jsonResponse = json.decode(finalResponse);
//       print("Nowwwww ${jsonResponse}");
//       if(jsonResponse['staus'] == 'true') {
//         // Fluttertoast.showToast(msg: '${jsonResponse['message']}');
//         print("Working Nowww ${jsonResponse['data']['id']}");
//         // String userId = jsonResponse['data']['id'];
//         // String userEmail = jsonResponse['data']['email'];
//       }
//       Navigator.push(context, MaterialPageRoute(builder: (context) => RecruiterMyProfileScreen()));
//     }
//     else {
//       var finalResponse = await response.stream.bytesToString();
//       final jsonResponse = json.decode(finalResponse);
//       print(jsonResponse.toString());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return SafeArea
//       (child: Scaffold(
//       backgroundColor: primaryColor,
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               height: 170,
//               decoration: BoxDecoration(
//                 color: primaryColor,
//               ),
//               child: Image.asset('assets/egate_logo.png', scale: 1.3,),
//             ),
//             Container(
//               padding: EdgeInsets.all(14),
//               width: size.width,
//               height: size.height / 1.3,
//               decoration: BoxDecoration(
//                   color: whiteColor,
//                   borderRadius: BorderRadius.only(topRight: Radius.circular(70), topLeft: Radius.circular(70)),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text('Log In', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),),
//                   SizedBox(height: 10,),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   //   children: [
//                       // Row(
//                       //   children: [
//                       //     // Radio(
//                       //     //   fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
//                       //     //   value: 1, groupValue: _value, onChanged: (value){setState((){isEmail = true;});},),
//                       //     // Text('Email', style: TextStyle(fontWeight: FontWeight.bold),),
//                       //   ],
//                       // ),
//                       // Row(
//                       //   children: [
//                       //     // Radio(
//                       //     //     activeColor: Colors.red,
//                       //     //     fillColor: MaterialStateColor.resolveWith((states) => primaryColor),
//                       //     //     value: 2, groupValue: _value, onChanged: (value){setState(() {isEmail = false;});}),
//                       //     // Text('Mobile', style: TextStyle(fontWeight: FontWeight.bold),),
//                       //   ],
//                       // )
//                     // ],
//                   // ), // Email & Mobile Radio Button
//                   Column(children: [isEmail ? EmailTabs() : MobileTabs()]),
//                   SizedBox(height: 80,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("Don't have an account? ", style: TextStyle(color: greyColor,fontWeight: FontWeight.bold),),
//                       GestureDetector(onTap: (){Get.to(SignUpScreen());},child: Text("Sign Up", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),)),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       )
//     ));
//   }
// }

import 'dart:convert';
import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/email_Tab.dart';
import 'package:job_dekho_app/Views/Job%20Seeker/seekerdrawer_Screen.dart';
import 'package:job_dekho_app/Views/Job%20Seeker/seekermyprofile_Screen.dart';
import 'package:job_dekho_app/Jdx_screens/HomeScreen.dart';
import 'package:job_dekho_app/Views/Recruiter/postJob_Screen.dart';
import 'package:job_dekho_app/Jdx_screens/MyProfile.dart';
import 'package:job_dekho_app/Views/Recruiter/recruitermyprofile_Screen.dart';
import 'package:job_dekho_app/Jdx_screens/forgotpassword_Screen.dart';
import 'package:job_dekho_app/Views/otp_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/CustomWidgets/TextFields/authTextField.dart';
import '../Utils/CustomWidgets/customTextButton.dart';
import '../Utils/CustomWidgets/mobile_Tab.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Utils/api_path.dart';
import '../Utils/color.dart';
import 'Dashbord.dart';
import 'signup_Screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var _value = 'Email';
  bool isEmail = true;
  bool isloader = false;
  bool showPassword = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  String? token;

  getToken() async {
    var fcmToken = await FirebaseMessaging.instance.getToken();
    setState(() {
      token = fcmToken.toString();
    });
    print("FCM ID Is______________ $token");
  }
  // String? userid;

  emailPasswordLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var headers = {
      'Cookie': 'ci_session=7324f9ce3bb7ccbd4b7dc0920071bc3c06f3ca51'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${ApiPath.baseUrl}Authentication/login'));
    request.fields.addAll({
      'email': '${emailController.text}',
      'password': '${passwordController.text}',
      'token': token.toString(),
    });
    print("Checking all fields here ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);

      if (jsonResponse['status'] == true) {
        Fluttertoast.showToast(msg: '${jsonResponse['message']}');
        print("json response new one here ${jsonResponse}");
        String userid = jsonResponse['data']['user_id'];
        String email = jsonResponse['data']['user_email'];
        String phone = jsonResponse['data']['user_phone'];
        prefs.setString('userid', userid.toString());
        prefs.setString('email', email.toString());
        prefs.setString('phone', phone.toString());

        print('__________${prefs.getString('phone')}_____________');
        setState(() {
          isloader = false;
          print("final response>>>>> ${jsonResponse}");
        });
        Fluttertoast.showToast(msg: "${jsonResponse['message']}");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DashboardView()));
      } else {
        Fluttertoast.showToast(msg: "${jsonResponse['message']}");
        setState(() {
          isloader = false;
        });
      }
    } else {
      setState(() {
        isloader = false;
      });
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      print(jsonResponse.toString());
      Fluttertoast.showToast(msg: "${jsonResponse['message']}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Exit App',
              style: TextStyle(fontFamily: 'Lora'),
            ),
            content: Text('Do you want to exit an App?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: Text(
                  'No',
                  style: TextStyle(fontFamily: 'Lora'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  exit(0);
                  // Navigator.pop(context,true);
                  // Navigator.pop(context,true);
                },
                //return true when click on "Yes"
                child: Text(
                  'Yes',
                  style: TextStyle(fontFamily: 'Lora'),
                ),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: showExitPopup,
      child: SafeArea(
          child: Scaffold(
              backgroundColor: splashcolor,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: primaryColor,
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              fontFamily: 'Lora',
                              color: whiteColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        width: size.width,
                        height: size.height / 1.6,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: ListView(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          shrinkWrap: true,
                          children: [
                            const Align(
                              alignment: Alignment.center,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Column(children: [
                              /// email login section
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Material(
                                    elevation: 10,
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      height: 55,
                                      child: TextField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          hintText: "Enter Email",
                                          prefixIcon: Image.asset(
                                            'assets/AuthAssets/Icon material-email.png',
                                            scale: 1.3,
                                            color: primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Material(
                                    elevation: 10,
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      height: 55,
                                      child: TextField(
                                        obscureText: true,
                                        controller: passwordController,
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                              borderSide: BorderSide.none),
                                          hintText: "Enter Password",
                                          prefixIcon: Image.asset(
                                            'assets/AuthAssets/Icon ionic-ios-lock.png',
                                            scale: 1.3,
                                            color: primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(Forget());
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text('Forgot Password?',
                                              style: TextStyle(
                                                color: primaryColor,
                                                fontWeight: FontWeight.bold,
                                              ))),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  // CustomTextButton(buttonText: 'Sign In', onTap: (){
                                  //   emailPasswordLogin();
                                  //   // Navigator.push(context, MaterialPageRoute(builder: (context)=> SeekerDrawerScreen()));
                                  // }),
                                  InkWell(
                                    onTap: () {
                                      // Navigator.push(context, MaterialPageRoute(builder:(context)=> MyStatefulWidget()));
                                      setState(() {
                                        isloader = true;
                                      });
                                      emailPasswordLogin();
                                    },
                                    child: Container(
                                      height: 45,
                                      width: MediaQuery.of(context).size.width /
                                          1.4,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Secondry,
                                      ),
                                      child: isloader == true
                                          ? Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                              ),
                                            )
                                          : const Text(
                                              "Login",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Lora'),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account? ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(SignUpScreen());
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }
}
