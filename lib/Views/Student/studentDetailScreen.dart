import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:job_dekho_app/Model/studentAttendenceModel.dart';
import 'package:job_dekho_app/Model/studentModel.dart';
import 'package:job_dekho_app/Utils/api_path.dart';
import 'package:job_dekho_app/Views/Student/StudentAttendenceList.dart';
import 'package:job_dekho_app/Views/Student/trackChild.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/color.dart';

class StudentDetailScreen extends StatefulWidget {
 final Data? studentModel;
 StudentDetailScreen({this.studentModel});

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {

  Position? position;
  String? selectedTime;
  String picUpTime = '';
  String dropTime = '';
  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    print("lati" + position!.latitude.toString());
    print("longi" + position!.longitude.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    Future.delayed(Duration(milliseconds: 300),(){
      return getGaurdianDetail();
    });
    Future.delayed(Duration(milliseconds: 300),(){
      return getStudentAttendence();
    });
  }

  getCurrentTime(){
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate =  DateFormat.jm().format(DateTime.now());
    //"${dateParse.hour}:${dateParse.minute}:${dateParse.second}";

    setState(() {
      picUpTime = formattedDate.toString() ;

    });
  }
  
  var glat,glong,dlat,dlong;
  getGaurdianDetail()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString('userid');
    var headers = {
      'Cookie': 'ci_session=055b59d73b5b89adf30482e59e4eb111b23c7f4f'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}get_gaurdians_details1'));
    request.fields.addAll({
      'id': '${userid}'
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResult);
        
      print("checking final response here ${jsonResponse['data'][0]['latitude']}");

      setState(() {
        dlat = jsonResponse['data'][0]['latitude'].toString();
        dlong = jsonResponse['data'][0]['longitude'].toString();
        glat =  jsonResponse['data'][0]['garudainlatitude'].toString();
        glong = jsonResponse['data'][0]['garudainlongitude'].toString();
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }

  StudentAttendenceModel? studentAttendenceModel;

  updateStatusParents() async {
    var headers = {
      'Cookie': 'ci_session=d0d01d1049a393600f01bb2770f88f9fe2f07697'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}update_status_student'));
    request.fields.addAll({
      'student_id':"${widget.studentModel!.studentId}",
      'status': '0',
    'pickup_time': selectedTime == "Drop Time" ? "" : '$picUpTime',
    'drop_time': selectedTime == "Drop Time" ? '$picUpTime' : '',
    });
    print("request is here ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("Update Status Driver>>>>>>>");
      var finalResult = await response.stream.bytesToString();
      print("Print Final Response Here>>>> ${finalResult}");
      final jsonResponse = json.decode(finalResult);
      setState(() {

      });
      var snackBar = SnackBar(
        content: Text('${jsonResponse['msg']}'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // Fluttertoast.showToast(msg: "${jsonResponse['msg']}");
      Navigator.pop(context);

    }
    else {
    print(response.reasonPhrase);
    }

  }

  getStudentAttendence()async{
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie': 'ci_session=54c31ecf7a2bb9e96f2231164df82ff608a86ef7'
    };
    var request = http.Request('POST', Uri.parse('${ApiPath.baseUrl}get_students_attendance_details'));
    request.bodyFields = {
      'id': '${widget.studentModel!.studentId}'
    };
    print("attendence detail ${ApiPath.baseUrl}get_students_attendance_details   and ${widget.studentModel!.id}");
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
        title: Text("Student Detail"),
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
            child:ListView(
              children: [
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${widget.studentModel!.username}".toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600,),),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Age",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                            Text("${widget.studentModel!.age} Years",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                          ],
                        ),
                        SizedBox(height: 7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("D.O.B",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                            Text("${widget.studentModel!.dob}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                          ],
                        ),
                        SizedBox(height: 7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Roll No.",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                            Text("${widget.studentModel!.rollNo}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                          ],
                        ),
                        SizedBox(height: 7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Division",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                            Text("${widget.studentModel!.division}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                          ],
                        ),
                        SizedBox(height: 7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Class",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                            Text("${widget.studentModel!.addClass}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                          ],
                        ),
                        SizedBox(height: 7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Gender",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                            Text("${widget.studentModel!.sex}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                          ],
                        ),
                        SizedBox(height: 7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Addhar No",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                            Text("${widget.studentModel!.birthNo}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                          ],
                        ),
                        SizedBox(height: 7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Blood Group",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                            Text("${widget.studentModel!.blood}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                          ],
                        ),
                        SizedBox(height: 7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Parent Occupation",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                            Text("${widget.studentModel!.occupation}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14),),
                          ],
                        ),
                        SizedBox(height: 7,),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("School Detail",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15),),
                      Divider(),
                      SizedBox(height: 12,),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(110),
                                child: Image.network("${ApiPath.imgUrl1}${widget.studentModel!.schoolImage}",fit: BoxFit.fill,)),
                          ),
                          SizedBox(width: 10,),
                          Text("${widget.studentModel!.uname}",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
                          // Text("Mobile",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),),
                          // Text("${widget.studentModel!.driverMobile}",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text("${widget.studentModel!.schoolAddress}",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),)

                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Driver Detail",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15),),
                      SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Name",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),),
                          Text("${widget.studentModel!.driverName}",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),)
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Mobile",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),),
                          Text("${widget.studentModel!.driverMobile}",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),)
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Email",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),),
                          Text("${widget.studentModel!.driverEmail}",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),)
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                    InkWell(
                  onTap: (){
                   if(dlong == null || dlong == "" || dlat == null || dlat == ""){
                     Fluttertoast.showToast(msg: "Driver location is not available");
                   }
                   else{
                     Future.delayed(Duration(milliseconds: 500),(){
                       return  Navigator.push(context, MaterialPageRoute(builder: (context) => OrderTrackingPage(position: position!,glat: glat,glong: glong,dlat: dlat,dlong: dlong,)));
                     });
                   }
                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width/2.5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(7)
                    ),
                    child: Text("Track your child",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(height: 10,),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.center,
                  // width: size.width,
                  // height: size.height,
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all()
                              ),
                              child:   DropdownButton(
                                value: selectedTime,
                                // Down Arrow Icon
                                underline: Container(),
                                hint: Text("Select Time"),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                isExpanded: true,
                                // Array list of items
                                items: ['Pickup Time','Drop Time'].map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedTime = newValue!;
                                  });
                                },
                              ),
                            ),

                            picUpTime == "" ? SizedBox.shrink() :  selectedTime == "Drop Time" ? SizedBox.shrink() :   Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("PickUp Time", style: TextStyle(fontSize: 15)),
                                Text("$picUpTime",style: TextStyle(fontSize: 15)),
                              ],
                            ),
                            SizedBox(height: 8,),
                            selectedTime == "Drop Time" ?  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Drop Time",style: TextStyle(fontSize: 15)),
                                Text("$picUpTime",style: TextStyle(fontSize: 15)),
                              ],
                            ) : SizedBox.shrink(),
                            SizedBox(height: 14,),
                            InkWell(
                              onTap: (){
                                if(selectedTime == "" || selectedTime == null){

                                }
                                else{
                                  getCurrentTime();
                                }
                              },
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width/2,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                  color: primaryColor,
                                ),
                                child: Text("Get Time",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
                              ),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     ElevatedButton(
                            //       style: ElevatedButton.styleFrom(
                            //         primary: primaryColor,
                            //         textStyle: const TextStyle(
                            //             color: Colors.white,
                            //             fontSize: 10,
                            //             fontStyle: FontStyle.normal),
                            //       ),
                            //       onPressed: getCurrentTime,
                            //       child: Text('PickUp Time', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                            //     ),
                            //     MaterialButton(
                            //       color: primaryColor,
                            //
                            //       // style: ElevatedButton.styleFrom(
                            //       //   primary: primaryColor,
                            //       //   textStyle: const TextStyle(
                            //       //       color: Colors.white,
                            //       //       fontSize: 10,
                            //       //       fontStyle: FontStyle.normal),
                            //       // ),
                            //       onPressed: picUpTime == "" ?  null : getCurrentTime1,
                            //       child: Text('Drop Time', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,color: Colors.white)),
                            //     ),
                            //   ],
                            // ),
                            ///////////////////
                            // DropdownButton(
                            //   // underline:
                            //   underline:Container(),
                            //   // elevation: 14,
                            //   // dropdownColor: Colors.white,
                            //   value: dropdownvalue,
                            //   icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF5B2187),),
                            //   items: items.map((String items) {
                            //     return
                            //       DropdownMenuItem(
                            //       value: items,
                            //       child: Text(items),
                            //     );
                            //   }).toList(),
                            //   // After selecting the desired option,it will
                            //   // change button value to selected value
                            //   onChanged: (String? newValue) {
                            //     setState(() {
                            //       dropdownvalue = newValue!;
                            //     });
                            //   },),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                InkWell(
                  onTap: (){
                    updateStatusParents();
                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width/2.5,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500,fontFamily: 'Lora'),),
                  ),
                ),
                SizedBox(height:20),
                studentAttendenceModel == null ? Center(child: CircularProgressIndicator(),)
                    : studentAttendenceModel!.data == null ? Center(child: Text("No data to show",style: TextStyle(fontFamily: 'Lora'),),) :
                Column(
                  children: [
                    Text("Child Attendance History",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18,fontFamily: 'Lora'),),
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
                    SizedBox(height: 12,),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount:  studentAttendenceModel!.data!.length > 2 ? 2 : studentAttendenceModel!.data!.length,
                        physics: ScrollPhysics(),
                        itemBuilder: (c,i){
                          return Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${studentAttendenceModel!.data![i].date}",style: TextStyle(fontFamily: 'Lora'),),
                                Text("${studentAttendenceModel!.data![i].pickupTime}",style: TextStyle(fontFamily: 'Lora'),),
                                Text("${studentAttendenceModel!.data![i].dropTime}",style: TextStyle(fontFamily: 'Lora'),),
                                studentAttendenceModel!.data![i].status == "1" ? Text("Present",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w500,fontSize: 15,fontFamily: 'Lora'),) :  Text("Absent",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize: 15,fontFamily: 'Lora'),)
                              ],
                            ),
                          );
                        }),
                    SizedBox(height: 20,),
                    studentAttendenceModel!.data!.length  > 2 ?    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => StudentAttendenceList(studentId: widget.studentModel!.id.toString(),)));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        height:45,
                        width: MediaQuery.of(context).size.width/2,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text("View All History",style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600,fontFamily: 'Lora'),),
                      ),
                    ) : SizedBox.shrink(),
                  ],
                ),



              ],
            )
        ),
      ),
    );
  }
}
