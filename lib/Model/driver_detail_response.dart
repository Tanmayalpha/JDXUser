// To parse this JSON data, do
//
//     final driverDetailResponse = driverDetailResponseFromJson(jsonString);

import 'dart:convert';

DriverDetailResponse driverDetailResponseFromJson(String str) => DriverDetailResponse.fromJson(json.decode(str));

String driverDetailResponseToJson(DriverDetailResponse data) => json.encode(data.toJson());

class DriverDetailResponse {
  DriverDetailResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<DriverDetailDataList>? data;

  factory DriverDetailResponse.fromJson(Map<String, dynamic> json) => DriverDetailResponse(
    status: json["status"],
    message: json["message"],
    data: List<DriverDetailDataList>.from(json["data"].map((x) => DriverDetailDataList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DriverDetailDataList {
  DriverDetailDataList({
    this.userId,
    this.parcelId,
    this.userFullname,
  });

  String? userId;
  String? parcelId;
  String? userFullname;

  factory DriverDetailDataList.fromJson(Map<String, dynamic> json) => DriverDetailDataList(
    userId: json["user_id"],
    parcelId: json["parcel_id"],
    userFullname: json["user_fullname"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "parcel_id": parcelId,
    "user_fullname": userFullname,
  };
}
