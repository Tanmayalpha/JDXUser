class GetChatMessage {
  bool? status;
  String? message;
  List<ChatDataList>? data;

  GetChatMessage({this.status, this.message, this.data});

  GetChatMessage.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ChatDataList>[];
      json['data'].forEach((v) {
        data!.add( ChatDataList.fromJson(v));
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

class ChatDataList {
  String? id;
  String? userType;
  String? userId;
  String? ticketId;
  String? message;
  List<dynamic>? attachments;
  String? lastUpdated;
  String? dateCreated;
  String? ticketTypeId;
  String? subject;
  String? email;
  String? description;
  String? status;
  String? saleId;

  ChatDataList(
      {this.id,
        this.userType,
        this.userId,
        this.ticketId,
        this.message,
        this.attachments,
        this.lastUpdated,
        this.dateCreated,
        this.ticketTypeId,
        this.subject,
        this.email,
        this.description,
        this.status,
        this.saleId});

  ChatDataList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userType = json['user_type'];
    userId = json['user_id'];
    ticketId = json['ticket_id'];
    message = json['message'];
    attachments = json['attachments'];
    lastUpdated = json['last_updated'];
    dateCreated = json['date_created'];
    ticketTypeId = json['ticket_type_id'];
    subject = json['subject'];
    email = json['email'];
    description = json['description'];
    status = json['status'];
    saleId = json['sale_id'];
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
    data['ticket_type_id'] = this.ticketTypeId;
    data['subject'] = this.subject;
    data['email'] = this.email;
    data['description'] = this.description;
    data['status'] = this.status;
    data['sale_id'] = this.saleId;
    return data;
  }
}
