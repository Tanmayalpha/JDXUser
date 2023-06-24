/// response_code : "1"
/// message : "Get Details"
/// status : "success"
/// data : {"parent_id":"10","dri_id":"7","dri_name":"Rohit","dri_email":"Rohit8875@gmail.com","dri_shift":"1","dri_mobile":"7878788878","dri_vehicle_number":"mp09qu4354","dri_vehicle_type":"2","sch_id":"2","sch_name":"Gyan sagar School","sch_email":"gaynasagar@gmail.com","dise_code":"87778772321","sch_mobile":"2147483647","sch_code":"School912707","sch_gst":"GST98978987","sch_address":"Jabalpur, Madhya Pradesh, India","id":"10","email":"Hemant@gmail.com","mobile":"87987788547","address":"Vijay Nagar, Indore, Madhya Pradesh 452010, India","description":"","category_id":null,"per_d_charge":null,"per_h_charge":null,"experience":null,"vehicle_number":null,"vehicle_type":null,"rc_book":null,"per_km_charge":null,"lat":"","lang":"","uname":"Hemant","password":"25d55ad283aa400af464c76d713c07ad","profile_image":"63e4a3f300b2d.jpg","device_token":"","otp":null,"status":"1","wallet":"0.00","balance":"0.00","last_login":null,"created_at":"2023-02-09 07:42:43","updated_at":"2023-02-09 07:42:50","roll":"6","adhar_card":"63e4a3f300585.jpg","pancard":"63e4a3f300bde.jpg","gst_no":"","fssai":"","store_name":"","band_details":"","city_id":"0","vehicle_no":"","registarion_card":"","driving_license":"","categories_id":"","company_name":"","role_user":"","event":"","latitude":"22.7532848","longitude":"75.8936962","delivery_type":"","refferal_code":"e-GATE252269","friend_code":"","online_status":"0","store_description":"","commision":"","resto_type":"","gender":null,"cash_collection":"0","commision_amount_type":"","time_shift":"0","school_id":"2","driver_id":"7"}

class ShowDetailsModel {
  ShowDetailsModel({
      String? responseCode, 
      String? message, 
      String? status, 
      Data? data,}){
    _responseCode = responseCode;
    _message = message;
    _status = status;
    _data = data;
}

