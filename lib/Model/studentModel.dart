/// response_code : "1"
/// message : "Student Data Get Successfully"
/// status : "success"
/// data : [{"student_id":"7","driver_name":"Kamal","driver_mobile":"7898787457","driver_email":"Kamal@gmail.com","par_address":"Vijay Nagar, Indore, Madhya Pradesh 452010, India","id":"8","username":"Nitish","email":"Happyvally@gmail.com","countrycode":"","mobile":"2147483647","password":"d41d8cd98f00b204e9800998ecf8427e","profile_pic":"63e5fe22a3326.jpg","facebook_id":"","type":"","occupation":"Teacher","birth_no":"FHGSAG8787877","add_class":"1","age":"2","relation":"Father","religion":"Hindu","dob":"2022-12-20","roll_no":"","division":"","emergency_no":"","blood":"","isGold":"0","school_id":"8","driver_id":"19","address":"Vijay Nagar, Indore, Madhya Pradesh 452010, India","city":"","country":"","device_token":"","agreecheck":"0","otp":null,"status":"0","sex":"Boy","wallet":"0.00","oauth_provider":null,"oauth_uid":null,"last_login":null,"created_at":"2023-02-10 07:53:25","updated_at":"2023-02-10 07:53:25","refferal_code":"School929842","friend_code":"","parent_id":"20","uname":"School Of Happy Valley","dise_code":"44","latitude":"","longitude":"","gst_no":"","online_status":"","profile_image":"63e5f7f532429.jpg","band_details":null,"c_person":"Tesfad","school_address":"Vijay Nagar, Indore, Madhya Pradesh 452010, India","school_image":"63e5f7f532429.jpg"},{"student_id":"10","driver_name":"Kamal","driver_mobile":"7898787457","driver_email":"Kamal@gmail.com","par_address":"Vijay Nagar, Indore, Madhya Pradesh 452010, India","id":"8","username":"Ganesh","email":"Happyvally@gmail.com","countrycode":"","mobile":"2147483647","password":"d41d8cd98f00b204e9800998ecf8427e","profile_pic":"63e6187eaa0b3.jpg","facebook_id":"","type":"","occupation":"Teacher","birth_no":"FHGSAG8787877","add_class":"10","age":"5","relation":"Father","religion":"Hindu","dob":"2021-02-01","roll_no":"4654646","division":"Pass","emergency_no":"7898798798797","blood":"O+","isGold":"0","school_id":"8","driver_id":"19","address":"Vijay Nagar, Indore, Madhya Pradesh 452010, India","city":"","country":"","device_token":"","agreecheck":"0","otp":null,"status":"0","sex":"Boy","wallet":"0.00","oauth_provider":null,"oauth_uid":null,"last_login":null,"created_at":"2023-02-10 07:53:25","updated_at":"2023-02-10 07:53:25","refferal_code":"School929842","friend_code":"","parent_id":"20","uname":"School Of Happy Valley","dise_code":"44","latitude":"","longitude":"","gst_no":"","online_status":"","profile_image":"63e5f7f532429.jpg","band_details":null,"c_person":"Tesfad","school_address":"Vijay Nagar, Indore, Madhya Pradesh 452010, India","school_image":"63e5f7f532429.jpg"},{"student_id":"27","driver_name":"Kamal","driver_mobile":"7898787457","driver_email":"Kamal@gmail.com","par_address":"Vijay Nagar, Indore, Madhya Pradesh 452010, India","id":"8","username":"Jay kanathe","email":"Happyvally@gmail.com","countrycode":"","mobile":"2147483647","password":"d41d8cd98f00b204e9800998ecf8427e","profile_pic":"","facebook_id":"","type":"","occupation":"Worker","birth_no":"6667277282","add_class":"4","age":"21","relation":"Child ","religion":"Hindu","dob":"20-02-2023","roll_no":"748848383","division":"78","emergency_no":"6565565664","blood":"B","isGold":"0","school_id":"8","driver_id":"19","address":"Vijay Nagar, Indore, Madhya Pradesh 452010, India","city":"","country":"","device_token":"","agreecheck":"0","otp":null,"status":"0","sex":"male","wallet":"0.00","oauth_provider":null,"oauth_uid":null,"last_login":null,"created_at":"2023-02-10 07:53:25","updated_at":"2023-02-10 07:53:25","refferal_code":"School929842","friend_code":"","parent_id":"20","uname":"School Of Happy Valley","dise_code":"44","latitude":"","longitude":"","gst_no":"","online_status":"","profile_image":"63e5f7f532429.jpg","band_details":null,"c_person":"Tesfad","school_address":"Vijay Nagar, Indore, Madhya Pradesh 452010, India","school_image":"63e5f7f532429.jpg"},{"student_id":"28","driver_name":"Kamal","driver_mobile":"7898787457","driver_email":"Kamal@gmail.com","par_address":"Vijay Nagar, Indore, Madhya Pradesh 452010, India","id":"8","username":"Test","email":"Happyvally@gmail.com","countrycode":"","mobile":"2147483647","password":"d41d8cd98f00b204e9800998ecf8427e","profile_pic":"63f45e4ad2532.jpg","facebook_id":"","type":"","occupation":"Worker","birth_no":"464456877787","add_class":"6","age":"23","relation":"Son","religion":"Hindu","dob":"2023-02-14","roll_no":"346788879","division":"First","emergency_no":"5255558575","blood":"B+","isGold":"0","school_id":"8","driver_id":"19","address":"Vijay Nagar, Indore, Madhya Pradesh 452010, India","city":"","country":"","device_token":"","agreecheck":"0","otp":null,"status":"0","sex":"Boy","wallet":"0.00","oauth_provider":null,"oauth_uid":null,"last_login":null,"created_at":"2023-02-10 07:53:25","updated_at":"2023-02-10 07:53:25","refferal_code":"School929842","friend_code":"","parent_id":"20","uname":"School Of Happy Valley","dise_code":"44","latitude":"","longitude":"","gst_no":"","online_status":"","profile_image":"63e5f7f532429.jpg","band_details":null,"c_person":"Tesfad","school_address":"Vijay Nagar, Indore, Madhya Pradesh 452010, India","school_image":"63e5f7f532429.jpg"}]

