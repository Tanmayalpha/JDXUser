/// status : true
/// message : "Categories list"
/// data : [{"id":"1","weight_to":"up to 1 kg","weight":"1","status":"1"},{"id":"2","weight_to":"up to 5 kg","weight":"5","status":"1"},{"id":"3","weight_to":"up to 10 kg","weight":"10","status":"1"},{"id":"4","weight_to":"up to 15 kg","weight":"15","status":"1"},{"id":"5","weight_to":"up to 20 kg","weight":"20","status":"1"}]

class ParcelWeightModel {
  ParcelWeightModel({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  ParcelWeightModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Data>? _data;
ParcelWeightModel copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => ParcelWeightModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "1"
/// weight_to : "up to 1 kg"
/// weight : "1"
/// status : "1"

class Data {
  Data({
      String? id, 
      String? weightTo, 
      String? weight, 
      String? status,}){
    _id = id;
    _weightTo = weightTo;
    _weight = weight;
    _status = status;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _weightTo = json['weight_to'];
    _weight = json['weight'];
    _status = json['status'];
  }
  String? _id;
  String? _weightTo;
  String? _weight;
  String? _status;
Data copyWith({  String? id,
  String? weightTo,
  String? weight,
  String? status,
}) => Data(  id: id ?? _id,
  weightTo: weightTo ?? _weightTo,
  weight: weight ?? _weight,
  status: status ?? _status,
);
  String? get id => _id;
  String? get weightTo => _weightTo;
  String? get weight => _weight;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['weight_to'] = _weightTo;
    map['weight'] = _weight;
    map['status'] = _status;
    return map;
  }

}