class ApiMethods {


  static final ApiMethods _apiMethods = ApiMethods._internal();

  factory ApiMethods() {
    return _apiMethods;
  }

  ApiMethods._internal();

  String parcelHistory = 'payment/parcel_history';
  String getOrderDriver = 'Payment/get_order_driver';
  String couponList = 'Products/couponList';
}