import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Views/Recruiter/recruitermyprofile_Screen.dart';
import 'package:job_dekho_app/Views/accountcreated_Screen.dart';
import 'package:job_dekho_app/Jdx_screens/signin_Screen.dart';

import '../../Jdx_screens/signup_Screen.dart';
import '../ApiModel/ShowDetailsModel.dart';
import '../ApiModel/SignUpModel.dart';
import '../api_path.dart';
import '../color.dart';
// import 'TextFormFields/authTextFormField.dart';
import 'package:http/http.dart' as http;
import 'customTextButton.dart';

class JobSeekerTab extends StatefulWidget {
  final String? driverId;
  final String? schId;
  final String? parentId;
  JobSeekerTab({this.driverId, this.schId, this.parentId});
  // const JobSeekerTab({Key? key}) : super(key: key);

  @override
  State<JobSeekerTab> createState() => _JobSeekerTabState();
}

class _JobSeekerTabState extends State<JobSeekerTab> {
  String? genderType;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController emergencyController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController dateofbirthaController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController rollnoController = TextEditingController();
  TextEditingController bloodgController = TextEditingController();
  TextEditingController devisionController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController parentsController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController birthcertificateController = TextEditingController();

  
  final _formKey = GlobalKey<FormState>();


  Data? detailsModel;

