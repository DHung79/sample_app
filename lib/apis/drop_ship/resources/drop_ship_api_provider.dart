import 'dart:async';
import 'dart:convert';
import 'package:sample_app/logger/logger.dart';

import '../../base/constants/api_constants.dart';
import '../../base/rest/models/rest_api_response.dart';
import '../../base/rest/rest_api_handler_data.dart';

class DropShipApiProvider {
  Future<ApiResponse<T?>> fetchAllDropShips<T extends BaseModel>({
    required Map<String, dynamic> params,
  }) async {
    var path = ApiConstants.apiDomain + ApiConstants.users;
    if (params.isNotEmpty) {
      var queries = <String>[];
      params.forEach((key, value) => queries.add('$key=$value'));
      path += '?${queries.join('&')}';
    }
    logDebug('DropShipApi: $path');
    final response = await RestApiHandlerData.getData<T>(
      path: path,
    );
    return response;
  }

  getToken() async {
    var viettelPostApi = 'https://partner.viettelpost.vn/v2/user/Login';
    var path = viettelPostApi;
    logDebug('DropShipApi: $path');
    final response = await RestApiHandlerData.postDynamic(
      path: path,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "USERNAME": "daoleduyhung04@gmail.com",
        "PASSWORD": "Hung0403@",
      }),
    );
    logDebug('getToken: $response');
    return response;
  }

  ownerRegister({
    dynamic body,
  }) async {
    var viettelPostApi = 'https://partner.viettelpost.vn/v2/user/ownerRegister';
    var path = viettelPostApi;
    logDebug('DropShipApi: $path');
    String token =
        'eyJhbGciOiJFUzI1NiJ9.eyJVc2VySWQiOjE0MDE0OTMxLCJGcm9tU291cmNlIjo1LCJUb2tlbiI6Ilc0MUNaMDRTMDJMTUQzQzg2MjdCIiwiZXhwIjoxNzEwMjk3NzA0LCJQYXJ0bmVyIjoxNDAxNDkzMX0.ndjTMQuStB50csaxVB9DX2fO2L4sYmU4nKnKue595LYIsi-bGjZGaEQ5CuZ67TyXmgKhOMC5LmsYsGsu5u_nqA';
    final response = await RestApiHandlerData.postDynamic(
      path: path,
      headers: {
        'Content-Type': 'application/json',
        'Token': token,
      },
      body: json.encode(body),
    );
    logDebug('ownerRegister: $response');
    return response;
  }

  ownerconnect({
    dynamic body,
  }) async {
    var viettelPostApi = 'https://partner.viettelpost.vn/v2/user/ownerconnect';
    var path = viettelPostApi;
    logDebug('body: $body');
    String token =
        'eyJhbGciOiJFUzI1NiJ9.eyJVc2VySWQiOjE0MDE0OTMxLCJGcm9tU291cmNlIjo1LCJUb2tlbiI6Ilc0MUNaMDRTMDJMTUQzQzg2MjdCIiwiZXhwIjoxNzEwMjk3NzA0LCJQYXJ0bmVyIjoxNDAxNDkzMX0.ndjTMQuStB50csaxVB9DX2fO2L4sYmU4nKnKue595LYIsi-bGjZGaEQ5CuZ67TyXmgKhOMC5LmsYsGsu5u_nqA';
    final response = await RestApiHandlerData.postDynamic(
      path: path,
      headers: {
        'Content-Type': 'application/json',
        'Token': token,
      },
      body: json.encode(body),
    );
    logDebug('ownerconnect: $response');
    return response;
  }
}
// eyJhbGciOiJFUzI1NiJ9.eyJzdWIiOiIwMzQ1NTk5MDYxIiwiVXNlcklkIjoxNDAyNzg1OSwiRnJvbVNvdXJjZSI6NSwiVG9rZW4iOiJaTEs3QzNWUVBSMkxHVFQ1NyIsImV4cCI6MTc5NjYxMjg1MywiUGFydG5lciI6MTQwMTQ5MzF9.ndz_ZINM76zu--aeS_g-jCV8n4nARkvpPLotOH2U0B_20QbmVTag5k1hDBjVEvS5dIww2NYMoY9EraNgzB1Vuw