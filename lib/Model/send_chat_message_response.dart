class SendChatMessage {
  bool? status;
  String? message;
  Data? data;

  SendChatMessage({this.status, this.message, this.data});

  SendChatMessage.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? userType;
  String? userId;
  String? ticketId;
  String? message;
  String? attachments;
  String? lastUpdated;
  String? dateCreated;

  Data(
      {this.id,
        this.userType,
        this.userId,
        this.ticketId,
        this.message,
        this.attachments,
        this.lastUpdated,
        this.dateCreated});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userType = json['user_type'];
    userId = json['user_id'];
    ticketId = json['ticket_id'];
    message = json['message'];
    attachments = json['attachments'];
    lastUpdated = json['last_updated'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_type'] = this.userType;
    data['user_id'] = this.userId;
    data['ticket_id'] = this.ticketId;
    data['message'] = this.message;
    data['attachments'] = this.attachments;
    data['last_updated'] = this.lastUpdated;
    data['date_created'] = this.dateCreated;
    return data;
  }
}
