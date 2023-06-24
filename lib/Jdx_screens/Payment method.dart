import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:job_dekho_app/Model/WalletHistoryModel.dart';
import 'package:job_dekho_app/Views/payment_success_screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Utils/api_path.dart';
import '../Utils/color.dart';
import 'MyProfile.dart';

class PaymentMethod extends StatefulWidget {
  final orderid;
  final totalAmount;
  const PaymentMethod({Key? key, this.orderid, this.totalAmount}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {

  paymentType(String type) async{
    isLoading = true;
    setState(() {

    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userid = preferences.getString('userid');

    var headers = {
      'Cookie': 'ci_session=c2b9ec387d53f2644408cb4191cab39d16906144'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${ApiPath.baseUrl}Payment/pay_now'));
    request.fields.addAll({
      'paymenttype': type,
      'user_id': userid.toString(),
      'order_id': widget.orderid,
      'subtotal': widget.totalAmount.toString(),
    });
    print("Param ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      isLoading = false;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PaymentSuccessfulScreen(),
          ));
      Fluttertoast.showToast(msg: 'Payment Successfully ') ;
      setState(() {

      });
    }
    else {
      print(response.reasonPhrase);
    }
  }
  List<Payments> paymentTypeList = [
    Payments(type: 'Cash On Payment', image: 'assets/cod.png'),
    Payments(type: 'Online Payment', image: 'assets/online.png'),
    Payments(type: 'Wallet', image: 'assets/wallet.png'),
  ];

  bool isLoading = false ;

   @override
   void initState() {
     walletHistroy();
     _razorpay = Razorpay();
     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    super.initState();

   }

  //List<String> paymenttypelist =["Cash On Delivery", "Online Payment", "Wallet"];

  WalletHistoryModel? walletHistoryModel;


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
        title: const Text("Payment Method",style: TextStyle(fontFamily: 'Lora')),
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
          child:  Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: paymentTypeList.length,
                    itemBuilder: (c,i){
                      return Padding(
                        padding: EdgeInsets.only(bottom: 0),
                        child: InkWell(

                          onTap: (){
                            print('___________${paymentTypeList[i].type}__________');
                            final value = double.parse(walletHistoryModel?.wallet ?? '0.0') ;

                            if(paymentTypeList[i].type.toString() == "Wallet") {
                          if (value >= widget.totalAmount) {
                            paymentType(paymentTypeList[i].type ??'');

                          }else {
                            Fluttertoast.showToast(msg: " you have not enough balance in your wallet for the order");
                          }
                        }else if(paymentTypeList[i].type.toString() == "Cash On Payment"){

                              paymentType(paymentTypeList[i].type ??'');

                            }else{
                              openCheckout();
                              Fluttertoast.showToast(msg: paymentTypeList[i].type ?? 'online');
                            }



                            //
                            //
                            // Get.to(ParceldetailsScreen());
                          },
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                      backgroundImage: AssetImage(paymentTypeList[i].image?? ''),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                        paymentTypeList[i].type ?? 'null',
                                      style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w500))),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    // mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Image.asset("assets/DrawerAssets/forwardIcon.png", color: primaryColor,)
                                    ]),
                                  // Column(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                  //   children: [
                                  //     Text("Order ID",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,fontFamily: 'Lora'),),
                                  //     Text("${parcelhistory!.data![i].orderId}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16,fontFamily: 'Lora'),),
                                  //
                                  //     // Text("202",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,fontFamily: 'Lora'),),
                                  //     Text("Total Amount",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,fontFamily: 'Lora'),),
                                  //     Text("${parcelhistory!.data![i].orderAmount}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16,fontFamily: 'Lora'),),
                                  //   ],
                                  // ),
                                  // Column(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                  //   children: [
                                  //     Text("Parcel Count",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,fontFamily: 'Lora'),),
                                  //     Text("${parcelhistory!.data![i].userId}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16,fontFamily: 'Lora'),),
                                  //     Text("Order Date",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500,fontFamily: 'Lora'),),
                                  //     Text("${parcelhistory!.data![i].onDate}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16,fontFamily: 'Lora'),),
                                  //
                                  //
                                  //   ],)
                                ],
                              )))),
                      );
                    }),
                isLoading ? const Center(child: CircularProgressIndicator(),) : SizedBox()],
          )),
    );
  }

  walletHistroy() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userid = preferences.getString('userid');

    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'ci_session=fa798ca5ff74e60a6d79d768d0be8efac030321a'
    };
    var request = http.Request('POST', Uri.parse('${ApiPath.baseUrl}Payment/wallet_history'));
    request.body = json.encode({
      "user_id": userid.toString(),
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print('Userr Id@@@@@@@${userid}');
      var finalResult = await response.stream.bytesToString();
      final jsonResponse = WalletHistoryModel.fromJson(json.decode(finalResult));
      setState((){
        walletHistoryModel = jsonResponse;
        print('₹ ${walletHistoryModel?.wallet?? '---'}');
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }
  String? pricerazorpayy;
  late Razorpay _razorpay;

  void openCheckout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? phone = prefs.getString('phone');
    int amt = widget.totalAmount.toInt() ;


print('${email}_______________');
print('${phone}_______________');
print('${widget.totalAmount.toString()}_______________');
print('${amt}_______________');

      var options = {
        'key': 'rzp_test_1DP5mmOlF5G5ag',
        'amount': amt*100,
        'name': 'jdx-user',
        'description': 'jdx-user',
      "currency": "INR",
        'prefill': {'contact': '$phone', 'email': '$email'},
        'external': {
          'wallets': ['paytm']
        }
      };
      try {
        _razorpay.open(options);
      } catch (e) {
        debugPrint('Error: $e');
      }
    }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // RazorpayDetailApi();
    // Order_cash_ondelivery();
    /* advancePayment( widget.data.quotation!.id
        .toString(),
        widget.data.quotation!
            .assignmentId
            .toString(),
        response.paymentId);*/

    Fluttertoast.showToast(
        msg: "Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoardScreen()));
    paymentType('Online Payment');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Fluttertoast.showToast(
    //     msg: "ERROR: " + response.code.toString() + " - " + response.message!,
    //     toastLength: Toast.LENGTH_SHORT);

    print('${response.error}________error_________');
    print('${response.code}________code_________');
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

  }





class Payments {
  String? type, image;

  Payments({this.type, this.image});

}