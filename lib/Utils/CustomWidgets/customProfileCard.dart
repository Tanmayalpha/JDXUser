import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customTapButton.dart';
import 'package:job_dekho_app/Utils/color.dart';

class CustomProfileCard extends StatelessWidget {
  final String jobId;
  final String name;
  final String mobileNumber;
  final String email;
  final VoidCallback? onTap;
  const CustomProfileCard({Key? key, required this.jobId, required this.name, required this.mobileNumber, required this.email, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(40),
        child: Container(
          width: 360,
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
         decoration: BoxDecoration(
           color: whiteColor,
           borderRadius: BorderRadius.circular(40)
         ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Job ID - " + jobId, style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold),),
                  Row(
                    children: [
                      Image.asset('assets/AuthAssets/Icon ionic-ios-call.png', color: primaryColor, scale: 1.5,),
                      SizedBox(width: 10,),
                      Text(mobileNumber, style: TextStyle(color: greyColor2),),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset('assets/AuthAssets/Icon material-email.png', color: primaryColor, scale: 1.5,),
                      SizedBox(width: 10,),
                      Text(email, style: TextStyle(color: greyColor2),),
                    ],
                  )
                ],
              ),
              GestureDetector(
                onTap: onTap,
                child: CustomTapButton(
                  buttonColor: primaryColor,
                  buttonText: "View",
                  buttonTextColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
