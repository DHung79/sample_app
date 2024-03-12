import 'dart:async';
import '../../base/rest/models/rest_api_response.dart';
import 'drop_ship_api_provider.dart';

class DropShipRepository {
  final _provider = DropShipApiProvider();

  Future<ApiResponse<T?>> fetchAllData<T extends BaseModel>({
    required Map<String, dynamic> params,
  }) =>
      _provider.fetchAllDropShips<T>(params: params);
}
