import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:job_dekho_app/Model/driver_detail_response.dart';
import 'package:job_dekho_app/Model/order_detail_response.dart';
import 'package:job_dekho_app/Services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/api_path.dart';
import '../Utils/color.dart';
import 'MyProfile.dart';
import 'notification_Screen.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key,this.driverName, this.driverId,this.parcelId}) : super(key: key, );

  final String? driverName, driverId, parcelId;

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  String? ratings ;

Api api = Api();


var selectedItem;


List <OrderDetailDataList> orderDetailData = [];
List <DriverDetailDataList> driverDetailList = [];


final reviewController   = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
  //  getOrderDetail();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back),
          // child: Image.asset('assets/ProfileAssets/menu_icon.png', scale: 1.6,),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
        title: const Text("Driver Feedback",style: TextStyle(fontFamily: 'Lora'),),
        centerTitle: true,
        // actions: [
        //   Padding(
        //     padding:  EdgeInsets.only(right: 10),
        //     child: InkWell(
        //         onTap: (){
        //           Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
        //         },
        //         child: Icon(Icons.notifications,color: Colors.white,)),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*Center(
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 40,
                      child: DropdownButton(
                          underline: Container(),

                        icon: const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Icon(Icons.keyboard_arrow_down,
                              color: Color(0xFFBF2331)),
                        ),
                        hint: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text("Select Order Id"),
                        ),
                        //mode of dropdown
                        //to show search box
                        // showSearchBox: true,
                        //list of dropdown items
                        items: orderDetailData.map((items) {
                          return DropdownMenuItem(
                            value: items.orderId.toString(),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                                child: Text(items.orderId.toString())),
                          );
                        }).toList(),
                        isExpanded: true,

                        value: selectedItem,
                        onChanged:(newValue){
                          setState(() {
                            selectedItem  = newValue ;
                            getDriverDetail(selectedItem.toString());
                          });
                        },
                        //show selected item
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                ],),
            ),*/
            SizedBox(height: 50,),
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(children: [
                Text("Parcel ID : "),
                Text(widget.parcelId.toString())
              ],),

            ),
            Padding(
                padding: EdgeInsets.all(8.0),
              child: Row(children: [
                Text("Driver Name : "),
                 Text(widget.driverName.toString())
              ],),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                    ratings = rating.toString() ;
                  },),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: splashcolor,
                    ),
                    width: MediaQuery.of(context).size.width/1.1,
                    height: 150,
                    child:  TextField(
                      controller: reviewController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Add Review",
                      ),),),
                ),
                const SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    feedback();

                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor,
                    ),
                    height: 40,
                    width: MediaQuery.of(context).size.width/2.5,
                    child: Center(child: Text("Add Review",style: TextStyle(color: whiteColor,fontSize: 15),)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void getOrderDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString('userid');

    try {
      Map<String, String> body = {};
      body['user_id'] = userid ?? '';
      var res = await api.getOrderDetailData(body);
      if (res.status ?? false) {
        print('_____success____');
        // responseData = res.data?.userid.toString();
        orderDetailData = res.data ?? [];
        setState(() {});
      } else {
        Fluttertoast.showToast(msg: '');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Invalid Email & Password");
    } finally {}
  }

  void getDriverDetail(String order_id) async {

    try {
      Map<String, String> body = {};
      body['order_id'] = order_id ;
      var res = await api.getDriverDetailData(body);
      if (res.status ?? false) {
        print('_____success____');
        // responseData = res.data?.userid.toString();
        driverDetailList = res.data ?? [];
        setState(() {});
      } else {
        Fluttertoast.showToast(msg: res.message ?? '');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Invalid Email & Password");
    } finally {}
  }

  feedback() async{

   /* if(selectedItem == null ){
      Fluttertoast.showToast(msg: 'please Select an order id ');
    }else if(ratings == null ){
      Fluttertoast.showToast(msg: 'please give star ratings ');
    }else if(reviewController.text.isEmpty){
      Fluttertoast.showToast(msg: 'please add review in Text Field  ');
    }else if(driverDetailList.isEmpty){
      Fluttertoast.showToast(msg: "Parcel id can't be empty"  );
    } else{*/
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userid = prefs.getString('userid');
      var headers = {
        'Cookie': 'ci_session=2b3a4313604d71cb336c5de783a5eacb4c306145'
      };
      var request = http.MultipartRequest(
          'POST', Uri.parse('${ApiPath.baseUrl}Payment/delivery_boy_feedback'));
      request.fields.addAll({
        'delivery_boy_id': widget.driverId ?? '',
        'user_id': userid.toString(),
        'rating': ratings ?? '',
        'comments': reviewController.text,
        'parcel_id': widget.parcelId ?? ''
      });

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: 'Review Updated');
        Navigator.pop(context);
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }

  }

}
