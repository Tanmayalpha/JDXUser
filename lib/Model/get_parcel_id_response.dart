class GetParcelId {
  bool? status;
  String? message;
  List<ParcelIdData>? data;

  GetParcelId({this.status, this.message, this.data});

  GetParcelId.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ParcelIdData>[];
      json['data'].forEach((v) {
        data!.add(new ParcelIdData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ParcelIdData {
  String? saleId;

  ParcelIdData({this.saleId});

  ParcelIdData.fromJson(Map<String, dynamic> json) {
    saleId = json['sale_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sale_id'] = this.saleId;
    return data;
  }
}
