import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import '../Model/contactus.dart';
import '../Utils/api_path.dart';
import '../Utils/color.dart';
import 'MyProfile.dart';
import 'package:http/http.dart' as http;


class ContactUsScreen extends StatefulWidget {

  const ContactUsScreen({Key? key}) : super(key: key);


  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();


  Contactus? Contact;

  contactus() async {
    var headers = {
      'Cookie': 'ci_session=9aba5e78ffa799cbe054723c796d2bd8f2f7d120'
    };
    var request = http.MultipartRequest('GET', Uri.parse('${ApiPath.baseUrl}Users/ContactUs'));
    request.fields.addAll({
      'name': '${nameController.text}',
      'email': '${emailcontroller.text}',
      'subject': '4',
      'message': '56'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("bbbbbbbbbbbbbbbbbbbb${response}");

      final result = await response.stream.bytesToString();
      var resultcontactus = Contactus.fromJson(jsonDecode(result));

      setState(() {
        Contact = resultcontactus;
      });

    }

    else {
      print(response.reasonPhrase);
    }

  }
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 30),(){
      return contactus();
    });
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: profileBg,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: primaryColor,
            leading: GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.arrow_back, color: whiteColor, size: 20),
              //Icon(Icons.arrow_back_ios, color: whiteColor, size: 22),
            ),
            title:  Text('JDX Connect', style: TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'Lora'),),
          ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(0)),
                  color: Colors.white
              ),
              width: size.width,
              height: size.height,
              child: Contact ==  null || Contact == "" ? Center(child: CircularProgressIndicator(),) : ListView(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Html(data: "${Contact!.data!.pgDescri}"),
                ],
              ),
            )

          // body: Column(
          //   children: [
          //     Row(
          //       children: [
          //         Text("${Contact!.data!.pgDescri}"),
          //       ],
          //     ),
          //
          //     // Image.asset("assets/ContactUsAssets/contactusIcon.png",scale: 1.2,),
          //     // SizedBox(height: 30,),
          //     // Text("Incase of any queries or assistance\nKindly what's app us", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,fontFamily: 'Lora'),textAlign: TextAlign.center,),
          //     // SizedBox(height: 30,),
          //     // Padding(padding: EdgeInsets.symmetric(horizontal: 30),
          //     // child: Column(
          //     //   children: [
          //     //     // Html(data: "${Contact!.data!.pgDescri}", imageIcon: Image.asset('assets/ContactUsAssets/call.png', scale: 1.9,));
          //     //     LogoWithText(labelText: "810 810 3355", imageIcon: Image.asset('assets/ContactUsAssets/call.png', scale: 1.9,)),
          //     //     LogoWithText(labelText: "810 810 3355", imageIcon: Image.asset('assets/ContactUsAssets/whatsapp.png', scale: 1.9,),),
          //     //
          //     //     // LogoWithText(labelText: "${Contact!.data!.pgDescri}", imageIcon: Image.asset('assets/ContactUsAssets/email.png', scale: 1.2,)),
          //     //     // LogoWithText(labelText: "@jdxconnectofficial", imageIcon: Image.asset('assets/ContactUsAssets/instagram.png', scale: 1.2,)),
          //     //     // LogoWithText(labelText: "@jdxconnct_official", imageIcon: Image.asset('assets/ContactUsAssets/facebook.png', scale: 1.2,))
          //     //   ],
          //     // ),)
          //   ],
          //
          // )
    ));
  }
}
