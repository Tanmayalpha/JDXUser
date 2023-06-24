/// response_code : "1"
/// message : "Student Register"
/// data : true

class SignUpModel {
  SignUpModel({
      String? responseCode, 
      String? message, 
      bool? data,}){
    _responseCode = responseCode;
    _message = message;
    _data = data;
}

  SignUpModel.fromJson(dynamic json) {
    _responseCode = json['response_code'];
    _message = json['message'];
    _data = json['data'];
  }
  String? _responseCode;
  String? _message;
  bool? _data;
SignUpModel copyWith({  String? responseCode,
  String? message,
  bool? data,
}) => SignUpModel(  responseCode: responseCode ?? _responseCode,
  message: message ?? _message,
  data: data ?? _data,
);
  String? get responseCode => _responseCode;
  String? get message => _message;
  bool? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response_code'] = _responseCode;
    map['message'] = _message;
    map['data'] = _data;
    return map;
  }

}