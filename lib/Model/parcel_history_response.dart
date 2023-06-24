// To parse this JSON data, do
//
//     final parcelhistoryModel2 = parcelhistoryModel2FromJson(jsonString);

import 'dart:convert';

ParcelhistoryModel2 parcelhistoryModel2FromJson(String str) => ParcelhistoryModel2.fromJson(json.decode(str));

String parcelhistoryModel2ToJson(ParcelhistoryModel2 data) => json.encode(data.toJson());

class ParcelhistoryModel2 {
  ParcelhistoryModel2({
    required this.status,
    required this.message,
    required this.totalRecord,
    required this.data,
  });

  bool status;
  String message;
  int totalRecord;
  List<Datum> data;

  factory ParcelhistoryModel2.fromJson(Map<String, dynamic> json) => ParcelhistoryModel2(
    status: json["status"],
    message: json["message"],
    totalRecord: json["total_record"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "total_record": totalRecord,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.orderId,
    required this.userId,
    required this.senderName,
    required this.senderAddress,
    required this.senderFulladdress,
    required this.orderAmount,
    required this.paymentMethod,
    required this.phoneNo,
    required this.isPaid,
    required this.senderLatitude,
    required this.senderLongitude,
    required this.onDate,
    required this.deliveryTimeFrom,
    required this.saleIds,
    required this.otp,
    required this.parcelDetails,
  });

  String orderId;
  String userId;
  String senderName;
  String senderAddress;
  String senderFulladdress;
  String orderAmount;
  String paymentMethod;
  String phoneNo;
  String isPaid;
  String senderLatitude;
  String senderLongitude;
  DateTime onDate;
  String deliveryTimeFrom;
  String saleIds;
  String otp;
  List<ParcelDetail> parcelDetails;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    orderId: json["order_id"],
    userId: json["user_id"],
    senderName: json["sender_name"],
    senderAddress: json["sender_address"],
    senderFulladdress: json["sender_fulladdress"],
    orderAmount: json["order_amount"],
    paymentMethod: json["payment_method"],
    phoneNo: json["phone_no"],
    isPaid: json["is_paid"],
    senderLatitude: json["sender_latitude"],
    senderLongitude: json["sender_longitude"],
    onDate: DateTime.parse(json["on_date"]),
    deliveryTimeFrom: json["delivery_time_from"],
    saleIds: json["sale_ids"],
    otp: json["otp"],
    parcelDetails: List<ParcelDetail>.from(json["parcel_details"].map((x) => ParcelDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "user_id": userId,
    "sender_name": senderName,
    "sender_address": senderAddress,
    "sender_fulladdress": senderFulladdress,
    "order_amount": orderAmount,
    "payment_method": paymentMethod,
    "phone_no": phoneNo,
    "is_paid": isPaid,
    "sender_latitude": senderLatitude,
    "sender_longitude": senderLongitude,
    "on_date": onDate.toIso8601String(),
    "delivery_time_from": deliveryTimeFrom,
    "sale_ids": saleIds,
    "otp": otp,
    "parcel_details": List<dynamic>.from(parcelDetails.map((x) => x.toJson())),
  };
}

class ParcelDetail {
  ParcelDetail({
    required this.the0,
    required this.the1,
    required this.the2,
    required this.the3,
    required this.the4,
    required this.the5,
    required this.the6,
    required this.the7,
    required this.the8,
    required this.the9,
    required this.the10,
    required this.the11,
    required this.the12,
    required this.materialInfo,
  });

  Map<String, String> the0;
  Map<String, String> the1;
  Map<String, String> the2;
  Map<String, String> the3;
  Map<String, String> the4;
  Map<String, String> the5;
  Map<String, String> the6;
  Map<String, String> the7;
  Map<String, String> the8;
  Map<String, String> the9;
  Map<String, String> the10;
  Map<String, String> the11;
  Map<String, String> the12;
  MaterialInfo materialInfo;

