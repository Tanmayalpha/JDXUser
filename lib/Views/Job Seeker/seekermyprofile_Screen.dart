import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/TextFields/customDropDownTextField.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/TextFields/customTextFormField.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customButtonWithIcon.dart';
import 'package:job_dekho_app/Jdx_screens/MyProfile.dart';
import 'package:job_dekho_app/Views/Recruiter/searchcandidate_Screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../Utils/CustomWidgets/customTextButton.dart';
import '../../Utils/color.dart';
import '../updatejobpost_Screen.dart';
import 'seekerdrawer_Screen.dart';

class SeekerProfileDetailScreen extends StatefulWidget {
  const SeekerProfileDetailScreen({Key? key}) : super(key: key);

  @override
  State<SeekerProfileDetailScreen> createState() => _SeekerProfileDetailScreenState();
}

class _SeekerProfileDetailScreenState extends State<SeekerProfileDetailScreen> {
  String? gender;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.to(SeekerDrawerScreen());
          },
          child: Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
        title: Text('My Profile'),
        centerTitle: true,
      ),
      // backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(90),),
            color: profileBg,
          ),
          alignment: Alignment.center,
          width: size.width,
          height: size.height / 0.35,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("  Job Portal: Take Image From", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,fontFamily: 'Lora')),
                              ListTile(leading: Image.asset('assets/ProfileAssets/cameraicon.png', scale: 1.5,),
                                title: Text('Camera', style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Lora')),
                              ),
                              ListTile(leading: Image.asset('assets/ProfileAssets/galleryicon.png', scale: 1.5,),
                                title: Text('Gallery', style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Lora')),
                              ),
                              ListTile(leading: Image.asset('assets/ProfileAssets/cancelicon.png', scale: 1.5,),
                                title: Text('Cancel',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Lora')),
                              )
                            ],
                          ),
                        );
                      });
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: whiteColor
                        ),
                        child: Image.asset('assets/ProfileAssets/sampleprofile.png'),
                      ),
                      Positioned(
                        bottom: 20,
                        right: 10,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                          ),
                          child: Image.asset('assets/ProfileAssets/camera_Icon.png', scale: 1.8,),
                        ),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Currently looking for a Job", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: primaryColor,fontFamily: 'Lora'),),
                  ToggleSwitch(
                    minWidth: 50,
                    minHeight: 30,
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
              SizedBox(height: 10,),
              Text("Personal Details", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor,fontFamily: 'Lora'),),
              SizedBox(height: 10,),
              CustomTextFormField(label: "First Name*", labelColor: greyColor2,),
              CustomTextFormField(label: "Last Name*", labelColor: greyColor2,),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("Gender", style: TextStyle(fontSize: 16, color: Colors.grey,fontFamily: 'Lora'),),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text("Male", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor,fontFamily: 'Lora'),),
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
                  Text("FeMale", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor,fontFamily: 'Lora'),),
                ],
              ),
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
              const CustomDropDownTextField(labelText: "Current Job Role*", buttonHintText: "Job Role"),
              const CustomDropDownTextField(labelText: "Job Role*", buttonHintText: "Job Role"),
              CustomTextFormField(label: "Key Skills*", labelColor: greyColor2,),
              CustomTextFormField(label: "Percentage/CGPA*", labelColor: greyColor2,),
              const CustomDropDownTextField(labelText: "Work Experience*", buttonHintText: "Work Experience"),
              const CustomDropDownTextField(labelText: "Specialization*", buttonHintText: "Specilization"),
              const CustomDropDownTextField(labelText: "Notice Period*", buttonHintText: "Select"),
              const Text("Upload Resume (DOCX/PDF)", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,fontFamily: 'Lora'),),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.center,
                child: CustomTextButton(buttonText: "Update",
                  // onTap: (){Get.to(UpdateJobPostScreen());
                  // },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
