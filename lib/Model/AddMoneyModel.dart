/// status : 1
/// error_code : 200
/// error_line : 1370
/// message : "Money added to wallet"
/// data : {"wallet":-46573}

class AddMoneyModel {
  AddMoneyModel({
      num? status, 
      num? errorCode, 
      num? errorLine, 
      String? message, 
      Data? data,}){
    _status = status;
    _errorCode = errorCode;
    _errorLine = errorLine;
    _message = message;
    _data = data;
}

  AddMoneyModel.fromJson(dynamic json) {
    _status = json['status'];
    _errorCode = json['error_code'];
    _errorLine = json['error_line'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _status;
  num? _errorCode;
  num? _errorLine;
  String? _message;
  Data? _data;
AddMoneyModel copyWith({  num? status,
  num? errorCode,
  num? errorLine,
  String? message,
  Data? data,
}) => AddMoneyModel(  status: status ?? _status,
  errorCode: errorCode ?? _errorCode,
  errorLine: errorLine ?? _errorLine,
  message: message ?? _message,
  data: data ?? _data,
);
  num? get status => _status;
  num? get errorCode => _errorCode;
  num? get errorLine => _errorLine;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['error_code'] = _errorCode;
    map['error_line'] = _errorLine;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// wallet : -46573

class Data {
  Data({
      num? wallet,}){
    _wallet = wallet;
}

  Data.fromJson(dynamic json) {
    _wallet = json['wallet'];
  }
  num? _wallet;
Data copyWith({  num? wallet,
}) => Data(  wallet: wallet ?? _wallet,
);
  num? get wallet => _wallet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['wallet'] = _wallet;
    return map;
  }

}