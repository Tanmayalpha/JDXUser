import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:job_dekho_app/Model/generate_ticket_response.dart';
import 'package:job_dekho_app/Model/get_parcel_id_response.dart';
import 'package:job_dekho_app/Model/get_ticket_history.dart';
import 'package:job_dekho_app/Model/order_detail_response.dart';
import 'package:job_dekho_app/Model/ticket_message_response.dart';
import 'package:job_dekho_app/Services/api.dart';
import 'package:job_dekho_app/Utils/api_path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Utils/color.dart';
import 'Dashbord.dart';
import 'Generatelistscreen.dart';
import 'MyProfile.dart';
import 'notification_Screen.dart';
import 'support_chat/chat_page.dart';

class SupportScreens extends StatefulWidget {
  const SupportScreens({Key? key}) : super(key: key);

  @override
  State<SupportScreens> createState() => _SupportScreensState();
}

class _SupportScreensState extends State<SupportScreens> {
  Api api = Api();
  MessageDataList? selectedItem;
  ParcelIdData? selectedSellItem;

  final commentController = TextEditingController();
  final subjectController = TextEditingController();
  final emailController = TextEditingController();

  List <MessageDataList> messageList = [];

  List<ParcelIdData> parcelIdList = [];
  List<TicketHistoryData> ticketDataList = [];

