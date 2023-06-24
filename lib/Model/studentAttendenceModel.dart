/// response_code : "1"
/// message : "Student Data Get Successfully"
/// status : "success"
/// data : [{"id":"28","date":"09-02-2023","status":"1","student_id":"28","pickup_time":"12:00","drop_time":"14:10","username":"Test","email":"","countrycode":"","mobile":"","password":"","profile_pic":"63f45e4ad2532.jpg","facebook_id":"","type":"","occupation":"Worker","birth_no":"464456877787","add_class":"6","age":"23","relation":"Son","religion":"Hindu","dob":"2023-02-14","roll_no":"346788879","division":"First","emergency_no":"5255558575","blood":"B+","isGold":"0","school_id":"8","driver_id":"19","address":"","city":"","country":"","device_token":"","agreecheck":"0","otp":null,"sex":"Boy","wallet":"0.00","oauth_provider":null,"oauth_uid":null,"last_login":null,"created_at":"2023-02-21 05:07:40","updated_at":"2023-02-21 06:01:46","refferal_code":"e-GATE519181","friend_code":"","parent_id":"20"},{"id":"28","date":"10-02-2023","status":"1","student_id":"28","pickup_time":"\r\n","drop_time":"","username":"Test","email":"","countrycode":"","mobile":"","password":"","profile_pic":"63f45e4ad2532.jpg","facebook_id":"","type":"","occupation":"Worker","birth_no":"464456877787","add_class":"6","age":"23","relation":"Son","religion":"Hindu","dob":"2023-02-14","roll_no":"346788879","division":"First","emergency_no":"5255558575","blood":"B+","isGold":"0","school_id":"8","driver_id":"19","address":"","city":"","country":"","device_token":"","agreecheck":"0","otp":null,"sex":"Boy","wallet":"0.00","oauth_provider":null,"oauth_uid":null,"last_login":null,"created_at":"2023-02-21 05:07:40","updated_at":"2023-02-21 06:01:46","refferal_code":"e-GATE519181","friend_code":"","parent_id":"20"}]

class StudentAttendenceModel {
  StudentAttendenceModel({
      String? responseCode, 
      String? message, 
      String? status, 
      List<Data1>? data,}){
    _responseCode = responseCode;
    _message = message;
    _status = status;
    _data = data;
}

  StudentAttendenceModel.fromJson(dynamic json) {
    _responseCode = json['response_code'];
    _message = json['message'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data1.fromJson(v));
      });
    }
  }
  String? _responseCode;
  String? _message;
  String? _status;
  List<Data1>? _data;
StudentAttendenceModel copyWith({  String? responseCode,
  String? message,
  String? status,
  List<Data1>? data,
}) => StudentAttendenceModel(  responseCode: responseCode ?? _responseCode,
  message: message ?? _message,
  status: status ?? _status,
  data: data ?? _data,
);
  String? get responseCode => _responseCode;
  String? get message => _message;
  String? get status => _status;
  List<Data1>? get data => _data;

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

/// id : "28"
/// date : "09-02-2023"
/// status : "1"
/// student_id : "28"
/// pickup_time : "12:00"
/// drop_time : "14:10"
/// username : "Test"
/// email : ""
/// countrycode : ""
/// mobile : ""
/// password : ""
/// profile_pic : "63f45e4ad2532.jpg"
/// facebook_id : ""
/// type : ""
/// occupation : "Worker"
/// birth_no : "464456877787"
/// add_class : "6"
/// age : "23"
/// relation : "Son"
/// religion : "Hindu"
/// dob : "2023-02-14"
/// roll_no : "346788879"
/// division : "First"
/// emergency_no : "5255558575"
/// blood : "B+"
/// isGold : "0"
/// school_id : "8"
/// driver_id : "19"
/// address : ""
/// city : ""
/// country : ""
/// device_token : ""
/// agreecheck : "0"
/// otp : null
/// sex : "Boy"
/// wallet : "0.00"
/// oauth_provider : null
/// oauth_uid : null
/// last_login : null
/// created_at : "2023-02-21 05:07:40"
/// updated_at : "2023-02-21 06:01:46"
/// refferal_code : "e-GATE519181"
/// friend_code : ""
/// parent_id : "20"

class Data1 {
  Data1({
      String? id, 
      String? date, 
      String? status, 
      String? studentId, 
      String? pickupTime, 
      String? dropTime, 
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
      String? sex, 
      String? wallet, 
      dynamic oauthProvider, 
      dynamic oauthUid, 
      dynamic lastLogin, 
      String? createdAt, 
      String? updatedAt, 
      String? refferalCode, 
      String? friendCode, 
      String? parentId,}){
    _id = id;
    _date = date;
    _status = status;
    _studentId = studentId;
    _pickupTime = pickupTime;
    _dropTime = dropTime;
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
}

  Data1.fromJson(dynamic json) {
    _id = json['id'];
    _date = json['date'];
    _status = json['status'];
    _studentId = json['student_id'];
    _pickupTime = json['pickup_time'];
    _dropTime = json['drop_time'];
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
  }
  String? _id;
  String? _date;
  String? _status;
  String? _studentId;
  String? _pickupTime;
  String? _dropTime;
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
Data1 copyWith({  String? id,
  String? date,
  String? status,
  String? studentId,
  String? pickupTime,
  String? dropTime,
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
}) => Data1(  id: id ?? _id,
  date: date ?? _date,
  status: status ?? _status,
  studentId: studentId ?? _studentId,
  pickupTime: pickupTime ?? _pickupTime,
  dropTime: dropTime ?? _dropTime,
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
);
  String? get id => _id;
  String? get date => _date;
  String? get status => _status;
  String? get studentId => _studentId;
  String? get pickupTime => _pickupTime;
  String? get dropTime => _dropTime;
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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['date'] = _date;
    map['status'] = _status;
    map['student_id'] = _studentId;
    map['pickup_time'] = _pickupTime;
    map['drop_time'] = _dropTime;
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
    return map;
  }

}