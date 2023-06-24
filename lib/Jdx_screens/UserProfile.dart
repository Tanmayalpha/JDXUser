import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_dekho_app/Jdx_screens/MyProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Model/getprofilemodel.dart';
import '../Model/updateprofilemodel.dart';
import '../Utils/api_path.dart';
import '../Utils/color.dart';

class UserProfile extends StatefulWidget {
  Getprofilemodel? getprofile;

  UserProfile({this.id, this.getprofile});

  final String? id;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController imagefilecontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addreessController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController distanceController = TextEditingController();
  String genders = "";
  Updateprofilemodel? update;

  var gaurdianData;

  UpDateprofile() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userid = preferences.getString('userid');
    print('This is user id===============>${userid}');
    var headers = {
      'Cookie': 'ci_session=9aba5e78ffa799cbe054723c796d2bd8f2f7d120'
    };
    var request = http.MultipartRequest('POST',
        Uri.parse('${ApiPath.baseUrl}User_Dashboard/updateUserProfile'));
    request.fields.addAll({
      'name': '${nameController.text}',
      'email': '${emailController.text}',
      'mobile': '${mobileController.text}',
      'password': '${passwordController.text}',
      'user_id': userid.toString()
    });


    request.headers.addAll(headers);

    request.files.add(await http.MultipartFile.fromPath(
        'user_image', imageFile?.path ?? ''));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      // final result = await response.stream.bytesToString();
      var userprofile = Updateprofilemodel.fromJson(jsonDecode(finalResponse));
      print("prfile===================>${Updateprofilemodel}");
      setState(() {
        update = userprofile;
      });

      Get.to(DrawerScreen());
      // Fluttertoast.showToast(msg: '${jsonResponse['message']}');
    } else {
      Fluttertoast.showToast(msg: '${update?.message ?? ''}');
      print(response.reasonPhrase);
    }
  }

  var Getuserprofile;

  var filesPath;
  String? fileName;

  // void _pickFile() async {
  //   final result = await FilePicker.platform.pickFiles(allowMultiple: false);
  //   if (result == null) return;
  //   setState(() {
  //     filesPath = result.files.first.path ?? "";
  //     fileName = result.files.first.name;
  //     // reportList.add(result.files.first.path.toString());
  //     resumeData = null;
  //   });
  //   var snackBar = SnackBar(
  //     backgroundColor: primaryColor,
  //     content: Text('Profile upload successfully',style: TextStyle(fontFamily: 'Lora'),),
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController(
        text: widget.getprofile?.data![0].userEmail.toString());
    nameController = TextEditingController(
        text: widget.getprofile?.data![0].userFullname.toString());
    mobileController = TextEditingController(
        text: widget.getprofile!.data![0].userPhone.toString());

  }

  final ImagePicker _picker = ImagePicker();
  File? imageFile;
  var profileImage;





  _getFromGallery() async {
    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        print('${imageFile}gggggg');
      });
      Navigator.pop(context);
    }
  }

  _getFromCamera() async {

    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.camera, imageQuality: 100);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      Navigator.pop(context);
    }
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Exit App',
              style: TextStyle(fontFamily: 'Lora'),
            ),
            content: Text(
              'Do you want to exit an App?',
              style: TextStyle(fontFamily: 'Lora'),
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: Text(
                  'No',
                  style: TextStyle(fontFamily: 'Lora'),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  exit(0);
                  // Navigator.pop(context,true);
                  // Navigator.pop(context,true);
                },
                //return true when click on "Yes"
                child: Text(
                  'Yes',
                  style: TextStyle(fontFamily: 'Lora'),
                ),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: profileBg,
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () async {
                  Get.back();
                },
                child: Icon(Icons.arrow_back_sharp),
              ),
              elevation: 0,
              backgroundColor: primaryColor,
              title: const Text(
                'My Profile',
                style: TextStyle(fontFamily: 'Lora'),
              ),
              centerTitle: true,
            ),
            body: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(0),
                      topLeft: Radius.circular(0)),
                  color: profileBg,
                ),
                alignment: Alignment.center,
                width: size.width,
                height: size.height / 1.2,
                child: SingleChildScrollView(
                    child:
                        // seekerProfileModel == null  || addJobDataModel == null  ? Center(child: CircularProgressIndicator(),) :
                        Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 250,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10))),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Take Image From",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    ListTile(
                                      leading: Image.asset(
                                        'assets/ProfileAssets/cameraicon.png',
                                        scale: 1.5,
                                      ),
                                      title: Text('Camera',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      onTap: () {
                                        _getFromCamera();
                                      },
                                    ),
                                    ListTile(
                                      leading: Image.asset(
                                        'assets/ProfileAssets/galleryicon.png',
                                        scale: 1.5,
                                      ),
                                      title: const Text('Gallery',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      onTap: () {
                                        _getFromGallery();
                                      },
                                    ),
                                    ListTile(
                                      leading: Image.asset(
                                        'assets/ProfileAssets/cancelicon.png',
                                        scale: 1.5,
                                      ),
                                      title: const Text('Cancel',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            imageFile == null
                                ? Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: whiteColor),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.network(
                                          "${widget.getprofile?.data?.first.userImage}",
                                          fit: BoxFit.fill,
                                        )),
                                  )
                                :  Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: whiteColor),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.file(
                                            imageFile ?? File(''),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                            Positioned(
                              bottom: 20,
                              right: 10,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Image.asset(
                                  'assets/ProfileAssets/camera_Icon.png',
                                  scale: 1.8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50,
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            // hintText: "${getprofile?.data![0].userFullname}",
                            prefixIcon: Image.asset(
                              'assets/AuthAssets/Icon awesome-user.png',
                              scale: 2.1,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50,
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            // hintText: "${getprofile?.data![0].userEmail}",
                            prefixIcon: Image.asset(
                              'assets/AuthAssets/Icon material-email.png',
                              scale: 2.1,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          readOnly: true,
                          controller: mobileController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: "Mobile No.",
                            prefixIcon: Image.asset(
                              'assets/AuthAssets/Icon ionic-ios-call.png',
                              scale: 2.1,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Material(
                    //   elevation: 10,
                    //   borderRadius: BorderRadius.circular(10),
                    //   child: Container(
                    //     width: MediaQuery.of(context).size.width / 1.2,
                    //     height: 50,
                    //     child: TextField(
                    //       controller: passwordController,
                    //       decoration: InputDecoration(
                    //         border: const OutlineInputBorder(
                    //             borderSide: BorderSide.none
                    //         ),
                    //         hintText: "password",
                    //         prefixIcon: Image.asset('assets/AuthAssets/Icon material-email.png', scale: 2.1, color: primaryColor,),
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        UpDateprofile();

                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 1.4,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Secondry),
                        child: Text(
                          "Edit And Save",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                )))));
  }
}
