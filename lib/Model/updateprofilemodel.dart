/// status : true
/// message : "Updated Successfully."
/// data : {"user_id":"210","user_type":"0","user_phone":"","firstname":"","lastname":"","user_fullname":"","user_email":"5","user_bdate":"","user_password":"25d55ad283aa400af464c76d713c07ad","user_city":"indore","varification_code":"ZXl9i6VFxU4E","user_image":"","pincode":"0","socity_id":"0","house_no":"","mobile_verified":"0","user_gcm_code":"edGn64_iQ7C5BhHyNlyrrA:APA91bHiWt7izSsQU-dypjjBZv2CYvWvizWG_3UFObg5ID_Td6DXNjNP4VUpoqt81KnSldFOaH_ZaWnZJ5gZ-JnPy87yXz5ClCv0qPTWdeavdbTyVLrT6dpx-rxZPzcUogmMXTwhCF-R","user_ios_token":"","varified_token":"","status":"1","reg_code":"0","wallet":"24","rewards":"0","created":"","modified":"","otp":"0","otp_status":"0","social":"0","facebookID":"","is_email_verified":"0","vehicle_type":"","vehicle_no":"","driving_licence_no":"","driving_licence_photo":"","login_status":"1","is_avaible":"0","latitude":"","longitude":"","referral_code":"XjyaSDdxKc","aadhaar_card_no":"","aadhaar_card_photo":"","qr_code":"","account_holder_name":"","account_number":"","ifsc_code":"","bank_name":""}

class Updateprofilemodel {
  Updateprofilemodel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  Updateprofilemodel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
Updateprofilemodel copyWith({  bool? status,
  String? message,
  Data? data,
}) => Updateprofilemodel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// user_id : "210"
/// user_type : "0"
/// user_phone : ""
/// firstname : ""
/// lastname : ""
/// user_fullname : ""
/// user_email : "5"
/// user_bdate : ""
/// user_password : "25d55ad283aa400af464c76d713c07ad"
/// user_city : "indore"
/// varification_code : "ZXl9i6VFxU4E"
/// user_image : ""
/// pincode : "0"
/// socity_id : "0"
/// house_no : ""
/// mobile_verified : "0"
/// user_gcm_code : "edGn64_iQ7C5BhHyNlyrrA:APA91bHiWt7izSsQU-dypjjBZv2CYvWvizWG_3UFObg5ID_Td6DXNjNP4VUpoqt81KnSldFOaH_ZaWnZJ5gZ-JnPy87yXz5ClCv0qPTWdeavdbTyVLrT6dpx-rxZPzcUogmMXTwhCF-R"
/// user_ios_token : ""
/// varified_token : ""
/// status : "1"
/// reg_code : "0"
/// wallet : "24"
/// rewards : "0"
/// created : ""
/// modified : ""
/// otp : "0"
/// otp_status : "0"
/// social : "0"
/// facebookID : ""
/// is_email_verified : "0"
/// vehicle_type : ""
/// vehicle_no : ""
/// driving_licence_no : ""
/// driving_licence_photo : ""
/// login_status : "1"
/// is_avaible : "0"
/// latitude : ""
/// longitude : ""
/// referral_code : "XjyaSDdxKc"
/// aadhaar_card_no : ""
/// aadhaar_card_photo : ""
/// qr_code : ""
/// account_holder_name : ""
/// account_number : ""
/// ifsc_code : ""
/// bank_name : ""

class Data {
  Data({
      String? userId, 
      String? userType, 
      String? userPhone, 
      String? firstname, 
      String? lastname, 
      String? userFullname, 
      String? userEmail, 
      String? userBdate, 
      String? userPassword, 
      String? userCity, 
      String? varificationCode, 
      String? userImage, 
      String? pincode, 
      String? socityId, 
      String? houseNo, 
      String? mobileVerified, 
      String? userGcmCode, 
      String? userIosToken, 
      String? varifiedToken, 
      String? status, 
      String? regCode, 
      String? wallet, 
      String? rewards, 
      String? created, 
      String? modified, 
      String? otp, 
      String? otpStatus, 
      String? social, 
      String? facebookID, 
      String? isEmailVerified, 
      String? vehicleType, 
      String? vehicleNo, 
      String? drivingLicenceNo, 
      String? drivingLicencePhoto, 
      String? loginStatus, 
      String? isAvaible, 
      String? latitude, 
      String? longitude, 
      String? referralCode, 
      String? aadhaarCardNo, 
      String? aadhaarCardPhoto, 
      String? qrCode, 
      String? accountHolderName, 
      String? accountNumber, 
      String? ifscCode, 
      String? bankName,}){
    _userId = userId;
    _userType = userType;
    _userPhone = userPhone;
    _firstname = firstname;
    _lastname = lastname;
    _userFullname = userFullname;
    _userEmail = userEmail;
    _userBdate = userBdate;
    _userPassword = userPassword;
    _userCity = userCity;
    _varificationCode = varificationCode;
    _userImage = userImage;
    _pincode = pincode;
    _socityId = socityId;
    _houseNo = houseNo;
    _mobileVerified = mobileVerified;
    _userGcmCode = userGcmCode;
    _userIosToken = userIosToken;
    _varifiedToken = varifiedToken;
    _status = status;
    _regCode = regCode;
    _wallet = wallet;
    _rewards = rewards;
    _created = created;
    _modified = modified;
    _otp = otp;
    _otpStatus = otpStatus;
    _social = social;
    _facebookID = facebookID;
    _isEmailVerified = isEmailVerified;
    _vehicleType = vehicleType;
    _vehicleNo = vehicleNo;
    _drivingLicenceNo = drivingLicenceNo;
    _drivingLicencePhoto = drivingLicencePhoto;
    _loginStatus = loginStatus;
    _isAvaible = isAvaible;
    _latitude = latitude;
    _longitude = longitude;
    _referralCode = referralCode;
    _aadhaarCardNo = aadhaarCardNo;
    _aadhaarCardPhoto = aadhaarCardPhoto;
    _qrCode = qrCode;
    _accountHolderName = accountHolderName;
    _accountNumber = accountNumber;
    _ifscCode = ifscCode;
    _bankName = bankName;
}

