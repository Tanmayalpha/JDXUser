import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/color.dart';
import 'MyProfile.dart';

class GenerateListscreen extends StatefulWidget {
  const GenerateListscreen({Key? key}) : super(key: key);

  @override
  State<GenerateListscreen> createState() => _GenerateListscreenState();
}

class _GenerateListscreenState extends State<GenerateListscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:  InkWell(
        onTap: (){
          Get.to(GenerateListscreen());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width/1.2,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Secondry
              ),
              child: Text("Generate List",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20,),),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.to(DrawerScreen());
          },
          child: Icon(Icons.arrow_back_ios),
          // child: Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
        title: Text("Support",style: TextStyle(fontFamily: 'Lora'),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("Order ID"),
          Center(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(

                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 40,
                    child: DropdownSearch<String>(
                      //mode of dropdown
                      mode: Mode.DIALOG,
                      //to show search box
                      // showSearchBox: true,
                      showSelectedItem: true,

                      //list of dropdown items
                      items: [
                        // AutofillHints.parcelid,
                        "  192",
                        "  10",
                        " 100 ",
                        " 502 ",
                        " 201 ",
                        " 100 ",
                      ],
                      label: "Parcel ID",
                      onChanged: print,
                      //show selected item
                      selectedItem: "160",
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(

                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 40,
                    child: DropdownSearch<String>(
                      //mode of dropdown
                      mode: Mode.DIALOG,
                      //to show search box
                      // showSearchBox: true,
                      showSelectedItem: true,

                      //list of dropdown items
                      items: [
                        // AutofillHints.orderid,
                        "  192",
                        "  10",
                        " 100 ",
                        " 502 ",
                        " 201 ",
                        " 100 ",

                      ],
                      label: "order ID ",

                      onChanged: print,
                      //show selected item
                      selectedItem: "160",
                    ),
                  ),
                ),
                const SizedBox(height: 30,),

              ],),
          ),

        ],
      ),

    );
  }
}
