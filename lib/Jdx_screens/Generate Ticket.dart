import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:job_dekho_app/Jdx_screens/MyProfile.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


import '../Model/generateticketmodel.dart';
import '../Utils/color.dart';
import 'notification_Screen.dart';

class GenerateTicket extends StatefulWidget {
  const GenerateTicket({Key? key}) : super(key: key);

  @override
  State<GenerateTicket> createState() => _GenerateTicketState();
}

class _GenerateTicketState extends State<GenerateTicket> {
  var generateTicket;

  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 300),(){
      return generate();
    });

  }



  generate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString("userid");
    print(" this is User Id____________${userid}");
    var headers = {
      'Cookie': 'ci_session=06a91dd0ddd716e023384ea9614a0ea35f29c7f4'
    };
    var request = http.MultipartRequest('POST', Uri.parse('https://developmentalphawizz.com/JDX/api/Products/parcel_feedback'));
    request.fields.addAll({
      'user_id': userid.toString(),
      'parcel_id': '1',
      'message': 'test'
    });
  print("thisd is a======>${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final result = await response.stream.bytesToString();
      var NewResponce = Generateticketmodel.fromJson(jsonDecode(result));
      print('This is user tickket${NewResponce}');
      setState(() {
        generateTicket = NewResponce;
      });
      print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.to(DrawerScreen());
          },
          child: Icon(Icons.arrow_back),
          // child: Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
        title: const Text("Generate Ticket",style: TextStyle(fontFamily: 'Lora'),),
        centerTitle: true,
        /*actions: [
          Padding(
            padding:  EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                },
                child: Icon(Icons.notifications,color: Colors.white,)),
          )
        ],*/
      ),

    );

  }
}
