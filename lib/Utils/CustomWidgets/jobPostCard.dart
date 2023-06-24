import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customTile.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/jobcardbottomtab.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Utils/iconUrl.dart';
import 'package:job_dekho_app/Views/Recruiter/postJob_Screen.dart';
import 'package:job_dekho_app/Views/updatejobpost_Screen.dart';
import 'package:job_dekho_app/Views/viewjobpost_Screen.dart';
import '../color.dart';

class JobPostCard extends StatelessWidget {
  const JobPostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 22),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(40),
        child: Container(
          padding: EdgeInsets.all(15),
          width: 350,
          height: 500,
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(40)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Job ID - 7 ", style: TextStyle(fontWeight: FontWeight.bold),),
              Text("Executitve", style: TextStyle(color: primaryColor ,fontWeight: FontWeight.bold),),
              Text('JOB DESCRIPTION:'),
              Text('Fresher with Redhat certified or course completed is also welcomed'),
              Text('Research and identify solutions to sever software and hardware issues'),
              Text('Diagnose and troubleshoot technical issues, including account setup and network'),
              CustomTile(labelText: 'Kolkata', imageIcon: Image.asset(locationIcon, scale: 1.5,)),
              CustomTile(labelText: '60,000 - 1,00,000 Per Month', imageIcon: Image.asset(ruppeeIcon, scale: 1.5,)),
              CustomTile(labelText: '7 years Experience Required', imageIcon: Image.asset(experienceIcon, scale: 1.5,)),
              SizedBox(height: 10,),
              JobCardBottomTile(
                editOnTap: (){Get.to(UpdateJobPostScreen());},
                viewOnTap: (){Get.to(ViewJobPostScreen());},)
            ],
          ),
        ),
      ),
    );
  }
}
