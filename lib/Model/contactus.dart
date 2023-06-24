/// status : true
/// message : "AboutUs Page."
/// Data : {"pg_descri":"<p>ParcelDelivery@gmail.com</p>"}

class Contactus {
  Contactus({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  Contactus.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
Contactus copyWith({  bool? status,
  String? message,
  Data? data,
}) => Contactus(  status: status ?? _status,
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
      map['Data'] = _data?.toJson();
    }
    return map;
  }

}

/// pg_descri : "<p>ParcelDelivery@gmail.com</p>"

class Data {
  Data({
      String? pgDescri,}){
    _pgDescri = pgDescri;
}

  Data.fromJson(dynamic json) {
    _pgDescri = json['pg_descri'];
  }
  String? _pgDescri;
Data copyWith({  String? pgDescri,
}) => Data(  pgDescri: pgDescri ?? _pgDescri,
);
  String? get pgDescri => _pgDescri;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pg_descri'] = _pgDescri;
    return map;
  }

}