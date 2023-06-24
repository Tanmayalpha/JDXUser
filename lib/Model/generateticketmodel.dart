/// status : true
/// message : "Feedback successfully"
/// data : {"user_id":"210","parcel_id":"1","message":"test","ticket_id":778951907278,"created_date":"2023-02-27 08:24:41"}

class Generateticketmodel {
  Generateticketmodel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  Generateticketmodel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
Generateticketmodel copyWith({  bool? status,
  String? message,
  Data? data,
}) => Generateticketmodel(  status: status ?? _status,
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
/// parcel_id : "1"
/// message : "test"
/// ticket_id : 778951907278
/// created_date : "2023-02-27 08:24:41"

class Data {
  Data({
      String? userId, 
      String? parcelId, 
      String? message, 
      num? ticketId, 
      String? createdDate,}){
    _userId = userId;
    _parcelId = parcelId;
    _message = message;
    _ticketId = ticketId;
    _createdDate = createdDate;
}

  Data.fromJson(dynamic json) {
    _userId = json['user_id'];
    _parcelId = json['parcel_id'];
    _message = json['message'];
    _ticketId = json['ticket_id'];
    _createdDate = json['created_date'];
  }
  String? _userId;
  String? _parcelId;
  String? _message;
  num? _ticketId;
  String? _createdDate;
Data copyWith({  String? userId,
  String? parcelId,
  String? message,
  num? ticketId,
  String? createdDate,
}) => Data(  userId: userId ?? _userId,
  parcelId: parcelId ?? _parcelId,
  message: message ?? _message,
  ticketId: ticketId ?? _ticketId,
  createdDate: createdDate ?? _createdDate,
);
  String? get userId => _userId;
  String? get parcelId => _parcelId;
  String? get message => _message;
  num? get ticketId => _ticketId;
  String? get createdDate => _createdDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['parcel_id'] = _parcelId;
    map['message'] = _message;
    map['ticket_id'] = _ticketId;
    map['created_date'] = _createdDate;
    return map;
  }

}