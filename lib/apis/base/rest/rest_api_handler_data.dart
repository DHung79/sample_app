import 'api_helpers/api_base_helper.dart';
import 'models/rest_api_response.dart';

class RestApiHandlerData {
  static final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();

  static Future<ApiResponse<T>> getData<T extends BaseModel>({
    required String path,
    Map<String, String>? headers,
  }) async {
    final response = await _apiBaseHelper.get<T>(
      path: path,
      headers: headers,
    );
    return response;
  }
}
