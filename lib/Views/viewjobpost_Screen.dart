import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Views/Recruiter/postJob_Screen.dart';

import '../Utils/CustomWidgets/TextFields/customDetailTextField.dart';
import '../Utils/CustomWidgets/TextFields/customDropDownTextField.dart';
import '../Utils/CustomWidgets/TextFields/customTextField.dart';
import '../Utils/CustomWidgets/customCheckBox.dart';
import '../Utils/CustomWidgets/customTextButton.dart';
import '../Utils/color.dart';
import '../Jdx_screens/MyProfile.dart';

class ViewJobPostScreen extends StatefulWidget {
  const ViewJobPostScreen({Key? key}) : super(key: key);

  @override
  State<ViewJobPostScreen> createState() => _ViewJobPostScreenState();
}

class _ViewJobPostScreenState extends State<ViewJobPostScreen> {

  bool checked = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: primaryColor,
            leading: GestureDetector(
              onTap: (){
                Get.to(PostJobScreen());
              },
              child: Icon(Icons.arrow_back_ios, color: whiteColor, size: 20),
              //Icon(Icons.arrow_back_ios, color: whiteColor, size: 22),
            ),
            title:  Text('Post Job', style: TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'Lora'),),

          ),
          body: SingleChildScrollView(
            child: Container(
              width: size.width,
              height: size.height / 0.7,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(80))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 15,),
                  CustomTextField(labelText: "Job Type", hintText: "Job Type"),
                  CustomTextField(labelText: "Designation", hintText: "Desgination"),
                  CustomTextField(labelText: "Qualification", hintText: "Qualification"),
                  CustomTextField(labelText: "Location", hintText: "Location"),
                  CustomTextField(labelText: "Passing Year", hintText: "2017"),
                  CustomTextField(labelText: "Experience", hintText: "Fresher"),
                  CustomTextField(labelText: 'Salary Range',hintText: 'Salary Range',),
                  CustomTextField(labelText: 'Enter number of vacancies',hintText: '3',),
                  CustomTextField(labelText: 'Job Role',hintText: 'Android Developer',),
                  CustomTextField(labelText: 'Last Date of application',hintText: '30/12/2022',),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Hiring Process", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: greyColor1),),
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomCheckBox(checkboxText: 'Face to Face',boolValue: checked,),
                          CustomCheckBox(checkboxText: 'HR Round',boolValue: checked,),
                        ],
                      ),
                      Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomCheckBox(checkboxText: 'Written Text',boolValue: checked,),
                          CustomCheckBox(checkboxText: 'Group Discussion',boolValue: checked,),
                        ],
                      ),
                    ],
                  ),
                  CustomDetailTextField(labelText: "Job Description", maxLines: 4, labelColor: greyColor,),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        ));
  }
}
