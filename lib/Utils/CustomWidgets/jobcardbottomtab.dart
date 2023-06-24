import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customTapButton.dart';

import '../color.dart';

class JobCardBottomTile extends StatelessWidget {
  final VoidCallback? editOnTap;
  final VoidCallback? deleteOnTap;
  final VoidCallback? shareOnTap;
  final VoidCallback? viewOnTap;
  
  const JobCardBottomTile({Key? key, this.editOnTap, this.deleteOnTap, this.shareOnTap, this.viewOnTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: editOnTap,
            child: Image.asset('assets/ProfileAssets/editIcon.png',scale: 1.2,),
          ),
          // Container(
          //     width: 34,
          //     height: 34,
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(10)
          //     ),
          //     child: Image.asset('assets/ProfileAssets/editIcon.png',scale: 1.2,),
          // ),
          GestureDetector(
            onTap: deleteOnTap,
            child: Image.asset('assets/DrawerAssets/deleteIcon.png', scale: 1.2,),
          ),
          // Container(
          //     width: 34,
          //     height: 34,
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(10)
          //     ),
          //     child: Image.asset('assets/DrawerAssets/deleteIcon.png', scale: 1.2,)
          // ),
          GestureDetector(
            onTap: shareOnTap,
            child: Image.asset('assets/DrawerAssets/shareappIcon.png', scale: 1.2,),
          ),
          // Container(
          //     width: 34,
          //     height: 34,
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(10)
          //     ),
          //     child: Image.asset('assets/DrawerAssets/shareappIcon.png', scale: 1.2,)
          // ),
          GestureDetector(
            onTap: viewOnTap,
            child: Container(
              width: 80,
              height: 35,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryColor
              ),
              child: Text("View", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),),
            )
            //CustomTapButton(),
          )
        ],
      ),
    );
  }
}