  ShowDetailsModel.fromJson(dynamic json) {
    _responseCode = json['response_code'];
    _message = json['message'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _responseCode;
  String? _message;
  String? _status;
  Data? _data;
ShowDetailsModel copyWith({  String? responseCode,
  String? message,
  String? status,
  Data? data,
}) => ShowDetailsModel(  responseCode: responseCode ?? _responseCode,
  message: message ?? _message,
  status: status ?? _status,
  data: data ?? _data,
);
  String? get responseCode => _responseCode;
  String? get message => _message;
  String? get status => _status;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response_code'] = _responseCode;
    map['message'] = _message;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// parent_id : "10"
/// dri_id : "7"
/// dri_name : "Rohit"
/// dri_email : "Rohit8875@gmail.com"
/// dri_shift : "1"
/// dri_mobile : "7878788878"
/// dri_vehicle_number : "mp09qu4354"
/// dri_vehicle_type : "2"
/// sch_id : "2"
/// sch_name : "Gyan sagar School"
/// sch_email : "gaynasagar@gmail.com"
/// dise_code : "87778772321"
/// sch_mobile : "2147483647"
/// sch_code : "School912707"
/// sch_gst : "GST98978987"
/// sch_address : "Jabalpur, Madhya Pradesh, India"
/// id : "10"
/// email : "Hemant@gmail.com"
/// mobile : "87987788547"
/// address : "Vijay Nagar, Indore, Madhya Pradesh 452010, India"
/// description : ""
/// category_id : null
/// per_d_charge : null
/// per_h_charge : null
/// experience : null
/// vehicle_number : null
/// vehicle_type : null
/// rc_book : null
/// per_km_charge : null
/// lat : ""
/// lang : ""
/// uname : "Hemant"
/// password : "25d55ad283aa400af464c76d713c07ad"
/// profile_image : "63e4a3f300b2d.jpg"
/// device_token : ""
/// otp : null
/// status : "1"
/// wallet : "0.00"
/// balance : "0.00"
/// last_login : null
/// created_at : "2023-02-09 07:42:43"
/// updated_at : "2023-02-09 07:42:50"
/// roll : "6"
/// adhar_card : "63e4a3f300585.jpg"
/// pancard : "63e4a3f300bde.jpg"
/// gst_no : ""
/// fssai : ""
/// store_name : ""
/// band_details : ""
/// city_id : "0"
/// vehicle_no : ""
/// registarion_card : ""
/// driving_license : ""
/// categories_id : ""
/// company_name : ""
/// role_user : ""
/// event : ""
/// latitude : "22.7532848"
/// longitude : "75.8936962"
/// delivery_type : ""
/// refferal_code : "e-GATE252269"
/// friend_code : ""
/// online_status : "0"
/// store_description : ""
/// commision : ""
/// resto_type : ""
/// gender : null
/// cash_collection : "0"
/// commision_amount_type : ""
/// time_shift : "0"
/// school_id : "2"
/// driver_id : "7"

class Data {
  Data({
      String? parentId, 
      String? driId, 
      String? driName, 
      String? driEmail, 
      String? driShift, 
      String? driMobile, 
      String? driVehicleNumber, 
      String? driVehicleType, 
      String? schId, 
      String? schName, 
      String? schEmail, 
      String? diseCode, 
      String? schMobile, 
      String? schCode, 
      String? schGst, 
      String? schAddress, 
      String? id, 
      String? email, 
      String? mobile, 
      String? address, 
      String? description, 
      dynamic categoryId, 
      dynamic perDCharge, 
      dynamic perHCharge, 
      dynamic experience, 
      dynamic vehicleNumber, 
      dynamic vehicleType, 
      dynamic rcBook, 
      dynamic perKmCharge, 
      String? lat, 
      String? lang, 
      String? uname, 
      String? password, 
      String? profileImage, 
      String? deviceToken, 
      dynamic otp, 
      String? status, 
      String? wallet, 
      String? balance, 
      dynamic lastLogin, 
      String? createdAt, 
      String? updatedAt, 
      String? roll, 
      String? adharCard, 
      String? pancard, 
      String? gstNo, 
      String? fssai, 
      String? storeName, 
      String? bandDetails, 
      String? cityId, 
      String? vehicleNo, 
      String? registarionCard, 
      String? drivingLicense, 
      String? categoriesId, 
      String? companyName, 
      String? roleUser, 
      String? event, 
      String? latitude, 
      String? longitude, 
      String? deliveryType, 
      String? refferalCode, 
      String? friendCode, 
      String? onlineStatus, 
      String? storeDescription, 
      String? commision, 
      String? restoType, 
      dynamic gender, 
      String? cashCollection, 
      String? commisionAmountType, 
      String? timeShift, 
      String? schoolId, 
      String? driverId,}){
    _parentId = parentId;
    _driId = driId;
    _driName = driName;
    _driEmail = driEmail;
    _driShift = driShift;
    _driMobile = driMobile;
    _driVehicleNumber = driVehicleNumber;
    _driVehicleType = driVehicleType;
    _schId = schId;
    _schName = schName;
    _schEmail = schEmail;
    _diseCode = diseCode;
    _schMobile = schMobile;
    _schCode = schCode;
    _schGst = schGst;
    _schAddress = schAddress;
    _id = id;
    _email = email;
    _mobile = mobile;
    _address = address;
    _description = description;
    _categoryId = categoryId;
    _perDCharge = perDCharge;
    _perHCharge = perHCharge;
    _experience = experience;
    _vehicleNumber = vehicleNumber;
    _vehicleType = vehicleType;
    _rcBook = rcBook;
    _perKmCharge = perKmCharge;
    _lat = lat;
    _lang = lang;
    _uname = uname;
    _password = password;
    _profileImage = profileImage;
    _deviceToken = deviceToken;
    _otp = otp;
    _status = status;
    _wallet = wallet;
    _balance = balance;
    _lastLogin = lastLogin;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _roll = roll;
    _adharCard = adharCard;
    _pancard = pancard;
    _gstNo = gstNo;
    _fssai = fssai;
    _storeName = storeName;
    _bandDetails = bandDetails;
    _cityId = cityId;
    _vehicleNo = vehicleNo;
    _registarionCard = registarionCard;
    _drivingLicense = drivingLicense;
    _categoriesId = categoriesId;
    _companyName = companyName;
    _roleUser = roleUser;
    _event = event;
    _latitude = latitude;
    _longitude = longitude;
    _deliveryType = deliveryType;
    _refferalCode = refferalCode;
    _friendCode = friendCode;
    _onlineStatus = onlineStatus;
    _storeDescription = storeDescription;
    _commision = commision;
    _restoType = restoType;
    _gender = gender;
    _cashCollection = cashCollection;
    _commisionAmountType = commisionAmountType;
    _timeShift = timeShift;
    _schoolId = schoolId;
    _driverId = driverId;
}

  Data.fromJson(dynamic json) {
    _parentId = json['parent_id'];
    _driId = json['dri_id'];
    _driName = json['dri_name'];
    _driEmail = json['dri_email'];
    _driShift = json['dri_shift'];
    _driMobile = json['dri_mobile'];
    _driVehicleNumber = json['dri_vehicle_number'];
    _driVehicleType = json['dri_vehicle_type'];
    _schId = json['sch_id'];
    _schName = json['sch_name'];
    _schEmail = json['sch_email'];
    _diseCode = json['dise_code'];
    _schMobile = json['sch_mobile'];
    _schCode = json['sch_code'];
    _schGst = json['sch_gst'];
    _schAddress = json['sch_address'];
    _id = json['id'];
    _email = json['email'];
    _mobile = json['mobile'];
    _address = json['address'];
    _description = json['description'];
    _categoryId = json['category_id'];
    _perDCharge = json['per_d_charge'];
    _perHCharge = json['per_h_charge'];
    _experience = json['experience'];
    _vehicleNumber = json['vehicle_number'];
    _vehicleType = json['vehicle_type'];
    _rcBook = json['rc_book'];
    _perKmCharge = json['per_km_charge'];
    _lat = json['lat'];
    _lang = json['lang'];
    _uname = json['uname'];
    _password = json['password'];
    _profileImage = json['profile_image'];
    _deviceToken = json['device_token'];
    _otp = json['otp'];
    _status = json['status'];
    _wallet = json['wallet'];
    _balance = json['balance'];
    _lastLogin = json['last_login'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _roll = json['roll'];
    _adharCard = json['adhar_card'];
    _pancard = json['pancard'];
    _gstNo = json['gst_no'];
    _fssai = json['fssai'];
    _storeName = json['store_name'];
    _bandDetails = json['band_details'];
    _cityId = json['city_id'];
    _vehicleNo = json['vehicle_no'];
    _registarionCard = json['registarion_card'];
    _drivingLicense = json['driving_license'];
    _categoriesId = json['categories_id'];
    _companyName = json['company_name'];
    _roleUser = json['role_user'];
    _event = json['event'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _deliveryType = json['delivery_type'];
    _refferalCode = json['refferal_code'];
    _friendCode = json['friend_code'];
    _onlineStatus = json['online_status'];
    _storeDescription = json['store_description'];
    _commision = json['commision'];
    _restoType = json['resto_type'];
    _gender = json['gender'];
    _cashCollection = json['cash_collection'];
    _commisionAmountType = json['commision_amount_type'];
    _timeShift = json['time_shift'];
    _schoolId = json['school_id'];
    _driverId = json['driver_id'];
  }
  String? _parentId;
  String? _driId;
  String? _driName;
  String? _driEmail;
  String? _driShift;
  String? _driMobile;
  String? _driVehicleNumber;
  String? _driVehicleType;
  String? _schId;
  String? _schName;
  String? _schEmail;
  String? _diseCode;
  String? _schMobile;
  String? _schCode;
  String? _schGst;
  String? _schAddress;
  String? _id;
  String? _email;
  String? _mobile;
  String? _address;
  String? _description;
  dynamic _categoryId;
  dynamic _perDCharge;
  dynamic _perHCharge;
  dynamic _experience;
  dynamic _vehicleNumber;
  dynamic _vehicleType;
  dynamic _rcBook;
  dynamic _perKmCharge;
  String? _lat;
  String? _lang;
  String? _uname;
  String? _password;
  String? _profileImage;
  String? _deviceToken;
  dynamic _otp;
  String? _status;
  String? _wallet;
  String? _balance;
  dynamic _lastLogin;
  String? _createdAt;
  String? _updatedAt;
  String? _roll;
  String? _adharCard;
  String? _pancard;
  String? _gstNo;
  String? _fssai;
  String? _storeName;
  String? _bandDetails;
  String? _cityId;
  String? _vehicleNo;
  String? _registarionCard;
  String? _drivingLicense;
  String? _categoriesId;
  String? _companyName;
  String? _roleUser;
  String? _event;
  String? _latitude;
  String? _longitude;
  String? _deliveryType;
  String? _refferalCode;
  String? _friendCode;
  String? _onlineStatus;
  String? _storeDescription;
  String? _commision;
  String? _restoType;
  dynamic _gender;
  String? _cashCollection;
  String? _commisionAmountType;
  String? _timeShift;
  String? _schoolId;
  String? _driverId;
Data copyWith({  String? parentId,
  String? driId,
  String? driName,
  String? driEmail,
  String? driShift,
  String? driMobile,
  String? driVehicleNumber,
  String? driVehicleType,
  String? schId,
  String? schName,
  String? schEmail,
  String? diseCode,
  String? schMobile,
  String? schCode,
  String? schGst,
  String? schAddress,
  String? id,
  String? email,
  String? mobile,
  String? address,
  String? description,
  dynamic categoryId,
  dynamic perDCharge,
  dynamic perHCharge,
  dynamic experience,
  dynamic vehicleNumber,
  dynamic vehicleType,
  dynamic rcBook,
  dynamic perKmCharge,
  String? lat,
  String? lang,
  String? uname,
  String? password,
  String? profileImage,
  String? deviceToken,
  dynamic otp,
  String? status,
  String? wallet,
  String? balance,
  dynamic lastLogin,
  String? createdAt,
  String? updatedAt,
  String? roll,
  String? adharCard,
  String? pancard,
  String? gstNo,
  String? fssai,
  String? storeName,
  String? bandDetails,
  String? cityId,
  String? vehicleNo,
  String? registarionCard,
  String? drivingLicense,
  String? categoriesId,
  String? companyName,
  String? roleUser,
  String? event,
  String? latitude,
  String? longitude,
  String? deliveryType,
  String? refferalCode,
  String? friendCode,
  String? onlineStatus,
  String? storeDescription,
  String? commision,
  String? restoType,
  dynamic gender,
  String? cashCollection,
  String? commisionAmountType,
  String? timeShift,
  String? schoolId,
  String? driverId,
}) => Data(  parentId: parentId ?? _parentId,
  driId: driId ?? _driId,
  driName: driName ?? _driName,
  driEmail: driEmail ?? _driEmail,
  driShift: driShift ?? _driShift,
  driMobile: driMobile ?? _driMobile,
  driVehicleNumber: driVehicleNumber ?? _driVehicleNumber,
  driVehicleType: driVehicleType ?? _driVehicleType,
  schId: schId ?? _schId,
  schName: schName ?? _schName,
  schEmail: schEmail ?? _schEmail,
  diseCode: diseCode ?? _diseCode,
  schMobile: schMobile ?? _schMobile,
  schCode: schCode ?? _schCode,
  schGst: schGst ?? _schGst,
  schAddress: schAddress ?? _schAddress,
  id: id ?? _id,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  address: address ?? _address,
  description: description ?? _description,
  categoryId: categoryId ?? _categoryId,
  perDCharge: perDCharge ?? _perDCharge,
  perHCharge: perHCharge ?? _perHCharge,
  experience: experience ?? _experience,
  vehicleNumber: vehicleNumber ?? _vehicleNumber,
  vehicleType: vehicleType ?? _vehicleType,
  rcBook: rcBook ?? _rcBook,
  perKmCharge: perKmCharge ?? _perKmCharge,
  lat: lat ?? _lat,
  lang: lang ?? _lang,
  uname: uname ?? _uname,
  password: password ?? _password,
  profileImage: profileImage ?? _profileImage,
  deviceToken: deviceToken ?? _deviceToken,
  otp: otp ?? _otp,
  status: status ?? _status,
  wallet: wallet ?? _wallet,
  balance: balance ?? _balance,
  lastLogin: lastLogin ?? _lastLogin,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  roll: roll ?? _roll,
  adharCard: adharCard ?? _adharCard,
  pancard: pancard ?? _pancard,
  gstNo: gstNo ?? _gstNo,
  fssai: fssai ?? _fssai,
  storeName: storeName ?? _storeName,
  bandDetails: bandDetails ?? _bandDetails,
  cityId: cityId ?? _cityId,
  vehicleNo: vehicleNo ?? _vehicleNo,
  registarionCard: registarionCard ?? _registarionCard,
  drivingLicense: drivingLicense ?? _drivingLicense,
  categoriesId: categoriesId ?? _categoriesId,
  companyName: companyName ?? _companyName,
  roleUser: roleUser ?? _roleUser,
  event: event ?? _event,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  deliveryType: deliveryType ?? _deliveryType,
  refferalCode: refferalCode ?? _refferalCode,
  friendCode: friendCode ?? _friendCode,
  onlineStatus: onlineStatus ?? _onlineStatus,
  storeDescription: storeDescription ?? _storeDescription,
  commision: commision ?? _commision,
  restoType: restoType ?? _restoType,
  gender: gender ?? _gender,
  cashCollection: cashCollection ?? _cashCollection,
  commisionAmountType: commisionAmountType ?? _commisionAmountType,
  timeShift: timeShift ?? _timeShift,
  schoolId: schoolId ?? _schoolId,
  driverId: driverId ?? _driverId,
);
  String? get parentId => _parentId;
  String? get driId => _driId;
  String? get driName => _driName;
  String? get driEmail => _driEmail;
  String? get driShift => _driShift;
  String? get driMobile => _driMobile;
  String? get driVehicleNumber => _driVehicleNumber;
  String? get driVehicleType => _driVehicleType;
  String? get schId => _schId;
  String? get schName => _schName;
  String? get schEmail => _schEmail;
  String? get diseCode => _diseCode;
  String? get schMobile => _schMobile;
  String? get schCode => _schCode;
  String? get schGst => _schGst;
  String? get schAddress => _schAddress;
  String? get id => _id;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get address => _address;
  String? get description => _description;
  dynamic get categoryId => _categoryId;
  dynamic get perDCharge => _perDCharge;
  dynamic get perHCharge => _perHCharge;
  dynamic get experience => _experience;
  dynamic get vehicleNumber => _vehicleNumber;
  dynamic get vehicleType => _vehicleType;
  dynamic get rcBook => _rcBook;
  dynamic get perKmCharge => _perKmCharge;
  String? get lat => _lat;
  String? get lang => _lang;
  String? get uname => _uname;
  String? get password => _password;
  String? get profileImage => _profileImage;
  String? get deviceToken => _deviceToken;
  dynamic get otp => _otp;
  String? get status => _status;
  String? get wallet => _wallet;
  String? get balance => _balance;
  dynamic get lastLogin => _lastLogin;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get roll => _roll;
  String? get adharCard => _adharCard;
  String? get pancard => _pancard;
  String? get gstNo => _gstNo;
  String? get fssai => _fssai;
  String? get storeName => _storeName;
  String? get bandDetails => _bandDetails;
  String? get cityId => _cityId;
  String? get vehicleNo => _vehicleNo;
  String? get registarionCard => _registarionCard;
  String? get drivingLicense => _drivingLicense;
  String? get categoriesId => _categoriesId;
  String? get companyName => _companyName;
  String? get roleUser => _roleUser;
  String? get event => _event;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get deliveryType => _deliveryType;
  String? get refferalCode => _refferalCode;
  String? get friendCode => _friendCode;
  String? get onlineStatus => _onlineStatus;
  String? get storeDescription => _storeDescription;
  String? get commision => _commision;
  String? get restoType => _restoType;
  dynamic get gender => _gender;
  String? get cashCollection => _cashCollection;
  String? get commisionAmountType => _commisionAmountType;
  String? get timeShift => _timeShift;
  String? get schoolId => _schoolId;
  String? get driverId => _driverId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['parent_id'] = _parentId;
    map['dri_id'] = _driId;
    map['dri_name'] = _driName;
    map['dri_email'] = _driEmail;
    map['dri_shift'] = _driShift;
    map['dri_mobile'] = _driMobile;
    map['dri_vehicle_number'] = _driVehicleNumber;
    map['dri_vehicle_type'] = _driVehicleType;
    map['sch_id'] = _schId;
    map['sch_name'] = _schName;
    map['sch_email'] = _schEmail;
    map['dise_code'] = _diseCode;
    map['sch_mobile'] = _schMobile;
    map['sch_code'] = _schCode;
    map['sch_gst'] = _schGst;
    map['sch_address'] = _schAddress;
    map['id'] = _id;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['address'] = _address;
    map['description'] = _description;
    map['category_id'] = _categoryId;
    map['per_d_charge'] = _perDCharge;
    map['per_h_charge'] = _perHCharge;
    map['experience'] = _experience;
    map['vehicle_number'] = _vehicleNumber;
    map['vehicle_type'] = _vehicleType;
    map['rc_book'] = _rcBook;
    map['per_km_charge'] = _perKmCharge;
    map['lat'] = _lat;
    map['lang'] = _lang;
    map['uname'] = _uname;
    map['password'] = _password;
    map['profile_image'] = _profileImage;
    map['device_token'] = _deviceToken;
    map['otp'] = _otp;
    map['status'] = _status;
    map['wallet'] = _wallet;
    map['balance'] = _balance;
    map['last_login'] = _lastLogin;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['roll'] = _roll;
    map['adhar_card'] = _adharCard;
    map['pancard'] = _pancard;
    map['gst_no'] = _gstNo;
    map['fssai'] = _fssai;
    map['store_name'] = _storeName;
    map['band_details'] = _bandDetails;
    map['city_id'] = _cityId;
    map['vehicle_no'] = _vehicleNo;
    map['registarion_card'] = _registarionCard;
    map['driving_license'] = _drivingLicense;
    map['categories_id'] = _categoriesId;
    map['company_name'] = _companyName;
    map['role_user'] = _roleUser;
    map['event'] = _event;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['delivery_type'] = _deliveryType;
    map['refferal_code'] = _refferalCode;
    map['friend_code'] = _friendCode;
    map['online_status'] = _onlineStatus;
    map['store_description'] = _storeDescription;
    map['commision'] = _commision;
    map['resto_type'] = _restoType;
    map['gender'] = _gender;
    map['cash_collection'] = _cashCollection;
    map['commision_amount_type'] = _commisionAmountType;
    map['time_shift'] = _timeShift;
    map['school_id'] = _schoolId;
    map['driver_id'] = _driverId;
    return map;
  }

}