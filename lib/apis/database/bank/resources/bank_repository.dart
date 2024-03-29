import 'dart:async';
import '../../../configs/rest/models/rest_api_response.dart';
import 'bank_api_provider.dart';

class BankRepository {
  final _provider = BankApiProvider();

  Future<ApiResponse<T?>> fetchAllData<T extends BaseModel>() =>
      _provider.fetchAllBank<T>();
}
