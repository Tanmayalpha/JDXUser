/// response : true

class ChangepasswordModel {
  ChangepasswordModel({
    bool? response,}){
    _response = response;
  }

  ChangepasswordModel.fromJson(dynamic json) {
    _response = json['response'];
  }
  bool? _response;
  ChangepasswordModel copyWith({  bool? response,
  }) => ChangepasswordModel(  response: response ?? _response,
  );
  bool? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response'] = _response;
    return map;
  }

}