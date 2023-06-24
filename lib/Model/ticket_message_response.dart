class GetTicketMessage {
    bool? status;
    String? message;
  List<MessageDataList>? data;

  GetTicketMessage({this.status, this.message, this.data});

  GetTicketMessage.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <MessageDataList>[];
      json['data'].forEach((v) {
        data!.add( MessageDataList.fromJson(v));
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

class MessageDataList {
  String? id;
  String? title;
  String? dateCreated;

  MessageDataList({this.id, this.title, this.dateCreated});

  MessageDataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['date_created'] = this.dateCreated;
    return data;
  }
}

