class Parceldetailsmodel {
  bool? status;
  List<ParcelDetailDataList>? data;
  int? totalCost;
  String? message;
  int? totalRecord;
  String? orderId;

  Parceldetailsmodel(
      {this.status,
        this.data,
        this.totalCost,
        this.message,
        this.totalRecord,
        this.orderId});

  Parceldetailsmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ParcelDetailDataList>[];
      json['data'].forEach((v) {
        data!.add(new ParcelDetailDataList.fromJson(v));
      });
    }
    totalCost = json['total_cost'];
    message = json['message'];
    totalRecord = json['total_record'];
    orderId = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total_cost'] = this.totalCost;
    data['message'] = this.message;
    data['total_record'] = this.totalRecord;
    data['order_id'] = this.orderId;
    return data;
  }
}

class ParcelDetailDataList {
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
  String? onDate;
  String? deliveryTimeFrom;
  Null? deliveryTimeTo;
  Null? slottime;
  String? status;
  Null? note;
  String? isPaid;
  Null? shippingCharge;
  Null? couponDiscount;
  Null? couponCode;
  String? totalAmount;
  Null? totalRewards;
  Null? totalKg;
  Null? totalItems;
  Null? socityId;
  Null? addressId;
  Null? deliveryAddress;
  Null? area;
  Null? locationId;
  String? deliveryCharge;
  String? newStoreId;
  String? assignTo;
  String? paymentMethod;
  Null? firstName;
  Null? lastName;
  Null? email;
  String? phoneNo;
  Null? zipCode;
  String? dateTime;
  Null? deliveryboyOrderStatus;
  Null? assignedTime;
  String? isStatus;
  Null? deliveryLatitude;
  Null? deliveryLongitude;
  String? orderReceivedTime;
  Null? foodPrepareTime;
  Null? orderPickupTime;
  Null? orderDeliveredTime;
  Null? orderTimeComplete;
  Null? city;
  String? distance;
  String? reciverFullAddress;
  String? senderLatitude;
  String? senderLongitude;
  String? receiverLatitude;
  String? receiverLongitude;
  Null? parcelPhoto;
  Null? isCodOrderVerify;
  Null? accountName;
  Null? accountNumber;
  String? parcelHistory;
  String? otp;
  MaterialInfo? materialInfo;
  DriverDetails? driverDetails;

  ParcelDetailDataList(
      {this.saleId,
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
        this.otp,
        this.materialInfo,
        this.driverDetails});

