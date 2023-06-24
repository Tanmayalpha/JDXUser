// To parse this JSON data, do
//
//     final getAppUrl = getAppUrlFromJson(jsonString);

import 'dart:convert';

GetAppUrl getAppUrlFromJson(String str) => GetAppUrl.fromJson(json.decode(str));

String getAppUrlToJson(GetAppUrl data) => json.encode(data.toJson());

class GetAppUrl {
  GetAppUrl({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory GetAppUrl.fromJson(Map<String, dynamic> json) => GetAppUrl(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.liveUrl,
  });

  String liveUrl;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    liveUrl: json["live_url"],
  );

  Map<String, dynamic> toJson() => {
    "live_url": liveUrl,
  };
}
