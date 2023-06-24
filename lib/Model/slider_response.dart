// To parse this JSON data, do
//
//     final sliderDataResponse = sliderDataResponseFromJson(jsonString);

import 'dart:convert';

SliderDataResponse sliderDataResponseFromJson(String str) => SliderDataResponse.fromJson(json.decode(str));

String sliderDataResponseToJson(SliderDataResponse data) => json.encode(data.toJson());

class SliderDataResponse {
  SliderDataResponse({
    required this.status,
    required this.message,
    required this.amount,
  });

  bool status;
  String message;
  String amount;

  factory SliderDataResponse.fromJson(Map<String, dynamic> json) => SliderDataResponse(
    status: json["status"],
    message: json["message"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "amount": amount,
  };
}
