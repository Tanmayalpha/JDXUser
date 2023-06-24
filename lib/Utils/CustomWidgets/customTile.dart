import 'package:flutter/material.dart';


class CustomTile extends StatelessWidget {
  final String labelText;
  final Widget imageIcon;
  const CustomTile({Key? key, required this.labelText, required this.imageIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          imageIcon,
          SizedBox(width: 15,),
          Text(labelText, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, ),)
        ],
      ),
    );
  }
}
