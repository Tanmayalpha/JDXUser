import 'package:flutter/foundation.dart';
import 'package:job_dekho_app/Model/coupon_code_response.dart';
import 'package:job_dekho_app/Model/driver_detail_response.dart';
import 'package:job_dekho_app/Model/generate_ticket_response.dart';
import 'package:job_dekho_app/Model/order_detail_response.dart';

import 'api_client.dart';
import 'api_method.dart';

class Api {
  final ApiMethods _apiMethods = ApiMethods();
  final ApiClient _apiClient = ApiClient();

  static final Api _api = Api._internal();

  //final Connectivity connectivity = Connectivity();
  //final Connectivity? connectivity;

  factory Api() {
  return _api;
  }

  Api._internal();

  Map<String, String> getHeader() {
  return {'Cookie': 'ci_session=c7d48d7dcbb70c45bae12c8d08e77251655897e8'};
  // return {'Content-Type': 'application/json'};
  }


  Future<OrderDetailResponse> getOrderDetailData(Map<String, String> body) async {
    String res = await _apiClient.postMethod(
        method: _apiMethods.parcelHistory, body: body);
    if (res.isNotEmpty) {
      try {
        return orderDetailResponseFromJson(res);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        return OrderDetailResponse(status: false, message: e.toString());
      }
    } else {
      return OrderDetailResponse(
          status: false, message: 'Something went wrong');
    }
  }

  Future<DriverDetailResponse> getDriverDetailData(Map<String, String> body) async {
    String res = await _apiClient.postMethod(
        method: _apiMethods.getOrderDriver, body: body);
    if (res.isNotEmpty) {
      try {
        return driverDetailResponseFromJson(res);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        return DriverDetailResponse(status: false, message: e.toString());
      }
    } else {
      return DriverDetailResponse(
          status: false, message: 'Something went wrong');
    }
  }

  Future<CouponCodeResponse> getCouponCode(Map<String, String> body) async {
    String res = await _apiClient.postMethod(
        method: _apiMethods.couponList, body: body);
    if (res.isNotEmpty) {
      try {
        return couponCodeResponseFromJson(res);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        return CouponCodeResponse(status: false, message: e.toString());
      }
    } else {
      return CouponCodeResponse(
          status: false, message: 'Something went wrong');
    }
  }






}