  Data.fromJson(dynamic json) {
    _userId = json['user_id'];
    _userType = json['user_type'];
    _userPhone = json['user_phone'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _userFullname = json['user_fullname'];
    _userEmail = json['user_email'];
    _userBdate = json['user_bdate'];
    _userPassword = json['user_password'];
    _userCity = json['user_city'];
    _varificationCode = json['varification_code'];
    _userImage = json['user_image'];
    _pincode = json['pincode'];
    _socityId = json['socity_id'];
    _houseNo = json['house_no'];
    _mobileVerified = json['mobile_verified'];
    _userGcmCode = json['user_gcm_code'];
    _userIosToken = json['user_ios_token'];
    _varifiedToken = json['varified_token'];
    _status = json['status'];
    _regCode = json['reg_code'];
    _wallet = json['wallet'];
    _rewards = json['rewards'];
    _created = json['created'];
    _modified = json['modified'];
    _otp = json['otp'];
    _otpStatus = json['otp_status'];
    _social = json['social'];
    _facebookID = json['facebookID'];
    _isEmailVerified = json['is_email_verified'];
    _vehicleType = json['vehicle_type'];
    _vehicleNo = json['vehicle_no'];
    _drivingLicenceNo = json['driving_licence_no'];
    _drivingLicencePhoto = json['driving_licence_photo'];
    _loginStatus = json['login_status'];
    _isAvaible = json['is_avaible'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _referralCode = json['referral_code'];
    _aadhaarCardNo = json['aadhaar_card_no'];
    _aadhaarCardPhoto = json['aadhaar_card_photo'];
    _qrCode = json['qr_code'];
    _accountHolderName = json['account_holder_name'];
    _accountNumber = json['account_number'];
    _ifscCode = json['ifsc_code'];
    _bankName = json['bank_name'];
  }
  String? _userId;
  String? _userType;
  String? _userPhone;
  String? _firstname;
  String? _lastname;
  String? _userFullname;
  String? _userEmail;
  String? _userBdate;
  String? _userPassword;
  String? _userCity;
  String? _varificationCode;
  String? _userImage;
  String? _pincode;
  String? _socityId;
  String? _houseNo;
  String? _mobileVerified;
  String? _userGcmCode;
  String? _userIosToken;
  String? _varifiedToken;
  String? _status;
  String? _regCode;
  String? _wallet;
  String? _rewards;
  String? _created;
  String? _modified;
  String? _otp;
  String? _otpStatus;
  String? _social;
  String? _facebookID;
  String? _isEmailVerified;
  String? _vehicleType;
  String? _vehicleNo;
  String? _drivingLicenceNo;
  String? _drivingLicencePhoto;
  String? _loginStatus;
  String? _isAvaible;
  String? _latitude;
  String? _longitude;
  String? _referralCode;
  String? _aadhaarCardNo;
  String? _aadhaarCardPhoto;
  String? _qrCode;
  String? _accountHolderName;
  String? _accountNumber;
  String? _ifscCode;
  String? _bankName;
Data copyWith({  String? userId,
  String? userType,
  String? userPhone,
  String? firstname,
  String? lastname,
  String? userFullname,
  String? userEmail,
  String? userBdate,
  String? userPassword,
  String? userCity,
  String? varificationCode,
  String? userImage,
  String? pincode,
  String? socityId,
  String? houseNo,
  String? mobileVerified,
  String? userGcmCode,
  String? userIosToken,
  String? varifiedToken,
  String? status,
  String? regCode,
  String? wallet,
  String? rewards,
  String? created,
  String? modified,
  String? otp,
  String? otpStatus,
  String? social,
  String? facebookID,
  String? isEmailVerified,
  String? vehicleType,
  String? vehicleNo,
  String? drivingLicenceNo,
  String? drivingLicencePhoto,
  String? loginStatus,
  String? isAvaible,
  String? latitude,
  String? longitude,
  String? referralCode,
  String? aadhaarCardNo,
  String? aadhaarCardPhoto,
  String? qrCode,
  String? accountHolderName,
  String? accountNumber,
  String? ifscCode,
  String? bankName,
}) => Data(  userId: userId ?? _userId,
  userType: userType ?? _userType,
  userPhone: userPhone ?? _userPhone,
  firstname: firstname ?? _firstname,
  lastname: lastname ?? _lastname,
  userFullname: userFullname ?? _userFullname,
  userEmail: userEmail ?? _userEmail,
  userBdate: userBdate ?? _userBdate,
  userPassword: userPassword ?? _userPassword,
  userCity: userCity ?? _userCity,
  varificationCode: varificationCode ?? _varificationCode,
  userImage: userImage ?? _userImage,
  pincode: pincode ?? _pincode,
  socityId: socityId ?? _socityId,
  houseNo: houseNo ?? _houseNo,
  mobileVerified: mobileVerified ?? _mobileVerified,
  userGcmCode: userGcmCode ?? _userGcmCode,
  userIosToken: userIosToken ?? _userIosToken,
  varifiedToken: varifiedToken ?? _varifiedToken,
  status: status ?? _status,
  regCode: regCode ?? _regCode,
  wallet: wallet ?? _wallet,
  rewards: rewards ?? _rewards,
  created: created ?? _created,
  modified: modified ?? _modified,
  otp: otp ?? _otp,
  otpStatus: otpStatus ?? _otpStatus,
  social: social ?? _social,
  facebookID: facebookID ?? _facebookID,
  isEmailVerified: isEmailVerified ?? _isEmailVerified,
  vehicleType: vehicleType ?? _vehicleType,
  vehicleNo: vehicleNo ?? _vehicleNo,
  drivingLicenceNo: drivingLicenceNo ?? _drivingLicenceNo,
  drivingLicencePhoto: drivingLicencePhoto ?? _drivingLicencePhoto,
  loginStatus: loginStatus ?? _loginStatus,
  isAvaible: isAvaible ?? _isAvaible,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  referralCode: referralCode ?? _referralCode,
  aadhaarCardNo: aadhaarCardNo ?? _aadhaarCardNo,
  aadhaarCardPhoto: aadhaarCardPhoto ?? _aadhaarCardPhoto,
  qrCode: qrCode ?? _qrCode,
  accountHolderName: accountHolderName ?? _accountHolderName,
  accountNumber: accountNumber ?? _accountNumber,
  ifscCode: ifscCode ?? _ifscCode,
  bankName: bankName ?? _bankName,
);
  String? get userId => _userId;
  String? get userType => _userType;
  String? get userPhone => _userPhone;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get userFullname => _userFullname;
  String? get userEmail => _userEmail;
  String? get userBdate => _userBdate;
  String? get userPassword => _userPassword;
  String? get userCity => _userCity;
  String? get varificationCode => _varificationCode;
  String? get userImage => _userImage;
  String? get pincode => _pincode;
  String? get socityId => _socityId;
  String? get houseNo => _houseNo;
  String? get mobileVerified => _mobileVerified;
  String? get userGcmCode => _userGcmCode;
  String? get userIosToken => _userIosToken;
  String? get varifiedToken => _varifiedToken;
  String? get status => _status;
  String? get regCode => _regCode;
  String? get wallet => _wallet;
  String? get rewards => _rewards;
  String? get created => _created;
  String? get modified => _modified;
  String? get otp => _otp;
  String? get otpStatus => _otpStatus;
  String? get social => _social;
  String? get facebookID => _facebookID;
  String? get isEmailVerified => _isEmailVerified;
  String? get vehicleType => _vehicleType;
  String? get vehicleNo => _vehicleNo;
  String? get drivingLicenceNo => _drivingLicenceNo;
  String? get drivingLicencePhoto => _drivingLicencePhoto;
  String? get loginStatus => _loginStatus;
  String? get isAvaible => _isAvaible;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get referralCode => _referralCode;
  String? get aadhaarCardNo => _aadhaarCardNo;
  String? get aadhaarCardPhoto => _aadhaarCardPhoto;
  String? get qrCode => _qrCode;
  String? get accountHolderName => _accountHolderName;
  String? get accountNumber => _accountNumber;
  String? get ifscCode => _ifscCode;
  String? get bankName => _bankName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['user_type'] = _userType;
    map['user_phone'] = _userPhone;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['user_fullname'] = _userFullname;
    map['user_email'] = _userEmail;
    map['user_bdate'] = _userBdate;
    map['user_password'] = _userPassword;
    map['user_city'] = _userCity;
    map['varification_code'] = _varificationCode;
    map['user_image'] = _userImage;
    map['pincode'] = _pincode;
    map['socity_id'] = _socityId;
    map['house_no'] = _houseNo;
    map['mobile_verified'] = _mobileVerified;
    map['user_gcm_code'] = _userGcmCode;
    map['user_ios_token'] = _userIosToken;
    map['varified_token'] = _varifiedToken;
    map['status'] = _status;
    map['reg_code'] = _regCode;
    map['wallet'] = _wallet;
    map['rewards'] = _rewards;
    map['created'] = _created;
    map['modified'] = _modified;
    map['otp'] = _otp;
    map['otp_status'] = _otpStatus;
    map['social'] = _social;
    map['facebookID'] = _facebookID;
    map['is_email_verified'] = _isEmailVerified;
    map['vehicle_type'] = _vehicleType;
    map['vehicle_no'] = _vehicleNo;
    map['driving_licence_no'] = _drivingLicenceNo;
    map['driving_licence_photo'] = _drivingLicencePhoto;
    map['login_status'] = _loginStatus;
    map['is_avaible'] = _isAvaible;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['referral_code'] = _referralCode;
    map['aadhaar_card_no'] = _aadhaarCardNo;
    map['aadhaar_card_photo'] = _aadhaarCardPhoto;
    map['qr_code'] = _qrCode;
    map['account_holder_name'] = _accountHolderName;
    map['account_number'] = _accountNumber;
    map['ifsc_code'] = _ifscCode;
    map['bank_name'] = _bankName;
    return map;
  }

}