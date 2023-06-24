import 'package:flutter/material.dart';
import '../color.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;
  const CustomTextButton({Key? key, required this.buttonText, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width / 2.2,
          height: 45,
          alignment: Alignment.center,
          //padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: Secondry,
              borderRadius: BorderRadius.circular(20)
          ),
          child: Text(buttonText, style: buttonTextStyle,),
        ),
      ),
    );
  }
}
