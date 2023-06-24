import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/color.dart';

class CustomTapButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;
  final VoidCallback? buttonOnTap;
  const CustomTapButton({Key? key, required this.buttonText, required this.buttonColor, required this.buttonTextColor, this.buttonOnTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: buttonColor
      ),
      child: Text(buttonText, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: buttonTextColor),),
    );
  }
}
