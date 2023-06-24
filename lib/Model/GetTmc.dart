/// status : true
/// message : "AboutUs Page."
/// Data : {"pg_descri":"<p><strong>Personal Information</strong></p> \r\n<p>ParcelDelivery is the licensed owner of the brand Parcel Delivery Retails. Parcel Delivery respects your privacy. This Privacy Policy provides succinctly the manner your data is collected and used by Parcel Delivery Retails on the application. As a visitor to the application/ Customer you are advised to please read the Privacy Policy carefully. By accessing the services provided by the Application you agree to the collection and use of your data by Parcel Delivery in the manner provided in this Privacy Policy.</p>\r\n<p><strong>Services overview</strong></p>\r\nAs part of the registration process on the Application, Parcel Delivery may collect the following personally identifiable information about you: Name including first and last name, alternate email address, mobile phone number and contact details, Postal code, Demographic profile (like your age, gender, occupation, education, address etc.).\r\n\r\n<p><strong>Eligibility</strong></p>\r\nServices of the Application would be available to only select geographies in India. Persons who are \"incompetent to contract\" within the meaning of the Indian Contract Act, 1872 including un-discharged insolvents etc. are not eligible to use the Application. If you are a minor i.e. under the age of 18 years but at least 13 years of age you may use the Application only under the supervision of a parent or legal guardian who agrees to be bound by these Terms of Use. If your age is below 18 years your parents or legal guardians can transact on behalf of you if they are registered users. You are prohibited from purchasing any material which is for adult consumption and the sale of which to minors is prohibited.\r\n\r\n<p><strong>License & Application access</strong></p>\t\r\nParcel Delivery grants you a limited sub-license to access and make personal use of this application and not to download (other than page caching) or modify it, or any portion of it, except with express written consent of Parcel Delivery. This license does not include any resale or commercial use of this application or its contents; any collection and use of any product listings, descriptions, or prices; any derivative use of this application or its contents; any downloading or copying of account information for the benefit of another merchant; or any use of data mining, robots, or similar data gathering and extraction tools. This application or any portion of this application may not be reproduced, duplicated, copied, sold, resold, visited, or otherwise exploited for any commercial purpose without express written consent of Parcel Delivery. You may not frame or utilize framing techniques to enclose any trademark, logo, or other proprietary information (including images, text, page layout, or form) of the Application or of Parcel Delivery  and its affiliates without express written consent. You may not use any meta tags or any other \"hidden text\" utilizing the Application’s or Parcel Delivery name or trademarks without the express written consent of Parcel Delivery."}

class GetTmc {
  GetTmc({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  GetTmc.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
GetTmc copyWith({  bool? status,
  String? message,
  Data? data,
}) => GetTmc(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['Data'] = _data?.toJson();
    }
    return map;
  }

}

/// pg_descri : "<p><strong>Personal Information</strong></p> \r\n<p>ParcelDelivery is the licensed owner of the brand Parcel Delivery Retails. Parcel Delivery respects your privacy. This Privacy Policy provides succinctly the manner your data is collected and used by Parcel Delivery Retails on the application. As a visitor to the application/ Customer you are advised to please read the Privacy Policy carefully. By accessing the services provided by the Application you agree to the collection and use of your data by Parcel Delivery in the manner provided in this Privacy Policy.</p>\r\n<p><strong>Services overview</strong></p>\r\nAs part of the registration process on the Application, Parcel Delivery may collect the following personally identifiable information about you: Name including first and last name, alternate email address, mobile phone number and contact details, Postal code, Demographic profile (like your age, gender, occupation, education, address etc.).\r\n\r\n<p><strong>Eligibility</strong></p>\r\nServices of the Application would be available to only select geographies in India. Persons who are \"incompetent to contract\" within the meaning of the Indian Contract Act, 1872 including un-discharged insolvents etc. are not eligible to use the Application. If you are a minor i.e. under the age of 18 years but at least 13 years of age you may use the Application only under the supervision of a parent or legal guardian who agrees to be bound by these Terms of Use. If your age is below 18 years your parents or legal guardians can transact on behalf of you if they are registered users. You are prohibited from purchasing any material which is for adult consumption and the sale of which to minors is prohibited.\r\n\r\n<p><strong>License & Application access</strong></p>\t\r\nParcel Delivery grants you a limited sub-license to access and make personal use of this application and not to download (other than page caching) or modify it, or any portion of it, except with express written consent of Parcel Delivery. This license does not include any resale or commercial use of this application or its contents; any collection and use of any product listings, descriptions, or prices; any derivative use of this application or its contents; any downloading or copying of account information for the benefit of another merchant; or any use of data mining, robots, or similar data gathering and extraction tools. This application or any portion of this application may not be reproduced, duplicated, copied, sold, resold, visited, or otherwise exploited for any commercial purpose without express written consent of Parcel Delivery. You may not frame or utilize framing techniques to enclose any trademark, logo, or other proprietary information (including images, text, page layout, or form) of the Application or of Parcel Delivery  and its affiliates without express written consent. You may not use any meta tags or any other \"hidden text\" utilizing the Application’s or Parcel Delivery name or trademarks without the express written consent of Parcel Delivery."

class Data {
  Data({
      String? pgDescri,}){
    _pgDescri = pgDescri;
}

  Data.fromJson(dynamic json) {
    _pgDescri = json['pg_descri'];
  }
  String? _pgDescri;
Data copyWith({  String? pgDescri,
}) => Data(  pgDescri: pgDescri ?? _pgDescri,
);
  String? get pgDescri => _pgDescri;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pg_descri'] = _pgDescri;
    return map;
  }

}