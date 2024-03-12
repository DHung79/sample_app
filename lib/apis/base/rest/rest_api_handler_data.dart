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

  static Future<ApiResponse<T>> postData<T extends BaseModel>({
    required String path,
    dynamic body,
    Map<String, String>? headers,
  }) async {
    final response = await _apiBaseHelper.post<T>(
      path: path,
      body: body,
      headers: headers,
    );
    return response;
  }

  static Future<ApiResponse<T>> putData<T extends BaseModel>({
    required String path,
    dynamic body,
    Map<String, String>? headers,
  }) async {
    final response = await _apiBaseHelper.put<T>(
      path: path,
      body: body,
      headers: headers,
    );
    return response;
  }

  static Future<ApiResponse<T>> deleteData<T extends BaseModel>({
    required String path,
    dynamic body,
    Map<String, String>? headers,
  }) async {
    final response = await _apiBaseHelper.delete<T>(
      path: path,
      body: body,
      headers: headers,
    );
    return response;
  }

  static Future postDynamic({
    required String path,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    final response = await _apiBaseHelper.postDynamic(
      path: path,
      headers: headers,
      body: body,
    );
    return response;
  }
}