  ParcelDetailDataList.fromJson(Map<String, dynamic> json) {
    saleId = json['sale_id'];
    orderId = json['order_id'];
    barcode = json['barcode'];
    barcodeLink = json['barcode_link'];
    userId = json['user_id'];
    deliveryBoyId = json['delivery_boy_id'];
    bookingRef = json['booking_ref'];
    senderName = json['sender_name'];
    senderAddress = json['sender_address'];
    senderFulladdress = json['sender_fulladdress'];
    receiverName = json['receiver_name'];
    receiverPhone = json['receiver_phone'];
    receiverAddress = json['receiver_address'];
    reqDeliveryboyIds = json['req_deliveryboy_ids'];
    onDate = json['on_date'];
    deliveryTimeFrom = json['delivery_time_from'];
    deliveryTimeTo = json['delivery_time_to'];
    slottime = json['slottime'];
    status = json['status'];
    note = json['note'];
    isPaid = json['is_paid'];
    shippingCharge = json['shipping_charge'];
    couponDiscount = json['coupon_discount'];
    couponCode = json['coupon_code'];
    totalAmount = json['total_amount'];
    totalRewards = json['total_rewards'];
    totalKg = json['total_kg'];
    totalItems = json['total_items'];
    socityId = json['socity_id'];
    addressId = json['address_id'];
    deliveryAddress = json['delivery_address'];
    area = json['area'];
    locationId = json['location_id'];
    deliveryCharge = json['delivery_charge'];
    newStoreId = json['new_store_id'];
    assignTo = json['assign_to'];
    paymentMethod = json['payment_method'];
    firstName = json['First_name'];
    lastName = json['Last_name'];
    email = json['email'];
    phoneNo = json['phone_no'];
    zipCode = json['zip_code'];
    dateTime = json['date_time'];
    deliveryboyOrderStatus = json['deliveryboy_order_status'];
    assignedTime = json['assigned_time'];
    isStatus = json['is_status'];
    deliveryLatitude = json['delivery_latitude'];
    deliveryLongitude = json['delivery_longitude'];
    orderReceivedTime = json['order_received_time'];
    foodPrepareTime = json['food_prepare_time'];
    orderPickupTime = json['order_pickup_time'];
    orderDeliveredTime = json['order_delivered_time'];
    orderTimeComplete = json['order_time_complete'];
    city = json['city'];
    distance = json['distance'];
    reciverFullAddress = json['reciver_full_address'];
    senderLatitude = json['sender_latitude'];
    senderLongitude = json['sender_longitude'];
    receiverLatitude = json['receiver_latitude'];
    receiverLongitude = json['receiver_longitude'];
    parcelPhoto = json['parcel_photo'];
    isCodOrderVerify = json['is_cod_order_verify'];
    accountName = json['account_name'];
    accountNumber = json['account_number'];
    parcelHistory = json['parcel_history'];
    otp = json['otp'];
    materialInfo = json['material_info'] != null
        ? new MaterialInfo.fromJson(json['material_info'])
        : null;
    driverDetails = json['driver_details'] != null
        ? new DriverDetails.fromJson(json['driver_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sale_id'] = this.saleId;
    data['order_id'] = this.orderId;
    data['barcode'] = this.barcode;
    data['barcode_link'] = this.barcodeLink;
    data['user_id'] = this.userId;
    data['delivery_boy_id'] = this.deliveryBoyId;
    data['booking_ref'] = this.bookingRef;
    data['sender_name'] = this.senderName;
    data['sender_address'] = this.senderAddress;
    data['sender_fulladdress'] = this.senderFulladdress;
    data['receiver_name'] = this.receiverName;
    data['receiver_phone'] = this.receiverPhone;
    data['receiver_address'] = this.receiverAddress;
    data['req_deliveryboy_ids'] = this.reqDeliveryboyIds;
    data['on_date'] = this.onDate;
    data['delivery_time_from'] = this.deliveryTimeFrom;
    data['delivery_time_to'] = this.deliveryTimeTo;
    data['slottime'] = this.slottime;
    data['status'] = this.status;
    data['note'] = this.note;
    data['is_paid'] = this.isPaid;
    data['shipping_charge'] = this.shippingCharge;
    data['coupon_discount'] = this.couponDiscount;
    data['coupon_code'] = this.couponCode;
    data['total_amount'] = this.totalAmount;
    data['total_rewards'] = this.totalRewards;
    data['total_kg'] = this.totalKg;
    data['total_items'] = this.totalItems;
    data['socity_id'] = this.socityId;
    data['address_id'] = this.addressId;
    data['delivery_address'] = this.deliveryAddress;
    data['area'] = this.area;
    data['location_id'] = this.locationId;
    data['delivery_charge'] = this.deliveryCharge;
    data['new_store_id'] = this.newStoreId;
    data['assign_to'] = this.assignTo;
    data['payment_method'] = this.paymentMethod;
    data['First_name'] = this.firstName;
    data['Last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone_no'] = this.phoneNo;
    data['zip_code'] = this.zipCode;
    data['date_time'] = this.dateTime;
    data['deliveryboy_order_status'] = this.deliveryboyOrderStatus;
    data['assigned_time'] = this.assignedTime;
    data['is_status'] = this.isStatus;
    data['delivery_latitude'] = this.deliveryLatitude;
    data['delivery_longitude'] = this.deliveryLongitude;
    data['order_received_time'] = this.orderReceivedTime;
    data['food_prepare_time'] = this.foodPrepareTime;
    data['order_pickup_time'] = this.orderPickupTime;
    data['order_delivered_time'] = this.orderDeliveredTime;
    data['order_time_complete'] = this.orderTimeComplete;
    data['city'] = this.city;
    data['distance'] = this.distance;
    data['reciver_full_address'] = this.reciverFullAddress;
    data['sender_latitude'] = this.senderLatitude;
    data['sender_longitude'] = this.senderLongitude;
    data['receiver_latitude'] = this.receiverLatitude;
    data['receiver_longitude'] = this.receiverLongitude;
    data['parcel_photo'] = this.parcelPhoto;
    data['is_cod_order_verify'] = this.isCodOrderVerify;
    data['account_name'] = this.accountName;
    data['account_number'] = this.accountNumber;
    data['parcel_history'] = this.parcelHistory;
    data['otp'] = this.otp;
    if (this.materialInfo != null) {
      data['material_info'] = this.materialInfo!.toJson();
    }
    if (this.driverDetails != null) {
      data['driver_details'] = this.driverDetails!.toJson();
    }
    return data;
  }
}

class MaterialInfo {
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
  String? parcelWeight;

