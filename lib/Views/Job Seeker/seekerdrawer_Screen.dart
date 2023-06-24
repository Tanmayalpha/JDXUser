import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customDrawerTile.dart';
import 'package:job_dekho_app/Utils/color.dart';
import 'package:get/get.dart';
import 'package:job_dekho_app/Views/Job%20Seeker/seekermyprofile_Screen.dart';
import 'package:job_dekho_app/Views/Recruiter/appliedjobs_Screens.dart';
import 'package:job_dekho_app/Jdx_screens/changepassword_Screen.dart';
import 'package:job_dekho_app/Jdx_screens/contactus_Screen.dart';
import 'package:job_dekho_app/Views/Recruiter/recruitermyprofile_Screen.dart';
import 'package:job_dekho_app/Jdx_screens/notification_Screen.dart';
import 'package:job_dekho_app/Views/updatejobpost_Screen.dart';
import 'package:job_dekho_app/Jdx_screens/privacypolicy_Screen.dart';
import 'package:job_dekho_app/Views/Recruiter/searchcandidate_Screen.dart';
import 'package:job_dekho_app/Jdx_screens/termsandcondition_Screen.dart';
import 'package:job_dekho_app/Views/Recruiter/postJob_Screen.dart';
import '../../Utils/iconUrl.dart';

class SeekerDrawerScreen extends StatefulWidget {
  const SeekerDrawerScreen({Key? key}) : super(key: key);

  @override
  State<SeekerDrawerScreen> createState() => _SeekerDrawerScreenState();
}

class _SeekerDrawerScreenState extends State<SeekerDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              color: primaryColor,
              child: Image.asset('assets/egate_logo.png', scale: 2,),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.2,
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(90))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomDrawerTile(tileName: 'My Profile', tileIcon: Image.asset(profileIconJ, scale: 1.3,),onTap: (){Get.to(SeekerProfileDetailScreen());},),
                  CustomDrawerTile(tileName: 'My Jobs', tileIcon: Image.asset(myjobIconJ, scale: 1.3,),),
                  CustomDrawerTile(tileName: 'Applied Jobs', tileIcon: Image.asset(appliedjobIconJ, scale: 1.3,),onTap: (){Get.to(AppliedJobsScreen());},),
                  CustomDrawerTile(tileName: 'Change Password', tileIcon: Image.asset(changepasswordIconJ, scale: 1.3,), onTap: (){Get.to(ChangePasswordScreen());},),
                  CustomDrawerTile(tileName: 'All Recruiters', tileIcon: Image.asset(allrecruiterIconJ,color: primaryColor,scale: 1.3,),onTap: (){Get.to(SearchCandidateScreen());},),
                  CustomDrawerTile(tileName: 'Notification', tileIcon: Image.asset(notificationIconJ, scale: 1.3,),onTap: (){Get.to(NotificationScreen());}),
                  CustomDrawerTile(tileName: 'Share App', tileIcon: Image.asset(shareappIconJ, scale: 1.3,),),
                  CustomDrawerTile(tileName: 'Contact Us', tileIcon: Image.asset(contactusIconJ, scale: 1.3,), onTap: (){Get.to(ContactUsScreen());},),
                  CustomDrawerTile(tileName: 'Privacy Policy', tileIcon: Image.asset(privactpolicyIconJ, scale: 1.3,), onTap: (){Get.to(PrivacyPolicyScreen());},),
                  CustomDrawerTile(tileName: 'Support & Help', tileIcon: Image.asset(supportandhelpJ, scale: 1.3,), onTap: (){Get.to(PrivacyPolicyScreen());},),
                  CustomDrawerTile(tileName: 'Terms & Conditions', tileIcon: Image.asset(termsandconditionIconJ, scale: 1.3,),onTap: (){Get.to(TermsAndConditionScreen());},),
                  CustomDrawerTile(tileName: 'Log Out', tileIcon: Image.asset(signoutIconJ, scale: 1.3,),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));;


    //   SafeArea(child: Scaffold(
    //     backgroundColor: primaryColor,
    //     body: SingleChildScrollView(
    //       child: Column(
    //         children: [
    //           Container(
    //             width: MediaQuery.of(context).size.width,
    //             height: 120,
    //             color: primaryColor,
    //             child: Image.asset('assets/egate_logo.png', scale: 2,),
    //           ),
    //           Container(
    //             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    //             width: MediaQuery.of(context).size.width,
    //             height: MediaQuery.of(context).size.height / 1.2,
    //             decoration: BoxDecoration(
    //                 color: whiteColor,
    //                 borderRadius: BorderRadius.only(topRight: Radius.circular(90))
    //             ),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //               children: [
    //                 CustomDrawerTile(tileName: 'My Profile', tileIcon: Image.asset(profileIconJ, scale: 1.3,),onTap: (){Get.to(RecruiterMyProfileScreen());},),
    //                 //CustomDrawerTile(tileName: 'My Jobs', tileIcon: Image.asset(postjobIcon, scale: 1.3,),onTap: (){Get.to(ViewPostJobScreen());}),
    //                 //CustomDrawerTile(tileName: 'Applied Jobs', tileIcon: Image.asset(appliedIcon, scale: 1.3,),onTap: (){Get.to(AppliedJobsScreen());},),
    //                 CustomDrawerTile(tileName: 'Change Password', tileIcon: Image.asset(changepasswordIconJ, scale: 1.3,), onTap: (){Get.to(ChangePasswordScreen());},),
    //                 //CustomDrawerTile(tileName: 'All Recruiters', tileIcon: Image.asset(searchIcon,color: primaryColor,scale: 1.3,),onTap: (){Get.to(SearchCandidateScreen());},),
    //                 CustomDrawerTile(tileName: 'Notification', tileIcon: Image.asset(notificationIconJ, scale: 1.3,),onTap: (){Get.to(NotificationScreen());}),
    //                 CustomDrawerTile(tileName: 'Share App', tileIcon: Image.asset(shareappIconJ, scale: 1.3,),),
    //                 CustomDrawerTile(tileName: 'Contact Us', tileIcon: Image.asset(contactusIconJ, scale: 1.3,), onTap: (){Get.to(ContactUsScreen());},),
    //                 CustomDrawerTile(tileName: 'Privacy Policy', tileIcon: Image.asset(privactpolicyIconJ, scale: 1.3,), onTap: (){Get.to(PrivacyPolicyScreen());},),
    //                 //CustomDrawerTile(tileName: 'Support & Help', tileIcon: Image.asset(privactpolicyIconH, scale: 1.3,), onTap: (){Get.to(PrivacyPolicyScreen());},),
    //                 CustomDrawerTile(tileName: 'Terms & Conditions', tileIcon: Image.asset(termsandconditionIconJ, scale: 1.3,),onTap: (){Get.to(TermsAndConditionScreen());},),
    //                 CustomDrawerTile(tileName: 'Sign Out', tileIcon: Image.asset(signoutIconJ, scale: 1.3,),),
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     )
    // ));;
  }
}
