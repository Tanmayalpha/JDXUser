import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/CustomWidgets/customButton.dart';
import '../color.dart';

class CustomPlanTile extends StatelessWidget {
  final String planName;
  final String planPrice;
  final String description1;
  final String description2;
  final VoidCallback? onTap;
  const CustomPlanTile({Key? key, required this.planName, required this.planPrice, required this.description1, required this.description2, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 330,
          height: 110,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(planName, style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                  Text(planPrice, style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                  Text(description1, style: TextStyle(fontSize: 12,color: greyColor2),),
                  Text(description2, style: TextStyle(fontSize: 12,color: greyColor2),),
                ],
              ),
              GestureDetector(
                onTap: onTap,
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(10),
                  child:Container(
                    width: 70,
                    height: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: primaryColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                    ),
                    child: Text("Pay Now", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: primaryColor),),
                  ),
                ),
              )
              //CustomButton(buttonText: "Pay Now", onTap: onTap)
            ],
          ),
        ),
      ),
    );
  }
}
