// To parse this JSON data, do
//
//     final getDriverRating = getDriverRatingFromJson(jsonString);

import 'dart:convert';

GetDriverRating getDriverRatingFromJson(String str) => GetDriverRating.fromJson(json.decode(str));

String getDriverRatingToJson(GetDriverRating data) => json.encode(data.toJson());

class GetDriverRating {
  GetDriverRating({
    required this.status,
    required this.message,
    required this.rating,
  });

  bool status;
  String message;
  String rating;

  factory GetDriverRating.fromJson(Map<String, dynamic> json) => GetDriverRating(
    status: json["status"],
    message: json["message"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "rating": rating,
  };
}
