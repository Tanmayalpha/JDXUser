import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Model/studentAttendenceModel.dart';
import '../../Utils/api_path.dart';
import '../../Utils/color.dart';

class StudentAttendenceList extends StatefulWidget {
  final String? studentId;
  StudentAttendenceList({this.studentId});

  @override
  State<StudentAttendenceList> createState() => _StudentAttendenceListState();
}

class _StudentAttendenceListState extends State<StudentAttendenceList> {

  StudentAttendenceModel? studentAttendenceModel;

  getStudentAttendence()async{
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie': 'ci_session=54c31ecf7a2bb9e96f2231164df82ff608a86ef7'
    };
    var request = http.Request('POST', Uri.parse('${ApiPath.baseUrl}get_students_attendance_details'));
    request.bodyFields = {
      'id': '${widget.studentId}'
    };
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();
      final jsonResponse = StudentAttendenceModel.fromJson(json.decode(finalResult));
      setState(() {
        studentAttendenceModel = jsonResponse;
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
      return getStudentAttendence();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        title: Text("Attendence List",style: TextStyle(fontFamily: 'Lora'),),
        centerTitle: true,
      ),
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 18,horizontal: 14),
            height: MediaQuery.of(context).size.height/1.1,
            decoration : BoxDecoration(
                color: Color(0xffF9F9F9),
                borderRadius: BorderRadius.only(topRight: Radius.circular(70))
            ),
            child: studentAttendenceModel == null  ? Center(child: CircularProgressIndicator(),) : studentAttendenceModel!.data == null ? Center(child: Text("No data to show"),) :  Column(
              children: [
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width,

                          child: Text("Date",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'Lora'),)),
                    ),
                    Expanded(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text("Pick up",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'Lora'),)),
                    ),
                    Expanded(
                      child: Container(
                          width: MediaQuery.of(context).size.width,

                          child: Text("Drop time",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'Lora'),)),
                    ),
                    Expanded(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Text("Status",textAlign: TextAlign.end,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'Lora'),)),
                    ),
                  ],
                ),
                ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10),
                    shrinkWrap: true,
                    itemCount:  studentAttendenceModel!.data!.length,
                    physics: ScrollPhysics(),
                    itemBuilder: (c,i){
                      return Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${studentAttendenceModel!.data![i].date}"),
                            Text("${studentAttendenceModel!.data![i].pickupTime}"),
                            Text("${studentAttendenceModel!.data![i].dropTime}"),
                            studentAttendenceModel!.data![i].status == "1" ? Text("Present",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w500,fontSize: 15,fontFamily: 'Lora'),) :  Text("Absent",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize: 15,fontFamily: 'Lora'),)
                          ],
                        ),
                      );
                    }),
              ],
            )
        ),
      ),
    );
  }
}
