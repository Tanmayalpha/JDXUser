import 'package:flutter/material.dart';

import '../../color.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;

  const CustomTextField({Key? key, required this.labelText, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText, style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: greyColor1),),
          TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontWeight: FontWeight.bold, color: greyColor),
              focusedBorder: UnderlineInputBorder(
                borderSide:BorderSide(
                  color: primaryColor,
                  width: 2
                )
              )
            ),
          )
        ],
      ),

    );
  }
}