  MaterialInfo(
      {this.saleItemId,
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
        this.parcelWeight});

  MaterialInfo.fromJson(Map<String, dynamic> json) {
    saleItemId = json['sale_item_id'];
    saleId = json['sale_id'];
    productId = json['product_id'];
    productName = json['product_name'];
    qty = json['qty'];
    unit = json['unit'];
    unitValue = json['unit_value'];
    price = json['price'];
    qtyInKg = json['qty_in_kg'];
    rewards = json['rewards'];
    discountprice = json['discountprice'];
    meterialCategory = json['meterial_category'];
    parcelWeight = json['parcel_weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sale_item_id'] = this.saleItemId;
    data['sale_id'] = this.saleId;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['qty'] = this.qty;
    data['unit'] = this.unit;
    data['unit_value'] = this.unitValue;
    data['price'] = this.price;
    data['qty_in_kg'] = this.qtyInKg;
    data['rewards'] = this.rewards;
    data['discountprice'] = this.discountprice;
    data['meterial_category'] = this.meterialCategory;
    data['parcel_weight'] = this.parcelWeight;
    return data;
  }
}

class DriverDetails {
  String? userId;
  String? userType;
  String? userPhone;
  String? firstname;
  String? lastname;
  String? userFullname;
  String? userEmail;
  String? userBdate;
  String? userPassword;
  String? userCity;
  String? varificationCode;
  String? userImage;
  String? pincode;
  String? socityId;
  String? houseNo;
  String? mobileVerified;
  String? userGcmCode;
  String? userIosToken;
  String? varifiedToken;
  String? status;
  String? regCode;
  String? wallet;
  String? rewards;
  String? created;
  String? modified;
  String? otp;
  String? otpStatus;
  String? social;
  String? facebookID;
  String? isEmailVerified;
  String? vehicleType;
  String? vehicleNo;
  String? drivingLicenceNo;
  String? drivingLicencePhoto;
  String? loginStatus;
  String? isAvaible;
  String? latitude;
  String? longitude;
  String? referralCode;
  String? aadhaarCardNo;
  String? aadhaarCardPhoto;
  String? qrCode;
  String? accountHolderName;
  String? accountNumber;
  String? ifscCode;
  String? bankName;

  DriverDetails(
      {this.userId,
        this.userType,
        this.userPhone,
        this.firstname,
        this.lastname,
        this.userFullname,
        this.userEmail,
        this.userBdate,
        this.userPassword,
        this.userCity,
        this.varificationCode,
        this.userImage,
        this.pincode,
        this.socityId,
        this.houseNo,
        this.mobileVerified,
        this.userGcmCode,
        this.userIosToken,
        this.varifiedToken,
        this.status,
        this.regCode,
        this.wallet,
        this.rewards,
        this.created,
        this.modified,
        this.otp,
        this.otpStatus,
        this.social,
        this.facebookID,
        this.isEmailVerified,
        this.vehicleType,
        this.vehicleNo,
        this.drivingLicenceNo,
        this.drivingLicencePhoto,
        this.loginStatus,
        this.isAvaible,
        this.latitude,
        this.longitude,
        this.referralCode,
        this.aadhaarCardNo,
        this.aadhaarCardPhoto,
        this.qrCode,
        this.accountHolderName,
        this.accountNumber,
        this.ifscCode,
        this.bankName});

