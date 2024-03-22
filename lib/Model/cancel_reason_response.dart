class CancelReasonResponse {
  bool? status;
  String? message;
  List<CancelReasonData>? data;

  CancelReasonResponse({this.status, this.message, this.data});

  CancelReasonResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CancelReasonData>[];
      json['data'].forEach((v) {
        data!.add(CancelReasonData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CancelReasonData {
  String? id;
  String? title;

  CancelReasonData({this.id, this.title});

  CancelReasonData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}
