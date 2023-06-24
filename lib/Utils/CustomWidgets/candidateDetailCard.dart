import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customButton.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Views/Recruiter/recruiterprofiledetails_Screen.dart';
import '../color.dart';

class CandidateDetailCard extends StatelessWidget {
  const CandidateDetailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(40),
          child: Container(
            width: 360,
            height: 200,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(40)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   CircleAvatar(
                     radius: 32,
                     child: Image.asset('assets/candidateImage.png', scale: 2,),
                   ),
                   SizedBox(width: 05,),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Seeker Id: 77", style: TextStyle(fontWeight: FontWeight.bold),),
                       Text("Seeker Name: Rahulraj Singh", style: TextStyle(fontWeight: FontWeight.bold),),
                       SizedBox(height: 10,),
                       Row(
                         children: [
                           Image.asset('assets/AuthAssets/Icon ionic-ios-call.png', color: primaryColor, scale: 1.5,),
                           SizedBox(width: 15,),
                           Text("9773939666", style: TextStyle(color: greyColor2),),
                         ],
                       ),
                       SizedBox(height: 05,),
                       Row(
                         children: [
                           Image.asset('assets/AuthAssets/Icon material-email.png', color: primaryColor, scale: 1.5,),
                           SizedBox(width: 15,),
                           Text("Meera@gmail.com", style: TextStyle(color: greyColor2),),
                         ],
                       ),


                     ],
                   ),
                 ],
               ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(buttonText: "Details", onTap: (){Get.to(RecruiterProfileDetailScreen());}),
                    CustomButton(buttonText: "Call", onTap: (){}),
                  ],
                )

              ]
            )
          ),
        ),
    );
  }
}

// Column(
// children: [
// Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// CircleAvatar(
// radius: 32,
// child: Image.asset('assets/candidateImage.png', scale: 2,),
// ),
// SizedBox(width: 8,),
// Column(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// SizedBox(height: 05,),
// Text("Seeker Id: 77", style: TextStyle(fontWeight: FontWeight.bold),),
// Text("Seeker Name: Rahulraj Singh", style: TextStyle(fontWeight: FontWeight.bold),),
// ],
// )
// ],
// ),
// Column(
// children: [
// Row(
// children: [
// Image.asset('assets/AuthAssets/Icon ionic-ios-call.png', color: primaryColor, scale: 1.5,),
// SizedBox(width: 15,),
// Text("9773939666", style: TextStyle(color: greyColor2),),
// ],
// ),
// SizedBox(height: 05,),
// Row(
// children: [
// Image.asset('assets/AuthAssets/Icon material-email.png', color: primaryColor, scale: 1.5,),
// SizedBox(width: 15,),
// Text("Meera@gmail.com", style: TextStyle(color: greyColor2),),
// ],
// ),
// ],
// ),
// SizedBox(height: 10,),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// CustomButton(buttonText: "Details", onTap: (){}),
// CustomButton(buttonText: "Call", onTap: (){}),
// ],
// )
//
// ],
// ),