  DriverDetails.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userType = json['user_type'];
    userPhone = json['user_phone'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    userFullname = json['user_fullname'];
    userEmail = json['user_email'];
    userBdate = json['user_bdate'];
    userPassword = json['user_password'];
    userCity = json['user_city'];
    varificationCode = json['varification_code'];
    userImage = json['user_image'];
    pincode = json['pincode'];
    socityId = json['socity_id'];
    houseNo = json['house_no'];
    mobileVerified = json['mobile_verified'];
    userGcmCode = json['user_gcm_code'];
    userIosToken = json['user_ios_token'];
    varifiedToken = json['varified_token'];
    status = json['status'];
    regCode = json['reg_code'];
    wallet = json['wallet'];
    rewards = json['rewards'];
    created = json['created'];
    modified = json['modified'];
    otp = json['otp'];
    otpStatus = json['otp_status'];
    social = json['social'];
    facebookID = json['facebookID'];
    isEmailVerified = json['is_email_verified'];
    vehicleType = json['vehicle_type'];
    vehicleNo = json['vehicle_no'];
    drivingLicenceNo = json['driving_licence_no'];
    drivingLicencePhoto = json['driving_licence_photo'];
    loginStatus = json['login_status'];
    isAvaible = json['is_avaible'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    referralCode = json['referral_code'];
    aadhaarCardNo = json['aadhaar_card_no'];
    aadhaarCardPhoto = json['aadhaar_card_photo'];
    qrCode = json['qr_code'];
    accountHolderName = json['account_holder_name'];
    accountNumber = json['account_number'];
    ifscCode = json['ifsc_code'];
    bankName = json['bank_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_type'] = this.userType;
    data['user_phone'] = this.userPhone;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['user_fullname'] = this.userFullname;
    data['user_email'] = this.userEmail;
    data['user_bdate'] = this.userBdate;
    data['user_password'] = this.userPassword;
    data['user_city'] = this.userCity;
    data['varification_code'] = this.varificationCode;
    data['user_image'] = this.userImage;
    data['pincode'] = this.pincode;
    data['socity_id'] = this.socityId;
    data['house_no'] = this.houseNo;
    data['mobile_verified'] = this.mobileVerified;
    data['user_gcm_code'] = this.userGcmCode;
    data['user_ios_token'] = this.userIosToken;
    data['varified_token'] = this.varifiedToken;
    data['status'] = this.status;
    data['reg_code'] = this.regCode;
    data['wallet'] = this.wallet;
    data['rewards'] = this.rewards;
    data['created'] = this.created;
    data['modified'] = this.modified;
    data['otp'] = this.otp;
    data['otp_status'] = this.otpStatus;
    data['social'] = this.social;
    data['facebookID'] = this.facebookID;
    data['is_email_verified'] = this.isEmailVerified;
    data['vehicle_type'] = this.vehicleType;
    data['vehicle_no'] = this.vehicleNo;
    data['driving_licence_no'] = this.drivingLicenceNo;
    data['driving_licence_photo'] = this.drivingLicencePhoto;
    data['login_status'] = this.loginStatus;
    data['is_avaible'] = this.isAvaible;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['referral_code'] = this.referralCode;
    data['aadhaar_card_no'] = this.aadhaarCardNo;
    data['aadhaar_card_photo'] = this.aadhaarCardPhoto;
    data['qr_code'] = this.qrCode;
    data['account_holder_name'] = this.accountHolderName;
    data['account_number'] = this.accountNumber;
    data['ifsc_code'] = this.ifscCode;
    data['bank_name'] = this.bankName;
    return data;
  }
}