  @override
  void initState() {
    // TODO: implement initState
    // getOrderDetail();
    getTicketMessage();
    getParcelId();
    getTicketHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: InkWell(
        onTap: () {
          generateTicket();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 1.2,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Secondry),
              child: const Text(
                "Generate Ticket",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios),
          // child: Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
        title: const Text(
          "Support",
          style: TextStyle(fontFamily: 'Lora'),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()));
                },
                child: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.2,
                      height: 40,
                      child: DropdownButton(
                        underline: Container(),

                        icon: const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(Icons.keyboard_arrow_down,
                              color: Color(0xFFBF2331)),
                        ),
                        hint: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Select Query"),
                        ),

                        items: messageList.map((items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(items.title.toString())),
                          );
                        }).toList(),
                        isExpanded: true,

                        value: selectedItem,
                        onChanged: (newValue) {
                          setState(() {
                            selectedItem = newValue;
                          });
                        },
                        //show selected item
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.2,
                      height: 40,
                      child: DropdownButton(
                        underline: Container(),

                        icon: const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(Icons.keyboard_arrow_down,
                              color: Color(0xFFBF2331)),
                        ),
                        hint: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Select Parcel Id"),
                        ),

                        items: parcelIdList.map((items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(items.saleId.toString())),
                          );
                        }).toList(),
                        isExpanded: true,

                        value: selectedSellItem,
                        onChanged: (newValue) {
                          setState(() {
                            selectedSellItem = newValue;
                          });
                        },
                        //show selected item
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: splashcolor,
                      ),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.1,
                      child: TextField(

                        controller: subjectController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Subject",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: splashcolor,
                      ),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.1,
                      child: TextField(

                        controller: emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Email",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 17.0, right: 17),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: splashcolor,
                      ),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.1,
                      height: 150,
                      child: TextField(
                        maxLines: 5,
                        controller: commentController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Add comment",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  ticketDataList.isEmpty? const SizedBox.shrink() : Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Icon(Icons.history_outlined, color: primaryColor,),
                        const SizedBox(width: 10,),
                        const Text("TicketHistory",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                      ],),
                    ),),
                  ticketDataList.isEmpty? const SizedBox.shrink() :
                  ListView.builder(
                    reverse: true,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ticketDataList.length,
                    itemBuilder: (context, index) {
                      var item = ticketDataList[index];
                    return  ticketWidgets(item);/*InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Chat(id: item.id),));
                      },
                      child: Card(
                        elevation: 2.0,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'id: ${item.id}',
                                style: const TextStyle(
                                    fontSize: 14.0, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                item.description ?? '',
                                style: const TextStyle(fontSize: 14.0),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                item.status == '1' ? 'Status: Closed' : 'Status: Open',
                                style: const TextStyle(
                                    fontSize: 14.0, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5.0),
                              *//*Text(
                                'Parcel Id: ${item.saleId}',
                                style: const TextStyle(
                                    fontSize: 14.0, fontWeight: FontWeight.bold),
                              ),*//*
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Date : ${item.dateCreated}',
                                    style: const TextStyle(
                                        fontSize: 14.0, fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.arrow_forward),
                                    onPressed: () {
                                      // TODO: navigate to support ticket details page
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );*/
                  },),
                  SizedBox(height: 60,),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getTicketHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString('userid');

    var headers = {
      'Cookie': 'ci_session=403ee3bdff0844c501cdff24faccb5d73d5c144c'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}Authentication/get_tickets'));
    request.fields.addAll({
      'user_id': userid ?? '315'
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();


    if (response.statusCode == 200) {
      var result =await response.stream.bytesToString();
      print('___________${result}__________');
      var finalResult = GetTicketHistory.fromJson(jsonDecode(result));
      setState(() {
        ticketDataList = finalResult.data ?? [] ;
        ticketDataList.reversed ;
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }

  void generateTicket() async {
    if (selectedItem == null) {
      Fluttertoast.showToast(msg: 'please select an Query');
    }else if (selectedSellItem == null) {
      Fluttertoast.showToast(msg: 'please select an Parcel');
    } else if (commentController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'please add comment');
    } else if (emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'please add email');
    }else if (subjectController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'please add comment');
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userid = prefs.getString('userid');

      var headers = {
        'Cookie': 'ci_session=403ee3bdff0844c501cdff24faccb5d73d5c144c'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${ApiPath.baseUrl}Authentication/add_ticket'));
      request.fields.addAll({
        'ticket_type_id': selectedItem?.id ?? '',
        'user_id': userid ?? '315',
        'subject': subjectController.text,
        'email': emailController.text,
        'description': commentController.text,
        'sale_id': selectedSellItem?.saleId ?? '1'
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      selectedItem = null;
      subjectController.clear();
      commentController.clear();
      selectedSellItem = null ;
      if (response.statusCode == 200) {
        var resul = await response.stream.bytesToString();
        var finalResult = GeneRateTicket.fromJson(jsonDecode(resul));

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${finalResult.message}')));

        setState(() {
          getTicketHistory();
        });
      }
      else {
        print(response.reasonPhrase);
      }


      /*try {

        Map<String, String> body = {};
        body['user_id'] = userid ?? '';
        body['parcel_id'] = selectedItem;
        body['message'] = commentController.text.trim();
        print('_____________________');
        var res = await api.generateTicketData(body);
        if (res.status ?? false) {

          // responseData = res.data?.userid.toString();
          geneRateTicket = res.data;
          setState(() {

          });
        } else {
          Fluttertoast.showToast(msg: '');
        }
      } catch (e) {
        Fluttertoast.showToast(msg: "Invalid Email & Password");
      } finally {}
    }*/
    }
  }

  void getTicketMessage() async {
    var headers = {
      'Cookie': 'ci_session=fb1e834ed7716c84e9817e5d5a9db04cde5fc664'
    };
    var request = http.Request(
        'GET', Uri.parse('${ApiPath.baseUrl}Authentication/ticket_types'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      var jsonResponse = GetTicketMessage.fromJson(jsonDecode(finalResponse));
      setState(() {
        messageList = jsonResponse.data ?? [];
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }

  void getParcelId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString('userid');
    var headers = {
      'Cookie': 'ci_session=cda8a80365d5038f070c7b1e2ca46f71072c09a5'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${ApiPath.baseUrl}Authentication/get_parcel_id'));
    request.fields.addAll({
      'user_id': userid ?? '315',
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalResult = GetParcelId.fromJson(jsonDecode(result));
      setState(() {
        parcelIdList = finalResult.data ?? [];
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }


  Widget ticketWidgets(TicketHistoryData item) {
    String status = item.status == '0' ? 'Open' : 'Close' ;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipPath(
        clipper: TicketClipper(),
        child: Container(
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ticket ID: ${item.id}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          Text(
                            'Status: ${status}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: _getStatusColor(item.status ?? ''),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Comment:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '${item.description}',
                        style: TextStyle(fontSize: 14.0),
                      ),
                      const Text(
                        'Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '${item.dateCreated}',
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Chat(id: item.id),));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: _getStatusColor(item.status ?? ''),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: const Text(
                      'VIEW DETAILS',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ) ;
  }

  Color _getStatusColor(String status) {
    if (status == '0') {
      return Colors.green;
    } else if (status == '2') {
      return Colors.red;
    } else if (status == 'Closed') {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width - 30, size.height)
      ..quadraticBezierTo(
        size.width,
        size.height,
        size.width,
        size.height - 30,
      )
      ..lineTo(size.width, 0)
      ..close();

    final dotsPath = Path();

    for (double i = 0; i < size.height; i += 4) {
      dotsPath.moveTo(size.width - 30, i);
      dotsPath.lineTo(size.width - 30, i + 2);
    }

    path.addPath(dotsPath, Offset.zero);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}