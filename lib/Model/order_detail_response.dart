// To parse this JSON data, do
//
//     final orderDetailResponse = orderDetailResponseFromJson(jsonString);

import 'dart:convert';

OrderDetailResponse orderDetailResponseFromJson(String str) => OrderDetailResponse.fromJson(json.decode(str));

String orderDetailResponseToJson(OrderDetailResponse data) => json.encode(data.toJson());

class OrderDetailResponse {
  OrderDetailResponse({
    this.status,
    this.message,
    this.totalRecord,
    this.data,
  });

  bool? status;
  String? message;
  int? totalRecord;
  List<OrderDetailDataList>? data;

  factory OrderDetailResponse.fromJson(Map<String, dynamic> json) => OrderDetailResponse(
    status: json["status"],
    message: json["message"],
    totalRecord: json["total_record"],
    data: List<OrderDetailDataList>.from(json["data"].map((x) => OrderDetailDataList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "total_record": totalRecord,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class OrderDetailDataList {
  OrderDetailDataList({
    this.orderId,
    this.userId,
    this.senderName,
    this.senderAddress,
    this.senderFulladdress,
    this.orderAmount,
    this.paymentMethod,
    this.phoneNo,
    this.isPaid,
    this.senderLatitude,
    this.senderLongitude,
    this.onDate,
    this.deliveryTimeFrom,
    this.saleIds,
    this.parcelDetails,
  });

  String? orderId;
  String? userId;
  String? senderName;
  String? senderAddress;
  String? senderFulladdress;
  String? orderAmount;
  PaymentMethod? paymentMethod;
  String? phoneNo;
  String? isPaid;
  String? senderLatitude;
  String? senderLongitude;
  DateTime? onDate;
  String? deliveryTimeFrom;
  String? saleIds;
  List<ParcelDetail>? parcelDetails;

  factory OrderDetailDataList.fromJson(Map<String, dynamic> json) => OrderDetailDataList(
    orderId: json["order_id"],
    userId: json["user_id"],
    senderName: json["sender_name"],
    senderAddress: json["sender_address"],
    senderFulladdress: json["sender_fulladdress"],
    orderAmount: json["order_amount"],
    paymentMethod: paymentMethodValues.map[json["payment_method"]],
    phoneNo: json["phone_no"],
    isPaid: json["is_paid"],
    senderLatitude: json["sender_latitude"],
    senderLongitude: json["sender_longitude"],
    onDate: DateTime.parse(json["on_date"]),
    deliveryTimeFrom: json["delivery_time_from"],
    saleIds: json["sale_ids"],
    parcelDetails: List<ParcelDetail>.from(json["parcel_details"].map((x) => ParcelDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "user_id": userId,
    "sender_name": senderName,
    "sender_address": senderAddress,
    "sender_fulladdress": senderFulladdress,
    "order_amount": orderAmount,
    "payment_method": paymentMethodValues.reverse[paymentMethod],
    "phone_no": phoneNo,
    "is_paid": isPaid,
    "sender_latitude": senderLatitude,
    "sender_longitude": senderLongitude,
    "on_date": "${onDate?.year.toString().padLeft(4, '0')}-${onDate?.month.toString().padLeft(2, '0')}-${onDate?.day.toString().padLeft(2, '0')}",
    "delivery_time_from": deliveryTimeFrom,
    "sale_ids": saleIds,
    "parcel_details": List<dynamic>.from(parcelDetails!.map((x) => x.toJson())),
  };
}

class ParcelDetail {
  ParcelDetail({
    this.saleId,
    this.orderId,
    this.barcode,
    this.barcodeLink,
    this.userId,
    this.deliveryBoyId,
    this.bookingRef,
    this.senderName,
    this.senderAddress,
    this.senderFulladdress,
    this.receiverName,
    this.receiverPhone,
    this.receiverAddress,
    this.reqDeliveryboyIds,
    this.onDate,
    this.deliveryTimeFrom,
    this.deliveryTimeTo,
    this.slottime,
    this.status,
    this.note,
    this.isPaid,
    this.shippingCharge,
    this.couponDiscount,
    this.couponCode,
    this.totalAmount,
    this.totalRewards,
    this.totalKg,
    this.totalItems,
    this.socityId,
    this.addressId,
    this.deliveryAddress,
    this.area,
    this.locationId,
    this.deliveryCharge,
    this.newStoreId,
    this.assignTo,
    this.paymentMethod,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNo,
    this.zipCode,
    this.dateTime,
    this.deliveryboyOrderStatus,
    this.assignedTime,
    this.isStatus,
    this.deliveryLatitude,
    this.deliveryLongitude,
    this.orderReceivedTime,
    this.foodPrepareTime,
    this.orderPickupTime,
    this.orderDeliveredTime,
    this.orderTimeComplete,
    this.city,
    this.distance,
    this.reciverFullAddress,
    this.senderLatitude,
    this.senderLongitude,
    this.receiverLatitude,
    this.receiverLongitude,
    this.parcelPhoto,
    this.isCodOrderVerify,
    this.accountName,
    this.accountNumber,
    this.parcelHistory,
    this.materialInfo,
  });

  String? saleId;
  String? orderId;
  String? barcode;
  String? barcodeLink;
  String? userId;
  String? deliveryBoyId;
  String? bookingRef;
  String? senderName;
  String? senderAddress;
  String? senderFulladdress;
  String? receiverName;
  String? receiverPhone;
  String? receiverAddress;
  String? reqDeliveryboyIds;
  DateTime? onDate;
  String? deliveryTimeFrom;
  String? deliveryTimeTo;
  String? slottime;
  String? status;
  String? note;
  String? isPaid;
  String? shippingCharge;
  String? couponDiscount;
  String? couponCode;
  String? totalAmount;
  String? totalRewards;
  String? totalKg;
  String? totalItems;
  String? socityId;
  String? addressId;
  String? deliveryAddress;
  String? area;
  String? locationId;
  String? deliveryCharge;
  String? newStoreId;
  String? assignTo;
  PaymentMethod? paymentMethod;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNo;
  String? zipCode;
  String? dateTime;
  String? deliveryboyOrderStatus;
  String? assignedTime;
  String? isStatus;
  String? deliveryLatitude;
  String? deliveryLongitude;
  String? orderReceivedTime;
  String? foodPrepareTime;
  String? orderPickupTime;
  String? orderDeliveredTime;
  String? orderTimeComplete;
  String? city;
  String? distance;
  String? reciverFullAddress;
  String? senderLatitude;
  String? senderLongitude;
  String? receiverLatitude;
  String? receiverLongitude;
  ParcelPhoto? parcelPhoto;
  String? isCodOrderVerify;
  String? accountName;
  String? accountNumber;
  String? parcelHistory;
  MaterialInfo? materialInfo;

  factory ParcelDetail.fromJson(Map<String, dynamic> json) => ParcelDetail(
    saleId: json["sale_id"],
    orderId: json["order_id"],
    barcode: json["barcode"],
    barcodeLink: json["barcode_link"],
    userId: json["user_id"],
    deliveryBoyId: json["delivery_boy_id"],
    bookingRef: json["booking_ref"],
    senderName: json["sender_name"],
    senderAddress: json["sender_address"],
    senderFulladdress: json["sender_fulladdress"],
    receiverName: json["receiver_name"],
    receiverPhone: json["receiver_phone"],
    receiverAddress: json["receiver_address"],
    reqDeliveryboyIds: json["req_deliveryboy_ids"],
    onDate: DateTime.parse(json["on_date"]),
    deliveryTimeFrom: json["delivery_time_from"],
    deliveryTimeTo: json["delivery_time_to"],
    slottime: json["slottime"],
    status: json["status"],
    note: json["note"],
    isPaid: json["is_paid"],
    shippingCharge: json["shipping_charge"],
    couponDiscount: json["coupon_discount"],
    couponCode: json["coupon_code"],
    totalAmount: json["total_amount"],
    totalRewards: json["total_rewards"],
    totalKg: json["total_kg"],
    totalItems: json["total_items"],
    socityId: json["socity_id"],
    addressId: json["address_id"],
    deliveryAddress: json["delivery_address"],
    area: json["area"],
    locationId: json["location_id"],
    deliveryCharge: json["delivery_charge"],
    newStoreId: json["new_store_id"],
    assignTo: json["assign_to"],
    paymentMethod: paymentMethodValues.map[json["payment_method"]],
    firstName: json["First_name"],
    lastName: json["Last_name"],
    email: json["email"],
    phoneNo: json["phone_no"],
    zipCode: json["zip_code"],
    dateTime: json["date_time"],
    deliveryboyOrderStatus: json["deliveryboy_order_status"],
    assignedTime: json["assigned_time"],
    isStatus: json["is_status"],
    deliveryLatitude: json["delivery_latitude"],
    deliveryLongitude: json["delivery_longitude"],
    orderReceivedTime: json["order_received_time"],
    foodPrepareTime: json["food_prepare_time"],
    orderPickupTime: json["order_pickup_time"],
    orderDeliveredTime: json["order_delivered_time"],
    orderTimeComplete: json["order_time_complete"],
    city: json["city"],
    distance: json["distance"],
    reciverFullAddress: json["reciver_full_address"],
    senderLatitude: json["sender_latitude"],
    senderLongitude: json["sender_longitude"],
    receiverLatitude: json["receiver_latitude"],
    receiverLongitude: json["receiver_longitude"],
    parcelPhoto: parcelPhotoValues.map[json["parcel_photo"]],
    isCodOrderVerify: json["is_cod_order_verify"],
    accountName: json["account_name"],
    accountNumber: json["account_number"],
    parcelHistory: json["parcel_history"],
    materialInfo: MaterialInfo.fromJson(json["material_info"]),
  );

  Map<String, dynamic> toJson() => {
    "sale_id": saleId,
    "order_id": orderId,
    "barcode": barcode,
    "barcode_link": barcodeLink,
    "user_id": userId,
    "delivery_boy_id": deliveryBoyId,
    "booking_ref": bookingRef,
    "sender_name": senderName,
    "sender_address": senderAddress,
    "sender_fulladdress": senderFulladdress,
    "receiver_name": receiverName,
    "receiver_phone": receiverPhone,
    "receiver_address": receiverAddress,
    "req_deliveryboy_ids": reqDeliveryboyIds,
    "on_date": "${onDate?.year.toString().padLeft(4, '0')}-${onDate?.month.toString().padLeft(2, '0')}-${onDate?.day.toString().padLeft(2, '0')}",
    "delivery_time_from": deliveryTimeFrom,
    "delivery_time_to": deliveryTimeTo,
    "slottime": slottime,
    "status": status,
    "note": note,
    "is_paid": isPaid,
    "shipping_charge": shippingCharge,
    "coupon_discount": couponDiscount,
    "coupon_code": couponCode,
    "total_amount": totalAmount,
    "total_rewards": totalRewards,
    "total_kg": totalKg,
    "total_items": totalItems,
    "socity_id": socityId,
    "address_id": addressId,
    "delivery_address": deliveryAddress,
    "area": area,
    "location_id": locationId,
    "delivery_charge": deliveryCharge,
    "new_store_id": newStoreId,
    "assign_to": assignTo,
    "payment_method": paymentMethodValues.reverse[paymentMethod],
    "First_name": firstName,
    "Last_name": lastName,
    "email": email,
    "phone_no": phoneNo,
    "zip_code": zipCode,
    "date_time": dateTime,
    "deliveryboy_order_status": deliveryboyOrderStatus,
    "assigned_time": assignedTime,
    "is_status": isStatus,
    "delivery_latitude": deliveryLatitude,
    "delivery_longitude": deliveryLongitude,
    "order_received_time": orderReceivedTime,
    "food_prepare_time": foodPrepareTime,
    "order_pickup_time": orderPickupTime,
    "order_delivered_time": orderDeliveredTime,
    "order_time_complete": orderTimeComplete,
    "city": city,
    "distance": distance,
    "reciver_full_address": reciverFullAddress,
    "sender_latitude": senderLatitude,
    "sender_longitude": senderLongitude,
    "receiver_latitude": receiverLatitude,
    "receiver_longitude": receiverLongitude,
    "parcel_photo": parcelPhotoValues.reverse[parcelPhoto],
    "is_cod_order_verify": isCodOrderVerify,
    "account_name": accountName,
    "account_number": accountNumber,
    "parcel_history": parcelHistory,
    "material_info": materialInfo?.toJson(),
  };
}

class MaterialInfo {
  MaterialInfo({
    this.saleItemId,
    this.saleId,
    this.productId,
    this.productName,
    this.qty,
    this.unit,
    this.unitValue,
    this.price,
    this.qtyInKg,
    this.rewards,
    this.discountprice,
    this.meterialCategory,
    this.parcelWeight,
  });

  String? saleItemId;
  String? saleId;
  String? productId;
  String? productName;
  String? qty;
  String? unit;
  String? unitValue;
  String? price;
  String? qtyInKg;
  String? rewards;
  String? discountprice;
  String? meterialCategory;
  ParcelWeight? parcelWeight;

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
    parcelWeight: parcelWeightValues.map[json["parcel_weight"]],
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

enum ParcelWeight { UP_TO_15_KG, UP_TO_10_KG, UP_TO_1_KG, UP_TO_5_KG }

final parcelWeightValues = EnumValues({
  "up to 10 kg": ParcelWeight.UP_TO_10_KG,
  "up to 15 kg": ParcelWeight.UP_TO_15_KG,
  "up to 1 kg": ParcelWeight.UP_TO_1_KG,
  "up to 5 kg": ParcelWeight.UP_TO_5_KG
});

enum ParcelPhoto { EMPTY, THE_16393829781639382976210_JPG }

final parcelPhotoValues = EnumValues({
  "": ParcelPhoto.EMPTY,
  "16393829781639382976210.jpg": ParcelPhoto.THE_16393829781639382976210_JPG
});

enum PaymentMethod { COD, EMPTY }

final paymentMethodValues = EnumValues({
  "COD": PaymentMethod.COD,
  "": PaymentMethod.EMPTY
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