class StudentModel {
  StudentModel({
      String? responseCode, 
      String? message, 
      String? status, 
      List<Data>? data,}){
    _responseCode = responseCode;
    _message = message;
    _status = status;
    _data = data;
}

  StudentModel.fromJson(dynamic json) {
    _responseCode = json['response_code'];
    _message = json['message'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _responseCode;
  String? _message;
  String? _status;
  List<Data>? _data;
StudentModel copyWith({  String? responseCode,
  String? message,
  String? status,
  List<Data>? data,
}) => StudentModel(  responseCode: responseCode ?? _responseCode,
  message: message ?? _message,
  status: status ?? _status,
  data: data ?? _data,
);
  String? get responseCode => _responseCode;
  String? get message => _message;
  String? get status => _status;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response_code'] = _responseCode;
    map['message'] = _message;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// student_id : "7"
/// driver_name : "Kamal"
/// driver_mobile : "7898787457"
/// driver_email : "Kamal@gmail.com"
/// par_address : "Vijay Nagar, Indore, Madhya Pradesh 452010, India"
/// id : "8"
/// username : "Nitish"
/// email : "Happyvally@gmail.com"
/// countrycode : ""
/// mobile : "2147483647"
/// password : "d41d8cd98f00b204e9800998ecf8427e"
/// profile_pic : "63e5fe22a3326.jpg"
/// facebook_id : ""
/// type : ""
/// occupation : "Teacher"
/// birth_no : "FHGSAG8787877"
/// add_class : "1"
/// age : "2"
/// relation : "Father"
/// religion : "Hindu"
/// dob : "2022-12-20"
/// roll_no : ""
/// division : ""
/// emergency_no : ""
/// blood : ""
/// isGold : "0"
/// school_id : "8"
/// driver_id : "19"
/// address : "Vijay Nagar, Indore, Madhya Pradesh 452010, India"
/// city : ""
/// country : ""
/// device_token : ""
/// agreecheck : "0"
/// otp : null
/// status : "0"
/// sex : "Boy"
/// wallet : "0.00"
/// oauth_provider : null
/// oauth_uid : null
/// last_login : null
/// created_at : "2023-02-10 07:53:25"
/// updated_at : "2023-02-10 07:53:25"
/// refferal_code : "School929842"
/// friend_code : ""
/// parent_id : "20"
/// uname : "School Of Happy Valley"
/// dise_code : "44"
/// latitude : ""
/// longitude : ""
/// gst_no : ""
/// online_status : ""
/// profile_image : "63e5f7f532429.jpg"
/// band_details : null
/// c_person : "Tesfad"
/// school_address : "Vijay Nagar, Indore, Madhya Pradesh 452010, India"
/// school_image : "63e5f7f532429.jpg"

class Data {
  Data({
      String? studentId, 
      String? driverName, 
      String? driverMobile, 
      String? driverEmail, 
      String? parAddress, 
      String? id, 
      String? username, 
      String? email, 
      String? countrycode, 
      String? mobile, 
      String? password, 
      String? profilePic, 
      String? facebookId, 
      String? type, 
      String? occupation, 
      String? birthNo, 
      String? addClass, 
      String? age, 
      String? relation, 
      String? religion, 
      String? dob, 
      String? rollNo, 
      String? division, 
      String? emergencyNo, 
      String? blood, 
      String? isGold, 
      String? schoolId, 
      String? driverId, 
      String? address, 
      String? city, 
      String? country, 
      String? deviceToken, 
      String? agreecheck, 
      dynamic otp, 
      String? status, 
      String? sex, 
      String? wallet, 
      dynamic oauthProvider, 
      dynamic oauthUid, 
      dynamic lastLogin, 
      String? createdAt, 
      String? updatedAt, 
      String? refferalCode, 
      String? friendCode, 
      String? parentId, 
      String? uname, 
      String? diseCode, 
      String? latitude, 
      String? longitude, 
      String? gstNo, 
      String? onlineStatus, 
      String? profileImage, 
      dynamic bandDetails, 
      String? cPerson, 
      String? schoolAddress, 
      String? schoolImage,}){
    _studentId = studentId;
    _driverName = driverName;
    _driverMobile = driverMobile;
    _driverEmail = driverEmail;
    _parAddress = parAddress;
    _id = id;
    _username = username;
    _email = email;
    _countrycode = countrycode;
    _mobile = mobile;
    _password = password;
    _profilePic = profilePic;
    _facebookId = facebookId;
    _type = type;
    _occupation = occupation;
    _birthNo = birthNo;
    _addClass = addClass;
    _age = age;
    _relation = relation;
    _religion = religion;
    _dob = dob;
    _rollNo = rollNo;
    _division = division;
    _emergencyNo = emergencyNo;
    _blood = blood;
    _isGold = isGold;
    _schoolId = schoolId;
    _driverId = driverId;
    _address = address;
    _city = city;
    _country = country;
    _deviceToken = deviceToken;
    _agreecheck = agreecheck;
    _otp = otp;
    _status = status;
    _sex = sex;
    _wallet = wallet;
    _oauthProvider = oauthProvider;
    _oauthUid = oauthUid;
    _lastLogin = lastLogin;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _refferalCode = refferalCode;
    _friendCode = friendCode;
    _parentId = parentId;
    _uname = uname;
    _diseCode = diseCode;
    _latitude = latitude;
    _longitude = longitude;
    _gstNo = gstNo;
    _onlineStatus = onlineStatus;
    _profileImage = profileImage;
    _bandDetails = bandDetails;
    _cPerson = cPerson;
    _schoolAddress = schoolAddress;
    _schoolImage = schoolImage;
}

  Data.fromJson(dynamic json) {
    _studentId = json['student_id'];
    _driverName = json['driver_name'];
    _driverMobile = json['driver_mobile'];
    _driverEmail = json['driver_email'];
    _parAddress = json['par_address'];
    _id = json['id'];
    _username = json['username'];
    _email = json['email'];
    _countrycode = json['countrycode'];
    _mobile = json['mobile'];
    _password = json['password'];
    _profilePic = json['profile_pic'];
    _facebookId = json['facebook_id'];
    _type = json['type'];
    _occupation = json['occupation'];
    _birthNo = json['birth_no'];
    _addClass = json['add_class'];
    _age = json['age'];
    _relation = json['relation'];
    _religion = json['religion'];
    _dob = json['dob'];
    _rollNo = json['roll_no'];
    _division = json['division'];
    _emergencyNo = json['emergency_no'];
    _blood = json['blood'];
    _isGold = json['isGold'];
    _schoolId = json['school_id'];
    _driverId = json['driver_id'];
    _address = json['address'];
    _city = json['city'];
    _country = json['country'];
    _deviceToken = json['device_token'];
    _agreecheck = json['agreecheck'];
    _otp = json['otp'];
    _status = json['status'];
    _sex = json['sex'];
    _wallet = json['wallet'];
    _oauthProvider = json['oauth_provider'];
    _oauthUid = json['oauth_uid'];
    _lastLogin = json['last_login'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _refferalCode = json['refferal_code'];
    _friendCode = json['friend_code'];
    _parentId = json['parent_id'];
    _uname = json['uname'];
    _diseCode = json['dise_code'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _gstNo = json['gst_no'];
    _onlineStatus = json['online_status'];
    _profileImage = json['profile_image'];
    _bandDetails = json['band_details'];
    _cPerson = json['c_person'];
    _schoolAddress = json['school_address'];
    _schoolImage = json['school_image'];
  }
  String? _studentId;
  String? _driverName;
  String? _driverMobile;
  String? _driverEmail;
  String? _parAddress;
  String? _id;
  String? _username;
  String? _email;
  String? _countrycode;
  String? _mobile;
  String? _password;
  String? _profilePic;
  String? _facebookId;
  String? _type;
  String? _occupation;
  String? _birthNo;
  String? _addClass;
  String? _age;
  String? _relation;
  String? _religion;
  String? _dob;
  String? _rollNo;
  String? _division;
  String? _emergencyNo;
  String? _blood;
  String? _isGold;
  String? _schoolId;
  String? _driverId;
  String? _address;
  String? _city;
  String? _country;
  String? _deviceToken;
  String? _agreecheck;
  dynamic _otp;
  String? _status;
  String? _sex;
  String? _wallet;
  dynamic _oauthProvider;
  dynamic _oauthUid;
  dynamic _lastLogin;
  String? _createdAt;
  String? _updatedAt;
  String? _refferalCode;
  String? _friendCode;
  String? _parentId;
  String? _uname;
  String? _diseCode;
  String? _latitude;
  String? _longitude;
  String? _gstNo;
  String? _onlineStatus;
  String? _profileImage;
  dynamic _bandDetails;
  String? _cPerson;
  String? _schoolAddress;
  String? _schoolImage;
Data copyWith({  String? studentId,
  String? driverName,
  String? driverMobile,
  String? driverEmail,
  String? parAddress,
  String? id,
  String? username,
  String? email,
  String? countrycode,
  String? mobile,
  String? password,
  String? profilePic,
  String? facebookId,
  String? type,
  String? occupation,
  String? birthNo,
  String? addClass,
  String? age,
  String? relation,
  String? religion,
  String? dob,
  String? rollNo,
  String? division,
  String? emergencyNo,
  String? blood,
  String? isGold,
  String? schoolId,
  String? driverId,
  String? address,
  String? city,
  String? country,
  String? deviceToken,
  String? agreecheck,
  dynamic otp,
  String? status,
  String? sex,
  String? wallet,
  dynamic oauthProvider,
  dynamic oauthUid,
  dynamic lastLogin,
  String? createdAt,
  String? updatedAt,
  String? refferalCode,
  String? friendCode,
  String? parentId,
  String? uname,
  String? diseCode,
  String? latitude,
  String? longitude,
  String? gstNo,
  String? onlineStatus,
  String? profileImage,
  dynamic bandDetails,
  String? cPerson,
  String? schoolAddress,
  String? schoolImage,
}) => Data(  studentId: studentId ?? _studentId,
  driverName: driverName ?? _driverName,
  driverMobile: driverMobile ?? _driverMobile,
  driverEmail: driverEmail ?? _driverEmail,
  parAddress: parAddress ?? _parAddress,
  id: id ?? _id,
  username: username ?? _username,
  email: email ?? _email,
  countrycode: countrycode ?? _countrycode,
  mobile: mobile ?? _mobile,
  password: password ?? _password,
  profilePic: profilePic ?? _profilePic,
  facebookId: facebookId ?? _facebookId,
  type: type ?? _type,
  occupation: occupation ?? _occupation,
  birthNo: birthNo ?? _birthNo,
  addClass: addClass ?? _addClass,
  age: age ?? _age,
  relation: relation ?? _relation,
  religion: religion ?? _religion,
  dob: dob ?? _dob,
  rollNo: rollNo ?? _rollNo,
  division: division ?? _division,
  emergencyNo: emergencyNo ?? _emergencyNo,
  blood: blood ?? _blood,
  isGold: isGold ?? _isGold,
  schoolId: schoolId ?? _schoolId,
  driverId: driverId ?? _driverId,
  address: address ?? _address,
  city: city ?? _city,
  country: country ?? _country,
  deviceToken: deviceToken ?? _deviceToken,
  agreecheck: agreecheck ?? _agreecheck,
  otp: otp ?? _otp,
  status: status ?? _status,
  sex: sex ?? _sex,
  wallet: wallet ?? _wallet,
  oauthProvider: oauthProvider ?? _oauthProvider,
  oauthUid: oauthUid ?? _oauthUid,
  lastLogin: lastLogin ?? _lastLogin,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  refferalCode: refferalCode ?? _refferalCode,
  friendCode: friendCode ?? _friendCode,
  parentId: parentId ?? _parentId,
  uname: uname ?? _uname,
  diseCode: diseCode ?? _diseCode,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  gstNo: gstNo ?? _gstNo,
  onlineStatus: onlineStatus ?? _onlineStatus,
  profileImage: profileImage ?? _profileImage,
  bandDetails: bandDetails ?? _bandDetails,
  cPerson: cPerson ?? _cPerson,
  schoolAddress: schoolAddress ?? _schoolAddress,
  schoolImage: schoolImage ?? _schoolImage,
);
  String? get studentId => _studentId;
  String? get driverName => _driverName;
  String? get driverMobile => _driverMobile;
  String? get driverEmail => _driverEmail;
  String? get parAddress => _parAddress;
  String? get id => _id;
  String? get username => _username;
  String? get email => _email;
  String? get countrycode => _countrycode;
  String? get mobile => _mobile;
  String? get password => _password;
  String? get profilePic => _profilePic;
  String? get facebookId => _facebookId;
  String? get type => _type;
  String? get occupation => _occupation;
  String? get birthNo => _birthNo;
  String? get addClass => _addClass;
  String? get age => _age;
  String? get relation => _relation;
  String? get religion => _religion;
  String? get dob => _dob;
  String? get rollNo => _rollNo;
  String? get division => _division;
  String? get emergencyNo => _emergencyNo;
  String? get blood => _blood;
  String? get isGold => _isGold;
  String? get schoolId => _schoolId;
  String? get driverId => _driverId;
  String? get address => _address;
  String? get city => _city;
  String? get country => _country;
  String? get deviceToken => _deviceToken;
  String? get agreecheck => _agreecheck;
  dynamic get otp => _otp;
  String? get status => _status;
  String? get sex => _sex;
  String? get wallet => _wallet;
  dynamic get oauthProvider => _oauthProvider;
  dynamic get oauthUid => _oauthUid;
  dynamic get lastLogin => _lastLogin;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get refferalCode => _refferalCode;
  String? get friendCode => _friendCode;
  String? get parentId => _parentId;
  String? get uname => _uname;
  String? get diseCode => _diseCode;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get gstNo => _gstNo;
  String? get onlineStatus => _onlineStatus;
  String? get profileImage => _profileImage;
  dynamic get bandDetails => _bandDetails;
  String? get cPerson => _cPerson;
  String? get schoolAddress => _schoolAddress;
  String? get schoolImage => _schoolImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['student_id'] = _studentId;
    map['driver_name'] = _driverName;
    map['driver_mobile'] = _driverMobile;
    map['driver_email'] = _driverEmail;
    map['par_address'] = _parAddress;
    map['id'] = _id;
    map['username'] = _username;
    map['email'] = _email;
    map['countrycode'] = _countrycode;
    map['mobile'] = _mobile;
    map['password'] = _password;
    map['profile_pic'] = _profilePic;
    map['facebook_id'] = _facebookId;
    map['type'] = _type;
    map['occupation'] = _occupation;
    map['birth_no'] = _birthNo;
    map['add_class'] = _addClass;
    map['age'] = _age;
    map['relation'] = _relation;
    map['religion'] = _religion;
    map['dob'] = _dob;
    map['roll_no'] = _rollNo;
    map['division'] = _division;
    map['emergency_no'] = _emergencyNo;
    map['blood'] = _blood;
    map['isGold'] = _isGold;
    map['school_id'] = _schoolId;
    map['driver_id'] = _driverId;
    map['address'] = _address;
    map['city'] = _city;
    map['country'] = _country;
    map['device_token'] = _deviceToken;
    map['agreecheck'] = _agreecheck;
    map['otp'] = _otp;
    map['status'] = _status;
    map['sex'] = _sex;
    map['wallet'] = _wallet;
    map['oauth_provider'] = _oauthProvider;
    map['oauth_uid'] = _oauthUid;
    map['last_login'] = _lastLogin;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['refferal_code'] = _refferalCode;
    map['friend_code'] = _friendCode;
    map['parent_id'] = _parentId;
    map['uname'] = _uname;
    map['dise_code'] = _diseCode;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['gst_no'] = _gstNo;
    map['online_status'] = _onlineStatus;
    map['profile_image'] = _profileImage;
    map['band_details'] = _bandDetails;
    map['c_person'] = _cPerson;
    map['school_address'] = _schoolAddress;
    map['school_image'] = _schoolImage;
    return map;
  }

}