import 'dart:async';
import 'package:sample_app/utils/logger/logger.dart';
import '../../../configs/rest/models/rest_api_response.dart';
import '../../../configs/rest/rest_api_handler_data.dart';

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
