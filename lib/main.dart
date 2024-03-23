import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_dekho_app/Jdx_screens/splash_Screen.dart';

import 'Services/notification_service.dart';

@pragma('vm:entry-point')
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  LocalNotificationService.initialize();

  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  try{
    String? token = await FirebaseMessaging.instance.getToken();
    print("-----------token:-----${token}");
  } on FirebaseException{
    print('__________FirebaseException_____________');
  }
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JDX',
      theme: ThemeData (
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}