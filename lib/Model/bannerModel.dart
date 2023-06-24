/// response_code : "1"
/// msg : "Banner List"
/// data : [{"id":"15","banners_name":"slider 2","image":"63cbe8bf3906b.jpeg","role_type":"0"},{"id":"16","banners_name":"slider 3","image":"63cbe8d38feda.jpeg","role_type":"0"},{"id":"17","banners_name":"banner 3","image":"63cbae93c9944.jpeg","role_type":"0"},{"id":"18","banners_name":"banner4","image":"63cbaea2b1fc0.jpeg","role_type":"0"},{"id":"19","banners_name":"banner 5","image":"63cbaeb09d3a5.jpeg","role_type":"0"},{"id":"20","banners_name":"banner6","image":"63cbaebd39e57.jpeg","role_type":"0"}]

class BannerModel {
  BannerModel({
      String? responseCode, 
      String? msg, 
      List<Data>? data,}){
    _responseCode = responseCode;
    _msg = msg;
    _data = data;
}

  BannerModel.fromJson(dynamic json) {
    _responseCode = json['response_code'];
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _responseCode;
  String? _msg;
  List<Data>? _data;
BannerModel copyWith({  String? responseCode,
  String? msg,
  List<Data>? data,
}) => BannerModel(  responseCode: responseCode ?? _responseCode,
  msg: msg ?? _msg,
  data: data ?? _data,
);
  String? get responseCode => _responseCode;
  String? get msg => _msg;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response_code'] = _responseCode;
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "15"
/// banners_name : "slider 2"
/// image : "63cbe8bf3906b.jpeg"
/// role_type : "0"

class Data {
  Data({
      String? id, 
      String? bannersName, 
      String? image, 
      String? roleType,}){
    _id = id;
    _bannersName = bannersName;
    _image = image;
    _roleType = roleType;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _bannersName = json['banners_name'];
    _image = json['image'];
    _roleType = json['role_type'];
  }
  String? _id;
  String? _bannersName;
  String? _image;
  String? _roleType;
Data copyWith({  String? id,
  String? bannersName,
  String? image,
  String? roleType,
}) => Data(  id: id ?? _id,
  bannersName: bannersName ?? _bannersName,
  image: image ?? _image,
  roleType: roleType ?? _roleType,
);
  String? get id => _id;
  String? get bannersName => _bannersName;
  String? get image => _image;
  String? get roleType => _roleType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['banners_name'] = _bannersName;
    map['image'] = _image;
    map['role_type'] = _roleType;
    return map;
  }

}