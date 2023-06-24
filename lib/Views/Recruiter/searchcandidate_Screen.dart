import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/candidateDetailCard.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Jdx_screens/MyProfile.dart';
import '../../Utils/color.dart';
class SearchCandidateScreen extends StatelessWidget {
  const SearchCandidateScreen({Key? key}) : super(key: key);

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
                  Get.to(DrawerScreen());
                },
                child: Icon(Icons.arrow_back_ios, color: whiteColor, size: 20),
              ),
              title:  Text('Search Candidate', style: TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'Lora'),),
            ),
            body: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(90)),
                  color: Colors.white
              ),
              alignment: Alignment.center,
              width: size.width,
              height: size.height,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  CandidateDetailCard(),
                ],
              ),
            )
        ));
  }
}
