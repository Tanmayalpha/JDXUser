import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/color.dart';
import 'Dashbord.dart';
import 'RegisterParcel.dart';
import 'notification_Screen.dart';

class EditeRecipentCart extends StatefulWidget {
  const EditeRecipentCart({Key? key}) : super(key: key);

  @override
  State<EditeRecipentCart> createState() => _EditeRecipentCartState();
}

class _EditeRecipentCartState extends State<EditeRecipentCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryColor,
        leading: GestureDetector(
          onTap: (){
            Get.to(MyStatefulWidget());
          },
          child: Icon(Icons.arrow_back, color: whiteColor, size: 20),
          //Icon(Icons.arrow_back_ios, color: whiteColor, size: 22),
        ),
        title:  Text('Recipient Details', style: TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'Lora'),),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                },
                child: Icon(Icons.notifications,color: Colors.white,)),
          ),
        ],
      ),
      body:SingleChildScrollView(
        // child:  parcelDetailsModel == null || parcelDetailsModel == "" ? Center(child: CircularProgressIndicator(),) :
      child:  Form(
          child: Container(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),

                ///recipentdetails
                SizedBox(height: 20,),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text("Recipient Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Material(
                        color: splashcolor,

                        elevation: 1,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 60,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Cant Empty';
                              }
                              return null;
                            },
                            // controller: recipientNameController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none
                              ),
                              hintText: "Recipient Name",
                              prefixIcon: Image.asset('assets/AuthAssets/Icon awesome-user.png', scale: 2.1, color: primaryColor,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Material(
                        color: splashcolor,
                        elevation: 1,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 60,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Cant Empty';
                              }
                              return null;
                            },
                            // controller: recipientMobileController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintText: "Recipient Mobile No.",
                              prefixIcon: Image.asset('assets/AuthAssets/Icon ionic-ios-call.png', scale: 2.1, color: primaryColor,),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20,),

                      Material(
                          color: splashcolor,
                          elevation: 1,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 80,
                              child:  TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Cant Empty';
                                    }
                                    return null;
                                  },
                                  // controller: receiverfulladdressCtr,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: "flat number,floor,building name,etc",
                                    prefixIcon: Image.asset('assets/ProfileAssets/locationIcon.png', scale: 1.7, color: primaryColor,
                                    ),
                                  )))),
                    ],),
                ),
                ///parceldetails
                SizedBox(height: 20,),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text("Parcel Details ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
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
                              // AutofillHints.orderid,
                              "  192",
                              "  10",
                              " 100 ",
                              " 502 ",
                              " 201 ",
                              " 100 ",
                            ],
                            // label: "order ID ",
                            onChanged: print,
                            //show selected item
                            selectedItem: "160",
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
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
                            // label: "order ID ",
                            onChanged: print,
                            //show selected item
                            selectedItem: "160",
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      InkWell(
                          onTap: (){
                            // parcelDetails();
                            Get.to(RegistParcelScreen());
                          },
                          child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width/1.2,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Secondry
                            ),
                            child: Text("Save Details",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14,),),
                          )),

                    ],),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
