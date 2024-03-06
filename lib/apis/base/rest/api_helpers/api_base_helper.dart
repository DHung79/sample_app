import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/rest_api_response.dart';

class ApiBaseHelper {
  Future<ApiResponse<T>> get<T extends BaseModel>({
    required String path,
    Map<String, String>? headers,
  }) async {
    ApiResponse<T> responseJson;
    try {
      final response = await http.get(Uri.parse(path), headers: headers);
      responseJson = _returnResponse<T>(response);
    } on SocketException {
      return ApiResponse(
        null,
        ApiError.fromJson(
          {'errorCode': -999, 'errorMessage': 'No Internet Connection'},
        ),
      );
    }
    return responseJson;
  }

  ApiResponse<T> _returnResponse<T extends BaseModel>(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseJson = json.decode(response.body.toString());
      if (responseJson is Map<String, dynamic>) {
        return ApiResponse(BaseModel.fromJson<T>(responseJson), null);
      }
      if (responseJson is List<dynamic>) {
        return ApiResponse(BaseModel.listDynamic<T>(responseJson), null);
      }
    } else if (response.statusCode >= 400 && response.statusCode < 500) {
      var parsedJson = json.decode(response.body.toString());
      ApiError error;
      if (parsedJson is String) {
        error = ApiError.fromJson(
          {'errorCode': response.statusCode, 'errorMessage': parsedJson},
        );
      } else if (parsedJson is Map<String, dynamic>) {
        error = ApiError.fromJson(parsedJson);
      } else {
        error = ApiError.fromJson(
          {
            'errorCode': response.statusCode,
            'errorMessage': parsedJson.toString(),
          },
        );
      }
      return ApiResponse(null, error);
    }
    return ApiResponse(
      null,
      ApiError.fromJson(
        {
          'errorCode': response.statusCode,
          'errorMessage': 'Error occured while Communication with Server'
        },
      ),
    );
  }
}
