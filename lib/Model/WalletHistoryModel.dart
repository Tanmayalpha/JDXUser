/// status : 1
/// error_code : 200
/// error_line : 1432
/// message : "Record found"
/// wallet : "-46525"
/// data : [{"id":"371","user_id":"210","amount":"0","sign":"+","payment_type":"Deposit","payment_status":"Success","payment_method":"0","order_id":"0","create_dt":"2021-11-25","status":"0","wallet_status":"0"},{"id":"471","user_id":"210","amount":"24","sign":"+","payment_type":"Deposit","payment_status":"Success","payment_method":"0","order_id":"0","create_dt":"2023-02-27","status":"0","wallet_status":"0"},{"id":"472","user_id":"210","amount":"24","sign":"+","payment_type":"Deposit","payment_status":"Success","payment_method":"0","order_id":"0","create_dt":"2023-03-06","status":"0","wallet_status":"0"},{"id":"473","user_id":"210","amount":"24","sign":"+","payment_type":"Deposit","payment_status":"Success","payment_method":"0","order_id":"0","create_dt":"2023-03-07","status":"0","wallet_status":"0"},{"id":"474","user_id":"210","amount":"24","sign":"+","payment_type":"Deposit","payment_status":"Success","payment_method":"0","order_id":"0","create_dt":"2023-03-07","status":"0","wallet_status":"0"},{"id":"475","user_id":"210","amount":"24","sign":"+","payment_type":"Deposit","payment_status":"Success","payment_method":"0","order_id":"0","create_dt":"2023-03-07","status":"0","wallet_status":"0"},{"id":"479","user_id":"210","amount":"24","sign":"+","payment_type":"Deposit","payment_status":"Success","payment_method":"0","order_id":"0","create_dt":"2023-03-09","status":"0","wallet_status":"0"}]

class WalletHistoryModel {
  WalletHistoryModel({
      num? status, 
      num? errorCode, 
      num? errorLine, 
      String? message, 
      String? wallet, 
      List<Data>? data,}){
    _status = status;
    _errorCode = errorCode;
    _errorLine = errorLine;
    _message = message;
    _wallet = wallet;
    _data = data;
}

  WalletHistoryModel.fromJson(dynamic json) {
    _status = json['status'];
    _errorCode = json['error_code'];
    _errorLine = json['error_line'];
    _message = json['message'];
    _wallet = json['wallet'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  num? _status;
  num? _errorCode;
  num? _errorLine;
  String? _message;
  String? _wallet;
  List<Data>? _data;
WalletHistoryModel copyWith({  num? status,
  num? errorCode,
  num? errorLine,
  String? message,
  String? wallet,
  List<Data>? data,
}) => WalletHistoryModel(  status: status ?? _status,
  errorCode: errorCode ?? _errorCode,
  errorLine: errorLine ?? _errorLine,
  message: message ?? _message,
  wallet: wallet ?? _wallet,
  data: data ?? _data,
);
  num? get status => _status;
  num? get errorCode => _errorCode;
  num? get errorLine => _errorLine;
  String? get message => _message;
  String? get wallet => _wallet;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['error_code'] = _errorCode;
    map['error_line'] = _errorLine;
    map['message'] = _message;
    map['wallet'] = _wallet;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "371"
/// user_id : "210"
/// amount : "0"
/// sign : "+"
/// payment_type : "Deposit"
/// payment_status : "Success"
/// payment_method : "0"
/// order_id : "0"
/// create_dt : "2021-11-25"
/// status : "0"
/// wallet_status : "0"

class Data {
  Data({
      String? id, 
      String? userId, 
      String? amount, 
      String? sign, 
      String? paymentType, 
      String? paymentStatus, 
      String? paymentMethod, 
      String? orderId, 
      String? createDt, 
      String? status, 
      String? walletStatus,}){
    _id = id;
    _userId = userId;
    _amount = amount;
    _sign = sign;
    _paymentType = paymentType;
    _paymentStatus = paymentStatus;
    _paymentMethod = paymentMethod;
    _orderId = orderId;
    _createDt = createDt;
    _status = status;
    _walletStatus = walletStatus;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _amount = json['amount'];
    _sign = json['sign'];
    _paymentType = json['payment_type'];
    _paymentStatus = json['payment_status'];
    _paymentMethod = json['payment_method'];
    _orderId = json['order_id'];
    _createDt = json['create_dt'];
    _status = json['status'];
    _walletStatus = json['wallet_status'];
  }
  String? _id;
  String? _userId;
  String? _amount;
  String? _sign;
  String? _paymentType;
  String? _paymentStatus;
  String? _paymentMethod;
  String? _orderId;
  String? _createDt;
  String? _status;
  String? _walletStatus;
Data copyWith({  String? id,
  String? userId,
  String? amount,
  String? sign,
  String? paymentType,
  String? paymentStatus,
  String? paymentMethod,
  String? orderId,
  String? createDt,
  String? status,
  String? walletStatus,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  amount: amount ?? _amount,
  sign: sign ?? _sign,
  paymentType: paymentType ?? _paymentType,
  paymentStatus: paymentStatus ?? _paymentStatus,
  paymentMethod: paymentMethod ?? _paymentMethod,
  orderId: orderId ?? _orderId,
  createDt: createDt ?? _createDt,
  status: status ?? _status,
  walletStatus: walletStatus ?? _walletStatus,
);
  String? get id => _id;
  String? get userId => _userId;
  String? get amount => _amount;
  String? get sign => _sign;
  String? get paymentType => _paymentType;
  String? get paymentStatus => _paymentStatus;
  String? get paymentMethod => _paymentMethod;
  String? get orderId => _orderId;
  String? get createDt => _createDt;
  String? get status => _status;
  String? get walletStatus => _walletStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['amount'] = _amount;
    map['sign'] = _sign;
    map['payment_type'] = _paymentType;
    map['payment_status'] = _paymentStatus;
    map['payment_method'] = _paymentMethod;
    map['order_id'] = _orderId;
    map['create_dt'] = _createDt;
    map['status'] = _status;
    map['wallet_status'] = _walletStatus;
    return map;
  }

}