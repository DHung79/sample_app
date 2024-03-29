import 'dart:async';
import '../../../configs/rest/models/rest_api_response.dart';
import 'user_api_provider.dart';

class ShippingRepository {
  final _provider = UserApiProvider();

  Future<ApiResponse<T?>> fetchAllData<T extends BaseModel>({
    required Map<String, dynamic> params,
  }) =>
      _provider.fetchAllUsers<T>(params: params);
}
