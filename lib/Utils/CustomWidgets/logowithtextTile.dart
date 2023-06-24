import 'package:flutter/material.dart';

class LogoWithText extends StatelessWidget {
  final Widget imageIcon;
  final String labelText;
  const LogoWithText({Key? key, required this.imageIcon, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      child: Row(
        children: [
          imageIcon,
          SizedBox(width: 20,),
          Text(labelText, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, ),)
        ],
      ),
    );
  }
}
