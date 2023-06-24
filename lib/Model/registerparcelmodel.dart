/// status : true
/// message : "Parcel send Successfully"
/// sale_id : "410,411,412"
/// order_id : 297

class Registerparcelmodel {
  Registerparcelmodel({
      bool? status, 
      String? message, 
      String? saleId, 
      num? orderId,}){
    _status = status;
    _message = message;
    _saleId = saleId;
    _orderId = orderId;
}

  Registerparcelmodel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _saleId = json['sale_id'];
    _orderId = json['order_id'];
  }
  bool? _status;
  String? _message;
  String? _saleId;
  num? _orderId;
Registerparcelmodel copyWith({  bool? status,
  String? message,
  String? saleId,
  num? orderId,
}) => Registerparcelmodel(  status: status ?? _status,
  message: message ?? _message,
  saleId: saleId ?? _saleId,
  orderId: orderId ?? _orderId,
);
  bool? get status => _status;
  String? get message => _message;
  String? get saleId => _saleId;
  num? get orderId => _orderId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['sale_id'] = _saleId;
    map['order_id'] = _orderId;
    return map;
  }

}