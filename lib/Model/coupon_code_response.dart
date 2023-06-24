// To parse this JSON data, do
//
//     final couponCodeResponse = couponCodeResponseFromJson(jsonString);

import 'dart:convert';

CouponCodeResponse couponCodeResponseFromJson(String str) => CouponCodeResponse.fromJson(json.decode(str));

String couponCodeResponseToJson(CouponCodeResponse data) => json.encode(data.toJson());

class CouponCodeResponse {
  CouponCodeResponse({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<CouponCodeDataList>? data;

  factory CouponCodeResponse.fromJson(Map<String, dynamic> json) => CouponCodeResponse(
    status: json["status"],
    message: json["message"],
    data: List<CouponCodeDataList>.from(json["data"].map((x) => CouponCodeDataList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CouponCodeDataList {
  CouponCodeDataList({
    this.id,
    this.couponName,
    this.couponDescription,
    this.couponCode,
    this.validFrom,
    this.validTo,
    this.validityType,
    this.productName,
    this.discountType,
    this.discountValue,
    this.cartValue,
    this.usesRestriction,
    this.isApplied,
  });

  String? id;
  String? couponName;
  String? couponDescription;
  String? couponCode;
  DateTime? validFrom;
  DateTime? validTo;
  String? validityType;
  String? productName;
  String? discountType;
  String? discountValue;
  String? cartValue;
  String? usesRestriction;
  String? isApplied;

  factory CouponCodeDataList.fromJson(Map<String, dynamic> json) => CouponCodeDataList(
    id: json["id"],
    couponName: json["coupon_name"],
    couponDescription: json["coupon_description"],
    couponCode: json["coupon_code"],
    validFrom: DateTime.parse(json["valid_from"]),
    validTo: DateTime.parse(json["valid_to"]),
    validityType: json["validity_type"],
    productName: json["product_name"],
    discountType: json["discount_type"],
    discountValue: json["discount_value"],
    cartValue: json["cart_value"],
    usesRestriction: json["uses_restriction"],
    isApplied: json["is_applied"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "coupon_name": couponName,
    "coupon_description": couponDescription,
    "coupon_code": couponCode,
    "valid_from": "${validFrom?.year.toString().padLeft(4, '0')}-${validFrom?.month.toString().padLeft(2, '0')}-${validFrom?.day.toString().padLeft(2, '0')}",
    "valid_to": "${validTo?.year.toString().padLeft(4, '0')}-${validTo?.month.toString().padLeft(2, '0')}-${validTo?.day.toString().padLeft(2, '0')}",
    "validity_type": validityType,
    "product_name": productName,
    "discount_type": discountType,
    "discount_value": discountValue,
    "cart_value": cartValue,
    "uses_restriction": usesRestriction,
    "is_applied": isApplied,
  };
}
