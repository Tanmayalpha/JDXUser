/// response : true
/// message : "User Register Sucessfully.."

class RegisterModel {
  RegisterModel({
      bool? response, 
      String? message,}){
    _response = response;
    _message = message;
}

  RegisterModel.fromJson(dynamic json) {
    _response = json['response'];
    _message = json['message'];
  }
  bool? _response;
  String? _message;
RegisterModel copyWith({  bool? response,
  String? message,
}) => RegisterModel(  response: response ?? _response,
  message: message ?? _message,
);
  bool? get response => _response;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response'] = _response;
    map['message'] = _message;
    return map;
  }

}