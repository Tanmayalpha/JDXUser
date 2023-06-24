import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/color.dart';

class CustomDropDownTextField extends StatelessWidget {
  final String labelText;
  final String buttonHintText;
  const CustomDropDownTextField({Key? key, required this.labelText, required this.buttonHintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText, style: TextStyle(fontWeight: FontWeight.bold, color: greyColor1),),
          DropDownTextField(
              textFieldDecoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                    width: 2
                  )
                ),
                hintText: buttonHintText,
                hintStyle: TextStyle(fontWeight: FontWeight.bold, color: greyColor)
              ),
              dropDownList: [
                DropDownValueModel(name: 'name1', value: "value1"),
                DropDownValueModel(
                    name: 'name2',
                    value: "value2",
                    toolTipMsg:
                    "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                DropDownValueModel(name: 'name3', value: "value3"),
              ])

        ],
      ),

    );
  }
}
