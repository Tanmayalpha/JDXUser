import 'package:flutter/material.dart';
import 'package:job_dekho_app/Utils/color.dart';

class CustomNotificaitonTile extends StatelessWidget {
  final String username;
  final String time;
  const CustomNotificaitonTile({Key? key, required this.username, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15,),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          width: 350,
          height: 110,
          child: Column(
            children: [
              Row(
                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                children: [
                  Text(username, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Text(time, style: TextStyle(color: greyColor2,fontSize: 12, fontWeight: FontWeight.bold),),
                ],
              ),
              Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
            ],
          ),
        ),
    );
  }
}