  registerUser() async {
    print("Register User Api>>>>>>");
    var headers = {
      'Cookie': 'ci_session=922f5c650083c77ae33c78aca232c748038bffe8'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}add_student'));
    request.fields.addAll({
      'name': '${nameController.text}',
      'dob': '${dateofbirthaController.text}',
      'age': '${ageController.text}',
      'add_class': '${classController.text}',
      'religion': '${religionController.text}',
      'driver_id': '${widget.driverId}',
      'school_id': '${widget.schId}',
      'relation': '${parentsController.text}',
      'occupation': '${occupationController.text}',
      'sex': "${genderController.text}",
      'parent_id': '${widget.parentId}',
      'birth_no': '${birthcertificateController.text}',
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print("Working Api Here>>>>>");
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = SignUpModel.fromJson(json.decode(finalResponse));
      // Fluttertoast.showToast(msg: "All field is req");
      // print("final response here ${jsonResponse}");
      setState(() {
        print("final response is here>>>>> ${jsonResponse.data.toString()}");
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> RecruiterMyProfileScreen()));
    }
    else {
      // Fluttertoast.showToast(msg: "${jsonResponse['message']}");
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 60,
                child: TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Name",
                  ),
                ),
              ),
            ),
            SizedBox(height: 12,),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 60,
                child: TextFormField(
                  controller: classController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your class';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Class",
                  ),
                ),
              ),
            ),
            SizedBox(height: 12,),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 60,
                child: TextFormField(
                  controller: devisionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Devision';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Devision",
                  ),
                ),
              ),
            ),
            SizedBox(height: 12,),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 60,
                child: TextFormField(
                  controller: mobileController,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  validator: validateMobile,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Mobile No.",
                    counterText: ''
                  ),
                ),
              ),
            ),
            SizedBox(height: 12,),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 60,
                child: TextFormField(
                  controller: religionController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter religion';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Religion",
                  ),
                ),
              ),
            ),
            SizedBox(height: 12,),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 60,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  // maxLength: 10,
                  controller: emergencyController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter emergancy no';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Emergancy No.",
                  ),
                ),
              ),
            ),
            SizedBox(height: 12,),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 60,
                child: TextFormField(
                  controller: rollnoController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your roll no';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Roll No.",
                  ),
                ),
              ),
            ),
            SizedBox(height: 12,),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 60,
                child: TextFormField(
                  controller: ageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Age",
                  ),
                ),
              ),
            ),
            SizedBox(height: 12,),
            // Text('Gender', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: greyColor1),),
            // Material(
            //   elevation: 10,
            //   borderRadius: BorderRadius.circular(10),
            //   child: Container(
            //     width: MediaQuery.of(context).size.width / 1.3,
            //     height: 60,
            //     child: TextFormField(
            //       controller: genderController,
            //       validator: (value) {
            //         if (value == null || value.isEmpty) {
            //           return 'Please enter your gender';
            //         }
            //         return null;
            //       },
            //       decoration: const InputDecoration(
            //         border: OutlineInputBorder(
            //           borderSide: BorderSide.none,
            //         ),
            //         hintText: "Gender",
            //       ),
            //     ),
            //   ),
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Gender", style: TextStyle(fontSize: 17,)),
            ],),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Radio(
                      activeColor: primaryColor,
                      // title: Text("Male"),
                      value: "Male",
                      groupValue: genderType,
                      onChanged: (value){
                        setState(() {
                          genderType = value.toString();
                        });
                      },
                    ),
                    Text("Male", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor),)
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      activeColor: primaryColor,
                      // title: Text("Female"),
                      value: "Female",
                      groupValue: genderType,
                      onChanged: (value){
                        setState(() {
                          genderType = value.toString();
                        }
                        );
                      },
                    ),
                    Text("Female", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12,),
            Material(
              elevation: 10,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  IconButton(onPressed: () {selectDate(context);}, icon: Icon(Icons.calendar_month)),
                ],
                ),
                // child: TextFormField(
                //   controller: dateofbirthaController,
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(
                //       borderSide: BorderSide.none,
                //     ),
                //     hintText: "Date Of Birth",
                //     // suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.calendar_month)),
                //     suffixIcon: Icon(Icons.calendar_month,)
                //   ),
                // ),
              ),
            ),
            SizedBox(height: 12,),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 60,
                child: TextFormField(
                  controller: parentsController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter parents ralation';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Parents Relation",
                  ),
                ),
              ),
            ),
            SizedBox(height: 12,),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 60,
                child: TextFormField(
                  controller: occupationController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter parents occupation';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Parents Occupation",
                  ),
                ),
              ),
            ),
            SizedBox(height: 12,),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 60,
                child: TextFormField(
                  controller: bloodgController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter blood group';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Blood Group",
                  ),
                ),
              ),
            ),
            SizedBox(height: 12,),
            Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 60,
                child: TextFormField(
                  controller: birthcertificateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter birth certificate no.';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Birth Certificate No.",
                  ),
                ),
              ),
            ),
            // AuthTextFormField(iconImage: Image.asset('assets/AuthAssets/Icon awesome-user.png', scale: 1.3, color: primaryColor,),hintText: "Name",),
            // AuthTextFormField(iconImage: Image.asset('assets/AuthAssets/Icon ionic-ios-lock.png', scale: 1.3, color: primaryColor,),hintText: "Class", ),
            // AuthTextFormField(iconImage: Image.asset('assets/AuthAssets/Icon ionic-ios-lock.png', scale: 1.3, color: primaryColor,),hintText: "Devision",),
            // AuthTextFormField(iconImage: Image.asset('assets/AuthAssets/Icon material-email.png', scale: 1.3, color: primaryColor,),hintText: "Mobile No.",),
            // AuthTextFormField(iconImage: Image.asset('assets/AuthAssets/Icon ionic-ios-call.png', scale: 1.3, color: primaryColor,),hintText: "Religion",),
            // AuthTextFormField(iconImage: Image.asset('assets/AuthAssets/Icon ionic-ios-call.png', scale: 1.3, color: primaryColor,),hintText: "Emergency No.",),
            // AuthTextFormField(iconImage: Image.asset('assets/AuthAssets/Icon ionic-ios-lock.png', scale: 1.3, color: primaryColor,),hintText: "Roll No.",),
            // AuthTextFormField(iconImage: Image.asset('assets/AuthAssets/Icon material-email.png', scale: 1.3, color: primaryColor,),hintText: "Age",),
            // AuthTextFormField(iconImage: Image.asset('assets/AuthAssets/Icon material-email.png', scale: 1.3, color: primaryColor,),hintText: "Gender",),
            // AuthTextFormField(iconImage: Image.asset('assets/AuthAssets/Icon material-email.png', scale: 1.3, color: primaryColor,),hintText: "Date Of Birth",),
            // AuthTextFormField(iconImage: Image.asset('assets/AuthAssets/Icon material-email.png', scale: 1.3, color: primaryColor,),hintText: "Parents Relation",),
            // AuthTextFormField(iconImage: Image.asset('assets/AuthAssets/Icon material-email.png', scale: 1.3, color: primaryColor,),hintText: "Parents Occupation",),
            // AuthTextFormField(iconImage: Image.asset('assets/AuthAssets/Icon material-email.png', scale: 1.3, color: primaryColor,),hintText: "Blood Group",),
            // AuthTextFormField(iconImage: Image.asset('assets/AuthAssets/Icon material-email.png', scale: 1.3, color: primaryColor,),hintText: "Birth Certificate No.",),
            SizedBox(height: 30,),
            CustomTextButton(buttonText: 'Submit',
              onTap: (){
              if (_formKey.currentState!.validate())
              Get.to(registerUser());},
              // onTap: (){
              //   if(_formKey.currentState!.validate()){
              //     Navigator.pop(context,{
              //       'name': nameController.text,
              //       'email': emailController.text,
              //       'mobile': mobileController.text,
              //
              //       // 'city': cityController.text,
              //       // 'query': queryController.text
              //
              //     });
              //     Get.to(registerUser());
              //   }
              //   else{
              //     Fluttertoast.showToast(msg: "All Fields are required");
              //   }
              //
              // },
            ),
            // SizedBox(height: 20,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text("I already have an account! ", style: TextStyle(color: greyColor,fontWeight: FontWeight.bold),),
            //     GestureDetector(onTap: (){Get.to(SignInScreen());},child: Text("Log In", style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),))
            //   ],
            // )
          ],
        ),
      ),
    );
  }


  DateTime startDate = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day);
  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2100),
      builder: (context, child) {
        // print("this is current date ${dateInput.toString()}");
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              // primary: primary, // <-- SEE HERE
              // onPrimary: Colors.redAccent, // <-- SEE HERE
              // onSurface: Colors.blueAccent, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                // primary: primary, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },

    );
    if (pickedDate != null) {
      print(pickedDate);
      //pickedDate output format => 2021-03-10 00:00:00.000
      // String formattedDate =
      // DateFormat('yyyy-MM-dd').format(pickedDate);
      // print(
      //     formattedDate); //formatted date output using intl package =>  2021-03-16
      setState(() {
        // dateInput.text =
        //     formattedDate; //set output date to TextField value.
      });
    } else {}
  }
}


  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!))
      return 'Enter Valid Email';
    else
      return null;
  }
  String? validateMobile(String? value) {
    if (value!.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

