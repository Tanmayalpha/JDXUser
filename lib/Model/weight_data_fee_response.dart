// To parse this JSON data, do
//
//     final getWeightFeeResponse = getWeightFeeResponseFromJson(jsonString);

import 'dart:convert';

GetWeightFeeResponse getWeightFeeResponseFromJson(String str) => GetWeightFeeResponse.fromJson(json.decode(str));

String getWeightFeeResponseToJson(GetWeightFeeResponse data) => json.encode(data.toJson());

class GetWeightFeeResponse {
  GetWeightFeeResponse({
    this.status,
    this.message,
    this.amount,
  });

  bool? status;
  String? message;
  List<Amount>? amount;

  factory GetWeightFeeResponse.fromJson(Map<String, dynamic> json) => GetWeightFeeResponse(
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
    this.minWeight,
    this.maxWeight,
    this.feeCharge,
    this.dateTime,
  });

  String? feeId;
  String? minWeight;
  String? maxWeight;
  String? feeCharge;
  DateTime? dateTime;

  factory Amount.fromJson(Map<String, dynamic> json) => Amount(
    feeId: json["fee_id"],
    minWeight: json["min_weight"],
    maxWeight: json["max_weight"],
    feeCharge: json["fee_charge"],
    dateTime: DateTime.parse(json["date_time"]),
  );

  Map<String, dynamic> toJson() => {
    "fee_id": feeId,
    "min_weight": minWeight,
    "max_weight": maxWeight,
    "fee_charge": feeCharge,
    "date_time": "${dateTime?.year.toString().padLeft(4, '0')}-${dateTime?.month.toString().padLeft(2, '0')}-${dateTime?.day.toString().padLeft(2, '0')}",
  };
}
