import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/AddMoneyModel.dart';
import '../Utils/api_path.dart';
import '../Utils/color.dart';
import 'Mywallet.dart';
import 'notification_Screen.dart';
import 'package:http/http.dart' as http;

class AddAmount extends StatefulWidget {
  const AddAmount({Key? key, this.walletBalance}) : super(key: key);
  final String? walletBalance;
  @override
  State<AddAmount> createState() => _AddAmountState();
}

class _AddAmountState extends State<AddAmount> {
  TextEditingController amountCtr = TextEditingController();
  late Razorpay _razorpay;
  AddMoneyModel? Addwallet;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  onSuccessAddMoney() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userid = preferences.getString('userid');

    var headers = {
      'Content-Type': 'text/plain',
      'Cookie': 'ci_session=a73a943cc72f7a14a48f171f18226dddd0e6a0ec'
    };
    var request = http.Request(
        'POST', Uri.parse('${ApiPath.baseUrl}Payment/add_money_to_wallet'));
    request.body = json.encode({
      "user_id": userid.toString(),
      "amount": amountCtr.text,
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    print('__________${request.body}_____________');
    print('__________${response.statusCode}_____________');

    if (response.statusCode == 200) {
      print('User Id Is Here>>>>>>>>>${userid}');
      var finalResult = await response.stream.bytesToString();
      final jsonResponse = AddMoneyModel.fromJson(json.decode(finalResult));
      setState(() {
        Addwallet = jsonResponse;
      });

      Navigator.pop(context);
      // Fluttertoast.showToast(msg: '${jsonResponse['message']}');
    } else {
      print(response.reasonPhrase);
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: primaryColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: whiteColor, size: 20),
          //Icon(Icons.arrow_back_ios, color: whiteColor, size: 22),
        ),
        title: Text(
          'Add Amount',
          style: TextStyle(
              color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold),
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                  child: Text(
                "Add money to wallet",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              )),
              Text(
                "Available Balance",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Text(
                widget.walletBalance ?? '---',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                    controller: amountCtr,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Amount",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    openCheckout();
                    // Get.to(ParceldetailsScreen());
                  }
                  // Get.to(AddAmount());
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                  height: 40,
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Center(
                      child: Text(
                    "Proceed",
                    style: TextStyle(color: whiteColor, fontSize: 15),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openCheckout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? phone = '9074305952';
    int amt = int.parse(amountCtr.text);

    print('${email}_______________');
    print('${phone}_______________');
    print('${amt}_______________');

    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': amt * 100,
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
    onSuccessAddMoney();

    Fluttertoast.showToast(
        msg: "Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoardScreen()));
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
