import 'package:flutter/material.dart';

//Colors
// final Color primaryColor = Color(0xFF5B2187);
final Color primaryColor = Color(0xFFBF2331);
final Color Secondry = Color(0xFFF2B304 );
final Color whiteColor = Color(0xFFFFFFFF);
final Color splashcolor = Color(0xFFDDEDFA);
final Color greyColor = Color(0xFFBEBEBE);
final Color greyColor1 = Color(0xFFA4A4A4);
final Color greyColor3 = Color(0xFF919191);
final Color profileBg = Color(0xFFF6F6F6);
final Color greyColor2 = Color(0xFF747474);
final Color purpleColor = Color(0xFFECE1FF);

//TextStyles
final TextStyle buttonTextStyle = TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.black);

class CustomColors {
  static const Color primaryColor = Color(0xFF6200EE);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color accentColor = Color(0xFFAF1626);
  static const Color TransparentColor= Color(0xFFEEF3F9);
  static const Color White= Color(0xFFffffff);
  static const Color LightblueColor= Color(0xFF222443);
  static const Color DarkBrownColor= Color(0xFFA55A61);
  static const Color DarkYellowColor= Color(0xFFA7785A);

}
class gradient {
  // static const Gradient btnGradient = LinearGradient(
  //   colors: [Color(0xff0c82df), Color(0xff3dc1fd)],
  //   begin: Alignment.bottomCenter,
  //   end: Alignment.topCenter,
  // );
  static const Gradient btnGradient = LinearGradient(
    colors: [Color(0xff5D8231), Color(0xff5D8231)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
  static const Gradient greenGradient = LinearGradient(
    colors: [Color(0xff5D8231), Color.fromARGB(255, 100, 199, 64)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  static const Gradient lightGradient = LinearGradient(
    colors: [Color(0xffdaedfd), Color(0xffdaedfd)],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
  static const Gradient transpharantGradient = LinearGradient(
    colors: [Colors.transparent, Colors.transparent],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
  static const Color defoultColor = Color(0xFFBF2331);
}