  factory ParcelDetail.fromJson(Map<String, dynamic> json) => ParcelDetail(
    the0: Map.from(json["0"]).map((k, v) => MapEntry<String, String>(k, v)),
    the1: Map.from(json["1"]).map((k, v) => MapEntry<String, String>(k, v)),
    the2: Map.from(json["2"]).map((k, v) => MapEntry<String, String>(k, v)),
    the3: Map.from(json["3"]).map((k, v) => MapEntry<String, String>(k, v)),
    the4: Map.from(json["4"]).map((k, v) => MapEntry<String, String>(k, v)),
    the5: Map.from(json["5"]).map((k, v) => MapEntry<String, String>(k, v)),
    the6: Map.from(json["6"]).map((k, v) => MapEntry<String, String>(k, v)),
    the7: Map.from(json["7"]).map((k, v) => MapEntry<String, String>(k, v)),
    the8: Map.from(json["8"]).map((k, v) => MapEntry<String, String>(k, v)),
    the9: Map.from(json["9"]).map((k, v) => MapEntry<String, String>(k, v)),
    the10: Map.from(json["10"]).map((k, v) => MapEntry<String, String>(k, v)),
    the11: Map.from(json["11"]).map((k, v) => MapEntry<String, String>(k, v)),
    the12: Map.from(json["12"]).map((k, v) => MapEntry<String, String>(k, v)),
    materialInfo: MaterialInfo.fromJson(json["material_info"]),
  );

  Map<String, dynamic> toJson() => {
    "0": Map.from(the0).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "1": Map.from(the1).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "2": Map.from(the2).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "3": Map.from(the3).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "4": Map.from(the4).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "5": Map.from(the5).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "6": Map.from(the6).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "7": Map.from(the7).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "8": Map.from(the8).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "9": Map.from(the9).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "10": Map.from(the10).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "11": Map.from(the11).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "12": Map.from(the12).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "material_info": materialInfo.toJson(),
  };
}

class MaterialInfo {
  MaterialInfo({
    required this.saleItemId,
    required this.saleId,
    required this.productId,
    required this.productName,
    required this.qty,
    required this.unit,
    required this.unitValue,
    required this.price,
    required this.qtyInKg,
    required this.rewards,
    required this.discountprice,
    required this.meterialCategory,
    required this.parcelWeight,
  });

  String saleItemId;
  String saleId;
  String productId;
  String productName;
  String qty;
  String unit;
  String unitValue;
  String price;
  String qtyInKg;
  String rewards;
  String discountprice;
  String meterialCategory;
  ParcelWeight parcelWeight;

  factory MaterialInfo.fromJson(Map<String, dynamic> json) => MaterialInfo(
    saleItemId: json["sale_item_id"],
    saleId: json["sale_id"],
    productId: json["product_id"],
    productName: json["product_name"],
    qty: json["qty"],
    unit: json["unit"],
    unitValue: json["unit_value"],
    price: json["price"],
    qtyInKg: json["qty_in_kg"],
    rewards: json["rewards"],
    discountprice: json["discountprice"],
    meterialCategory: json["meterial_category"],
    parcelWeight: parcelWeightValues.map[json["parcel_weight"]]!,
  );

  Map<String, dynamic> toJson() => {
    "sale_item_id": saleItemId,
    "sale_id": saleId,
    "product_id": productId,
    "product_name": productName,
    "qty": qty,
    "unit": unit,
    "unit_value": unitValue,
    "price": price,
    "qty_in_kg": qtyInKg,
    "rewards": rewards,
    "discountprice": discountprice,
    "meterial_category": meterialCategory,
    "parcel_weight": parcelWeightValues.reverse[parcelWeight],
  };
}

enum ParcelWeight { UP_TO_10_KG, UP_TO_5_KG }

final parcelWeightValues = EnumValues({
  "up to 10 kg": ParcelWeight.UP_TO_10_KG,
  "up to 5 kg": ParcelWeight.UP_TO_5_KG
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
