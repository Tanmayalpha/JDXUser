import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:job_dekho_app/Model/SubscriptionModel.dart';
import 'package:job_dekho_app/Model/myPlanModel.dart';
import 'package:job_dekho_app/Utils/api_path.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'notification_Screen.dart';
import '../Utils/color.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {

  SubscriptionModel? subscriptionModell;
  late Razorpay _razorpay;

  MyPlanModel? myPlanModel;
  mySubscription()async{
    myIds.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString('userid');
    var headers = {
      'Cookie': 'ci_session=389aea2e859d277e722d83d012e6f41185f47fe3'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}my_plans'));
    request.fields.addAll({
      'user_id': '${userid}'
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();
      final jsonResponse = MyPlanModel.fromJson(json.decode(finalResult));
      setState(() {
        myPlanModel = jsonResponse;
      });
      for(var i=0;i<myPlanModel!.data!.length;i++){
        myIds.add(myPlanModel!.data![i].planId.toString());
      }
    }
    else {
      print(response.reasonPhrase);
    }

  }

  getSubscription()async{
    var headers = {
      'Cookie': 'ci_session=f5ece1a56385f7735996717955e89dbf8dea6263'
    };
    var request = http.Request('GET', Uri.parse('${ApiPath.baseUrl}get_plans'));
    request.bodyFields = {};
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = SubscriptionModel.fromJson(json.decode(finalResponse));
      setState(() {
        subscriptionModell = jsonResponse;
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }


  List<String> myIds = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    Future.delayed(Duration(milliseconds: 300),(){
      return getSubscription();
    });
    Future.delayed(Duration(milliseconds: 300),(){
      return mySubscription();
    });
  }

  int? pricerazorpayy;

  var totalValue;
  void openCheckout(int price) async {
      pricerazorpayy =price * 100;
    print("checking razorpay price ${pricerazorpayy.toString()}");

    var options = {
      'key': 'rzp_test_1spO8LVd5ENWfO',
      'amount': '$pricerazorpayy',
      'name': 'E-Gate',
      'description': 'E-Gate',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Erroroooooooooooo: e');
    }
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print("this is not working here");
    purchasePlan();
    // RazorpayDetailApi();
    // Order_cash_ondelivery();
   // placeOrder();
    // Fluttertoast.showToast(
    //     msg: "Successful",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.green,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => DashBoardScreen()));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Fluttertoast.showToast(
    //     msg: "ERROR: " + response.code.toString() + " - " + response.message!,
    //     toastLength: Toast.LENGTH_SHORT);
    Fluttertoast.showToast(
        msg: "Payment cancelled by user",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  String? planId;
  purchasePlan()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userid = prefs.getString('userid');
    var headers = {
      'Cookie': 'ci_session=cf8cc8509224f5c3f763ab4e93cbbe6eb0ccd49e'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}purchase_plan'));
    request.fields.addAll({
      'user_id': '${userid}',
      'plan_id': '${planId}',
      'transaction_id': 'fdgdgdgfdgdg'
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse =  json.decode(finalResponse);
      setState(() {
      });
      var snackBar = SnackBar(
        content: Text('${jsonResponse['msg']}'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop();
    }
    else {
      print(response.reasonPhrase);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryColor,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: whiteColor, size: 20),
          //Icon(Icons.arrow_back_ios, color: whiteColor, size: 22),
        ),
        title:  Text('My Wallet', style: TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                },
                child: Icon(Icons.notifications,color: Colors.white,)),
          )
        ],
      ),
      body:  SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 18,horizontal: 14),
            height: MediaQuery.of(context).size.height/1.1,
            decoration : BoxDecoration(
                color: Color(0xffF9F9F9),
                borderRadius: BorderRadius.only(topRight: Radius.circular(0))
            ),
            child:subscriptionModell == null  ? Center(child: CircularProgressIndicator(),) : subscriptionModell!.data == null  ? Center(child: Text("No data to show",style: TextStyle(fontFamily: 'Lora'),),) : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 14,vertical: 15),
              shrinkWrap: true,
                itemCount: subscriptionModell!.data!.length,
                itemBuilder: (c,i){
                print("kyoosdsfsfsfsfs ${myIds.length}");
              return InkWell(
                onTap: (){
                  if(myIds.length >=1){
                    Fluttertoast.showToast(msg: "Current Plan is Actice");
                  }else {
                    setState(() {
                      planId = subscriptionModell!.data![i].id.toString();
                    });
                    if (subscriptionModell!.data![i].price == 0 ||
                        subscriptionModell!.data![i].price == "0") {
                      purchasePlan();
                    }
                    else {
                      openCheckout(int.parse(subscriptionModell!.data![i].price
                          .toString()));
                    }
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      color:  myIds.contains(subscriptionModell!.data![i].id) ? primaryColor : Colors.transparent,
                      width: 2
                    )
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${subscriptionModell!.data![i].title}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16,fontFamily: 'Lora'),),
                          myIds.contains(subscriptionModell!.data![i].id) ?  Text("ACTIVE",style: TextStyle(color: primaryColor,fontSize: 15,fontWeight: FontWeight.w600,fontFamily: 'Lora'),) : SizedBox.shrink()
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                         Text("Price",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,fontFamily: 'Lora'),),
                          Text("\u{20B9} ${subscriptionModell!.data![i].price}",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,fontFamily: 'Lora'),)
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Duration",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,fontFamily: 'Lora'),),
                          Text("${subscriptionModell!.data![i].timeText}",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,fontFamily: 'Lora'),)
                        ],
                      )
                    ],
                  ),
                ),
              );
            })
        ),

      ),
    );
  }
}
