/// response_code : "1"
/// message : "Notifications Found"
/// notifications : [{"not_id":"2","user_id":"20","data_id":"","type":"","title":"Update status","message":"Hello  child is pick by driver  ","date":"2023-02-20 13:23:48"}]
/// status : "success"

class NotificationModel {
  NotificationModel({
      String? responseCode, 
      String? message,
      List<Notifications>? notifications, 
      String? status,}){
    _responseCode = responseCode;
    _message = message;
    _notifications = notifications;
    _status = status;
}

  NotificationModel.fromJson(dynamic json) {
    _responseCode = json['response_code'];
    _message = json['message'];
    if (json['notifications'] != null) {
      _notifications = [];
      json['notifications'].forEach((v) {
        _notifications?.add(Notifications.fromJson(v));
      });
    }
    _status = json['status'];
  }
  String? _responseCode;
  String? _message;
  List<Notifications>? _notifications;
  String? _status;
NotificationModel copyWith({  String? responseCode,
  String? message,
  List<Notifications>? notifications,
  String? status,
}) => NotificationModel(  responseCode: responseCode ?? _responseCode,
  message: message ?? _message,
  notifications: notifications ?? _notifications,
  status: status ?? _status,
);
  String? get responseCode => _responseCode;
  String? get message => _message;
  List<Notifications>? get notifications => _notifications;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response_code'] = _responseCode;
    map['message'] = _message;
    if (_notifications != null) {
      map['notifications'] = _notifications?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }

}

/// not_id : "2"
/// user_id : "20"
/// data_id : ""
/// type : ""
/// title : "Update status"
/// message : "Hello  child is pick by driver  "
/// date : "2023-02-20 13:23:48"

class Notifications {
  Notifications({
      String? notId, 
      String? userId, 
      String? dataId, 
      String? type, 
      String? title, 
      String? message, 
      String? date,}){
    _notId = notId;
    _userId = userId;
    _dataId = dataId;
    _type = type;
    _title = title;
    _message = message;
    _date = date;
}

  Notifications.fromJson(dynamic json) {
    _notId = json['not_id'];
    _userId = json['user_id'];
    _dataId = json['data_id'];
    _type = json['type'];
    _title = json['title'];
    _message = json['message'];
    _date = json['date'];
  }
  String? _notId;
  String? _userId;
  String? _dataId;
  String? _type;
  String? _title;
  String? _message;
  String? _date;
Notifications copyWith({  String? notId,
  String? userId,
  String? dataId,
  String? type,
  String? title,
  String? message,
  String? date,
}) => Notifications(  notId: notId ?? _notId,
  userId: userId ?? _userId,
  dataId: dataId ?? _dataId,
  type: type ?? _type,
  title: title ?? _title,
  message: message ?? _message,
  date: date ?? _date,
);
  String? get notId => _notId;
  String? get userId => _userId;
  String? get dataId => _dataId;
  String? get type => _type;
  String? get title => _title;
  String? get message => _message;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['not_id'] = _notId;
    map['user_id'] = _userId;
    map['data_id'] = _dataId;
    map['type'] = _type;
    map['title'] = _title;
    map['message'] = _message;
    map['date'] = _date;
    return map;
  }

}