class GetTicketHistory {
  bool? status;
  String? message;
  List<TicketHistoryData>? data;

  GetTicketHistory({this.status, this.message, this.data});

  GetTicketHistory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TicketHistoryData>[];
      json['data'].forEach((v) {
        data!.add(new TicketHistoryData.fromJson(v));
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

class TicketHistoryData {
  String? id;
  String? ticketTypeId;
  String? userId;
  String? subject;
  String? email;
  String? description;
  String? status;
  String? lastUpdated;
  String? dateCreated;
  String? saleId;

  TicketHistoryData(
      {this.id,
        this.ticketTypeId,
        this.userId,
        this.subject,
        this.email,
        this.description,
        this.status,
        this.lastUpdated,
        this.dateCreated,
        this.saleId});

  TicketHistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketTypeId = json['ticket_type_id'];
    userId = json['user_id'];
    subject = json['subject'];
    email = json['email'];
    description = json['description'];
    status = json['status'];
    lastUpdated = json['last_updated'];
    dateCreated = json['date_created'];
    saleId = json['sale_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ticket_type_id'] = this.ticketTypeId;
    data['user_id'] = this.userId;
    data['subject'] = this.subject;
    data['email'] = this.email;
    data['description'] = this.description;
    data['status'] = this.status;
    data['last_updated'] = this.lastUpdated;
    data['date_created'] = this.dateCreated;
    data['sale_id'] = this.saleId;
    return data;
  }
}
