import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/TextFields/customDropDownTextField.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/TextFields/customTextFormField.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customButtonWithIcon.dart';
import 'package:job_dekho_app/Views/Recruiter/searchcandidate_Screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../Utils/color.dart';

class RecruiterProfileDetailScreen extends StatefulWidget {
  const RecruiterProfileDetailScreen({Key? key}) : super(key: key);

  @override
  State<RecruiterProfileDetailScreen> createState() => _RecruiterProfileDetailScreenState();
}

class _RecruiterProfileDetailScreenState extends State<RecruiterProfileDetailScreen> {

  var _value;
  var _value1;
  String? gender;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryColor,
        leading: GestureDetector(
          onTap: (){
            Get.to(SearchCandidateScreen());
          },
          child: Icon(Icons.arrow_back_ios, color: whiteColor, size: 20),
        ),
        title:  Text('Profile Details', style: TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'Lora'),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(90)),
              color: profileBg
          ),
          alignment: Alignment.center,
          width: size.width,
          height: size.height / 0.35,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child:  Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: whiteColor
                  ),
                  child: Image.asset('assets/ProfileAssets/sampleprofile.png'),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Currently looking for a Job", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: primaryColor,fontFamily: 'Lora'),),
                  ToggleSwitch(
                    minWidth: 60,
                    minHeight: 22,
                    cornerRadius: 20.0,
                    activeBgColors: [[primaryColor], [primaryColor]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    initialLabelIndex: 1,
                    totalSwitches: 2,
                    labels: ['No', 'Yes'],
                    radiusStyle: true,
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Text("Personal Details", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor,fontFamily: 'Lora'),),
              SizedBox(height: 20,),
              CustomTextFormField(label: "First Name*", labelColor: greyColor2,),
              CustomTextFormField(label: "Last Name*", labelColor: greyColor2,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("   Gender*", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: greyColor1),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio(
                        activeColor: primaryColor,
                        // title: Text("Male"),
                        value: "male",
                        groupValue: gender,
                        onChanged: (value){
                          setState(() {
                            gender = value.toString();
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
                        value: "female",
                        groupValue: gender,
                        onChanged: (value){
                          setState(() {
                            gender = value.toString();
                          }
                          );
                        },
                      ),
                      Text("Female", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor),),
                    ],
                  )
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Row(
              //       children: [
              //         Radio(value: 0, groupValue: _value, onChanged: (value){}),
              //         Text('Male', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold ),),
              //       ],
              //     ),
              //     Row(
              //       children: [
              //         Radio(value: 1, groupValue: _value1, onChanged: (value1){}),
              //         Text('Female', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold ),),
              //       ],
              //     )
              //   ],
              // ),
              CustomTextFormField(label: "Email*", labelColor: greyColor2,),
              CustomTextFormField(label: "Mobile*", labelColor: greyColor2,),
              CustomDropDownTextField(labelText: "Qualification*", buttonHintText: "Qualification"),
              CustomTextFormField(label: "Year of Passing*", labelColor: greyColor2,),
              CustomTextFormField(label: "Age*", labelColor: greyColor2,),
              CustomTextFormField(label: "Current Address*", labelColor: greyColor2,),
              CustomDropDownTextField(labelText: "Preferred Location", buttonHintText: "Location"),
              CustomDropDownTextField(labelText: "Current CTC*", buttonHintText: "Current CTC"),
              CustomDropDownTextField(labelText: "Expected CTC*", buttonHintText: "Expected CTC"),
              CustomDropDownTextField(labelText: "Job Type*", buttonHintText: "Job Type"),
              CustomDropDownTextField(labelText: "Designation*", buttonHintText: "Designation CTC"),
              CustomDropDownTextField(labelText: "Current Job Role*", buttonHintText: "Job Role"),
              CustomDropDownTextField(labelText: "Job Role*", buttonHintText: "Job Role"),
              CustomTextFormField(label: "Key Skills*", labelColor: greyColor2,),
              CustomTextFormField(label: "Percentage/CGPA*", labelColor: greyColor2,),
              CustomDropDownTextField(labelText: "Work Experience*", buttonHintText: "Work Experience"),
              CustomDropDownTextField(labelText: "Specialization*", buttonHintText: "Specilization"),
              CustomDropDownTextField(labelText: "Notice Period*", buttonHintText: "Select"),
              Text("Resume (DOCX/PDF)", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor),),
              SizedBox(height: 20,),
              Align(
                child: CustomButtonWithIcon(buttonText: "Download", buttonIcon: Image.asset('assets/ContactUsAssets/downloadIcon.png', color: primaryColor, scale: 1.4,)),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
