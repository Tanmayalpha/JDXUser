import 'package:flutter/material.dart';

import '../color.dart';

class CustomButton extends StatelessWidget {

  final String buttonText;
  final VoidCallback? onTap;
  const CustomButton({Key? key, required this.buttonText, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        child:Container(
          width: 120,
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(
                color: primaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
          ),
          child: Text(buttonText, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: primaryColor),),
        ),
      ),
    );
  }
}
