import 'dart:async';
import 'package:sample_app/logger/logger.dart';

import '../../base/constants/api_constants.dart';
import '../../base/rest/models/rest_api_response.dart';
import '../../base/rest/rest_api_handler_data.dart';

class UserApiProvider {
  Future<ApiResponse<T?>> fetchAllUsers<T extends BaseModel>({
    required Map<String, dynamic> params,
  }) async {
    var path = ApiConstants.apiDomain + ApiConstants.users;
    if (params.isNotEmpty) {
      var queries = <String>[];
      params.forEach((key, value) => queries.add('$key=$value'));
      path += '?${queries.join('&')}';
    }
    logDebug('UserApi: $path');
    final response = await RestApiHandlerData.getData<T>(
      path: path,
    );
    return response;
  }
}
