// To parse this JSON data, do
//
//     final getDistanceFeeResponse = getDistanceFeeResponseFromJson(jsonString);

import 'dart:convert';

GetDistanceFeeResponse getDistanceFeeResponseFromJson(String str) => GetDistanceFeeResponse.fromJson(json.decode(str));

String getDistanceFeeResponseToJson(GetDistanceFeeResponse data) => json.encode(data.toJson());

class GetDistanceFeeResponse {
  GetDistanceFeeResponse({
    this.status,
    this.message,
    this.amount,
  });

  bool? status;
  String? message;
  List<Amount>? amount;

  factory GetDistanceFeeResponse.fromJson(Map<String, dynamic> json) => GetDistanceFeeResponse(
    status: json["status"],
    message: json["message"],
    amount: List<Amount>.from(json["amount"].map((x) => Amount.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "amount": List<dynamic>.from(amount!.map((x) => x.toJson())),
  };
}

class Amount {
  Amount({
    this.feeId,
    this.minAmount,
    this.maxAmount,
    this.amount,
    this.feeCharge,
    this.dateTime,
  });

  String? feeId;
  String? minAmount;
  String? maxAmount;
  String? amount;
  String? feeCharge;
  DateTime? dateTime;

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
    feeId: json["fee_id"],
    minAmount: json["min_amount"],
    maxAmount: json["max_amount"],
    amount: json["amount"],
    feeCharge: json["fee_charge"],
    dateTime: DateTime.parse(json["date_time"]),
  );

  Map<String, dynamic> toJson() => {
    "fee_id": feeId,
    "min_amount": minAmount,
    "max_amount": maxAmount,
    "amount": amount,
    "fee_charge": feeCharge,
    "date_time": "${dateTime?.year.toString().padLeft(4, '0')}-${dateTime?.month.toString().padLeft(2, '0')}-${dateTime?.day.toString().padLeft(2, '0')}",
  };
}
