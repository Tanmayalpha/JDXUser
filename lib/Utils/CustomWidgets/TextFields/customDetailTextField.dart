import 'package:flutter/material.dart';
import '../../color.dart';

class CustomDetailTextField extends StatelessWidget {
  final String labelText;
  final Color? labelColor;
  final int maxLines;
  final TextEditingController? fieldController;
  final TextInputType? keyboardType;
  const CustomDetailTextField({Key? key, required this.labelText, this.labelColor, required this.maxLines, this.fieldController, this.keyboardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(labelText, style: TextStyle(color: labelColor,fontSize: 15, fontWeight: FontWeight.bold),),
            SizedBox(height: 8,),
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(15),
              child: TextFormField(
                maxLines: maxLines,
                controller: fieldController,
                textInputAction: TextInputAction.next,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none
                    //borderSide: BorderSide(width: 3,color: Colors.black)
                  ) ,
                  focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),borderSide: BorderSide(
                      width: 2,
                      color: primaryColor
                  )
                  ) ,
                ),
              ),
            )
          ],


        ),
      ),
    );
  }
}
