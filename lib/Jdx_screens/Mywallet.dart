
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:job_dekho_app/Jdx_screens/parceldetailsscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/AddMoneyModel.dart';
import '../Model/WalletHistoryModel.dart';
import '../Utils/api_path.dart';
import '../Utils/color.dart';
import 'AddAmountwallet.dart';
import 'notification_Screen.dart';
import 'package:http/http.dart'as http;

class MyWallet extends StatefulWidget {
  const MyWallet({Key? key}) : super(key: key);

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {

  TextEditingController amountController = TextEditingController();

  WalletHistoryModel? walletHistorymodel;

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
        walletHistorymodel = jsonResponse;
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    walletHistroy();

    super.initState();
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
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: whiteColor, size: 20),
          //Icon(Icons.arrow_back_ios, color: whiteColor, size: 22),
        ),
        title:  Text('My Wallet', style: TextStyle(color: whiteColor, fontSize: 18, fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding:  const EdgeInsets.only(right: 10),
            child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen()));
                },
                child: const Icon(Icons.notifications,color: Colors.white,)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Center(child: Text("Available Balance",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
              Text("₹ ${walletHistorymodel?.wallet?? '---'}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
             const SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  if (_formKey.currentState!.validate()) {
                    //walletHistroy();
                    Get.to(AddAmount(walletBalance: walletHistorymodel?.wallet??'--',))?.then((value) => walletHistroy() );
                  }
                  // addMoney();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                  height: 40,
                  width: MediaQuery.of(context).size.width/2.5,
                  child: Center(
                      child: Text(
                        "Add Money",
                        style: TextStyle(color: whiteColor,fontSize: 15),
                      ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
               Align(
                alignment: Alignment.topLeft,
                  child: Row(children: [
                    Icon(Icons.account_balance_wallet, color: primaryColor,),
                    const SizedBox(width: 10,),
                    const Text("WalletHistory",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  ],),),
              walletHistorymodel?.data == null ? Center(child: CircularProgressIndicator(color: splashcolor,),) : walletHistorymodel?.data?.isEmpty ?? true ?
              const Text("Not Available",): ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: walletHistorymodel?.data?.length,
                itemBuilder: (context, index) {
                var item = walletHistorymodel?.data?[index];
                return Card(
                  elevation: 2.0,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amount: ${item?.amount}',
                          style: const TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          'Payment Type: ${item?.paymentType}',
                          style: const TextStyle(fontSize: 14.0),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          'Status: ${item?.status}',
                          style: const TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Date : ${item?.createDt}',
                              style: const TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },)
            ],
          ),
        ),
      ),
    );
  }
}
