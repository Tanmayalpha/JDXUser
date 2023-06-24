import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/TextFields/customDetailTextField.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customTextButton.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/TextFields/customTextFormField.dart';
import 'package:job_dekho_app/Utils/color.dart';
import 'package:job_dekho_app/Jdx_screens/MyProfile.dart';
import 'package:job_dekho_app/Views/updatejobpost_Screen.dart';

class RecruiterMyProfileScreen extends StatefulWidget {
  const RecruiterMyProfileScreen({Key? key}) : super(key: key);

  @override
  State<RecruiterMyProfileScreen> createState() => _RecruiterMyProfileScreenState();
}

class _RecruiterMyProfileScreenState extends State<RecruiterMyProfileScreen> {
  
  String? profileType;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: (){
                Get.to(DrawerScreen());
              },
              child: Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
            ),
            elevation: 0,
            backgroundColor: primaryColor,
            title: Text('Home',style: TextStyle(fontFamily: 'Lora'),),
            centerTitle: true,
          ),
          backgroundColor: primaryColor,
          body: SingleChildScrollView(
            child: Container(
              width: size.width,
              height: size.height / 0.61,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: profileBg,
                borderRadius: BorderRadius.only(topRight: Radius.circular(70), topLeft: Radius.circular(70)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
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
                                  ),
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
                                    shape: BoxShape.circle,
                                ),
                                child: Image.asset('assets/ProfileAssets/camera_Icon.png', scale: 1.8,),
                              ),),
                        ],
                      ),
                    ),
                  ),
                  // Text('I Am ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: greyColor1),),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //    Row(
                  //      children: [
                  //        Radio(
                  //          activeColor: primaryColor,
                  //          // title: Text("Male"),
                  //          value: "employee",
                  //          groupValue: profileType,
                  //          onChanged: (value){
                  //            setState(() {
                  //              profileType = value.toString();
                  //            });
                  //          },
                  //        ),
                  //        Text("An Employee", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor),),
                  //      ],
                  //    ),
                  //     Row(
                  //       children: [
                  //         Radio(
                  //           activeColor: primaryColor,
                  //           // title: Text("Female"),
                  //           value: "consultant",
                  //           groupValue: profileType,
                  //           onChanged: (value){
                  //             setState(() {
                  //               profileType = value.toString();
                  //             }
                  //             );
                  //           },
                  //         ),
                  //         Text("A Consultant", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: primaryColor),),
                  //       ],
                  //     )
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Row(
                  //       children: [
                  //         Radio(value: 0, groupValue: _value, onChanged: (value){}),
                  //         Text('An Employer', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold ),),
                  //       ],
                  //     ),
                  //     Row(
                  //       children: [
                  //         Radio(value: 1, groupValue: _value1, onChanged: (value1){}),
                  //         Text('A Consultant', style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold ),),
                  //       ],
                  //     )
                  //   ],
                  // ),
                  CustomTextFormField(label: 'Company Name', labelColor: greyColor),
                  CustomTextFormField(label: 'Name', labelColor: greyColor),
                  CustomTextFormField(label: 'Email', labelColor: greyColor),
                  CustomTextFormField(label: 'Mobile', labelColor: greyColor),
                  CustomTextFormField(label: 'Location', labelColor: greyColor),
                  CustomTextFormField(label: 'Address', labelColor: greyColor),
                  CustomTextFormField(label: 'Website Address', labelColor: greyColor),
                  CustomDetailTextField(labelText: "Write A Short Desciption Of Your\nCompany Which Will Show In Your Profile*", maxLines: 4, labelColor: greyColor,),
                  SizedBox(height: 30,),
                  Align(
                    alignment: Alignment.center,
                    child: CustomTextButton(buttonText: "Update", onTap: (){Get.to(UpdateJobPostScreen());},),
                  ),
                  SizedBox(height: 50,)
                ],
              ),
            ),
          ),
    ));
  }
}
