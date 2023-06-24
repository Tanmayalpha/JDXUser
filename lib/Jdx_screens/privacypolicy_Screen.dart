import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Utils/api_path.dart';

import '../Model/privacypolicy.dart';
import '../Model/privacypolicymodel.dart';
import '../Utils/color.dart';
import 'MyProfile.dart';
import 'package:http/http.dart' as http;

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {

  var privacyData;

  PrivacypolicyModel? privacypolicy;
  getPrivacy()async{
    print("thisssssssssssssssss==============>");
    var headers = {
      'Cookie': 'ci_session=e27b9a709e79f067f9b5f2e6f6541ff1595521a5'
    };
    var request = http.MultipartRequest('GET', Uri.parse('${ApiPath.baseUrl}users/Privacy'));
    print("oooooooooo ${ApiPath.baseUrl}users/Privacy");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
     // print("thisssssssssssssssss==============>${response}");

      var finalResponse =await response.stream.bytesToString();
      var jsonResponse = PrivacypolicyModel.fromJson(jsonDecode(finalResponse));

      setState(() {
       // privacypolicy = jsonResponse;
         privacyData = jsonResponse.data ;
        //log('${item?.pgDescri}____________________hello');
       // print("privacy policy ${privacypolicy}");
       // print("thisssssssssssssssss==============>${finalResponse}");

      });
    }
    else {
      print(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 300),(){
      return getPrivacy();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: whiteColor,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: primaryColor,
              leading: GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Icon(Icons.arrow_back_ios, color: whiteColor, size: 20),
                //Icon(Icons.arrow_back_ios, color: whiteColor, size: 22),
              ),
              title:  Text('Privacy Policy', style: TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'Lora'),),

            ),
            body: privacyData == null || privacyData == "" ? Center(child: CircularProgressIndicator(),) : Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(0)),
                  color: Colors.white
              ),
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Html(data: "${privacyData}"),
                    Text('${privacyData?.pgDescri}', style:  TextStyle(fontSize: 16,),),

                  ],
                ),
              ),
            )
        ));;
  }
}
