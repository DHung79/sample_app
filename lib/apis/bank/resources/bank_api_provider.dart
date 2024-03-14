import 'dart:async';
import 'package:sample_app/logger/logger.dart';
import '../../base/rest/models/rest_api_response.dart';
import '../../base/rest/rest_api_handler_data.dart';

class BankApiProvider {
  Future<ApiResponse<T?>> fetchAllBank<T extends BaseModel>() async {
    var path = 'https://api.vietqr.io/v2/banks';
    logDebug('path: $path');
    final response = await RestApiHandlerData.getData<T>(
      path: path,
    );
    return response;
  }
}
