import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/TextFields/customDetailTextField.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/TextFields/customDropDownTextField.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/TextFields/customTextField.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customCheckBox.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customTextButton.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Jdx_screens/MyProfile.dart';
import '../Utils/color.dart';

class UpdateJobPostScreen extends StatefulWidget {
  const UpdateJobPostScreen({Key? key}) : super(key: key);

  @override
  State<UpdateJobPostScreen> createState() => _UpdateJobPostScreenState();
}

class _UpdateJobPostScreenState extends State<UpdateJobPostScreen> {
  bool checked = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: primaryColor,
        appBar: AppBar(
          leading: Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
          elevation: 0,
          backgroundColor: primaryColor,
          title: Text('Post Job',style: TextStyle(fontFamily: 'Lora'),),
          centerTitle: true,
        ),
          body: SingleChildScrollView(
            child: Container(
              width: size.width,
              height: size.height / 0.66,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(80))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  CustomDropDownTextField(labelText: 'Job type', buttonHintText: 'Job Type'),
                  CustomDropDownTextField(labelText: 'Designation', buttonHintText: 'Designation'),
                  CustomDropDownTextField(labelText: 'Qualification', buttonHintText: 'Qualification'),
                  CustomDropDownTextField(labelText: 'Location', buttonHintText: 'Location'),
                  CustomDropDownTextField(labelText: 'Passing Year', buttonHintText: '2017'),
                  CustomDropDownTextField(labelText: 'Expeirence', buttonHintText: 'Fresher'),
                  //CustomTextField(labelText: 'Salary Range',hintText: 'Salary Range',),
                  CustomDropDownTextField(labelText: 'Number of Vacancies', buttonHintText: '3'),
                  CustomDropDownTextField(labelText: "Job Role", buttonHintText: "Android Developer"),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomCheckBox(checkboxText: 'Written Text',boolValue: checked,),
                          CustomCheckBox(checkboxText: 'Group Discussion',boolValue: checked,),
                        ],
                      ),
                    ],
                  ),
                  CustomDetailTextField(labelText: "Job Description", maxLines: 4, labelColor: greyColor,),
                  SizedBox(height: 40,),
                  CustomTextButton(buttonText: "Update", onTap: (){Get.to(DrawerScreen());},)
                ],
              ),
            ),
          ),
    ));
  }
}
