import 'dart:async';
import 'package:flutter/material.dart';
import 'package:job_dekho_app/Jdx_screens/Dashbord.dart';
import 'package:job_dekho_app/Jdx_screens/HomeScreen.dart';
import 'package:job_dekho_app/Jdx_screens/signin_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  String? userid;
  void checkLogin()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    userid = pref.getString('userid');
  }

  @override
  void initState() {
    // TODO: implement initState
    //Timer(Duration(seconds: 5), () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInScreen()));});
    super.initState();
    Future.delayed(Duration(milliseconds: 300),(){
      return checkLogin();
    });

    Future.delayed(Duration(seconds: 2),(){
      if(userid == null || userid == ""){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SignInScreen()));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyStatefulWidget()));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                image:DecorationImage(
                    image:AssetImage('assets/splash screen.png', ),
                    fit: BoxFit.cover
                ),
            ),
        ),
      ),
    );
  }
}

