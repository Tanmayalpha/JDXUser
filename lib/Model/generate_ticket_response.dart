class GeneRateTicket {
  bool? status;
  String? message;
  Data? data;

  GeneRateTicket({this.status, this.message, this.data});

  GeneRateTicket.fromJson(Map<String, dynamic> json) {
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
  String? ticketTypeId;
  String? userId;
  String? subject;
  String? email;
  String? description;
  String? status;
  String? lastUpdated;
  String? dateCreated;
  String? saleId;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
