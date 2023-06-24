import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final Widget? iconImage;
  final String? hintText;
  final String? controller;
  const AuthTextField({Key? key, this.iconImage, this.hintText, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 38,
                height: 40,
                child: iconImage,
              ),
            ),
            SizedBox(width: 18,),
            Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: 48,
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none
                        ),
                        hintText: hintText
                    ),
                  ),
                ),
            ),
          ],
        ),
    );
  }
}
