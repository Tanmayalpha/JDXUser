import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/color.dart';

class CustomTextFormField extends StatelessWidget {
  final bool? obsecureText;
  final String label;
  final TextEditingController? fieldcontroller;
  final TextInputType? keyboardType;
  final Color? labelColor;
  const CustomTextFormField({Key? key, required this.label, this.fieldcontroller, this.keyboardType, this.labelColor, this.obsecureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(color: labelColor,fontSize: 15, fontWeight: FontWeight.bold),),
            SizedBox(height: 8,),
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(15),
              child: TextFormField(
                controller: fieldcontroller,
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





// import 'package:flutter/material.dart';
//
// class CustomTextField extends StatelessWidget {
//   const CustomTextField({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(12),
//       child:Column(
//
//         children: [
//           Text('Email Id', textAlign: TextAlign.left,),
//           SizedBox(height: 10,),
//           TextFormField(
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(
//                         width: 1.5,
//                         color: Colors.black,
//
//                     )
//                 )
//             ),
//
//           )
//         ],
//       ),
//     );
//   }
// }
