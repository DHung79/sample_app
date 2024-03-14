import '../../../../logger/logger.dart';
import '../../../bank/bank.dart';
import '../../../user/user.dart';

class ApiError implements Exception {
  String _errorCode = '';
  String _errorMessage = '';
  int? _failNumber;
  int? _blockTo;

  ApiError.fromJson(Map<String, dynamic>? parsedJson) {
    if (parsedJson?['errorCode'] != null) {
      _errorCode = parsedJson?['errorCode']?.toString() ?? '';
    }
    if (parsedJson?['statusCode'] != null) {
      _errorCode = parsedJson?['statusCode']?.toString() ?? '';
    }
    if (parsedJson?['failNumber'] != null) {
      _failNumber = parsedJson?['failNumber'];
    }
    if (parsedJson?['blockTo'] != null) {
      _blockTo = parsedJson?['blockTo'];
    }
    _errorMessage = parsedJson?['errorMessage'] ?? parsedJson?['message'] ?? '';
  }
  Map<String, dynamic> toJson() => {
        'statusCode': _errorCode,
        'errorMessage': _errorMessage,
      };

  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  int? get failNumber => _failNumber;
  int? get blockTo => _blockTo;

  @override
  String toString() {
    return _errorMessage;
  }
}

class ApiResponse<T> {
  ApiError? _error;
  T? _model;

  ApiResponse(T? m, ApiError? e) {
    _model = m;
    _error = e;
  }

  ApiError? get error => _error;
  T? get model => _model;
}

class BaseModel {
  static T fromJson<T extends BaseModel>(Map<String, dynamic> json) {
    // Models
    if (T == UserModel) {
      return UserModel.fromJson(json) as T;
    }
    if (T == ShippingModel) {
      return ShippingModel.fromJson(json) as T;
    }
    if (T == BankModel) {
      return BankModel.fromJson(json) as T;
    }
    if (T == ListBankModel) {
      return ListBankModel.fromJson(json) as T;
    }
    logError("Unknown BaseModel class: $T");
    throw Exception("Unknown BaseModel class: $T");
  }

  static List<T> mapList<T extends BaseModel>({
    required Map<String, dynamic> json,
    required String key,
    String defaultKey = '_id',
  }) {
    final results = <T>[];
    if (json[key] != null && json[key] is List<dynamic>) {
      for (var val in json[key]) {
        if (val is String) {
          results.add(BaseModel.fromJson<T>({defaultKey: val}));
        } else if (val is Map<String, dynamic>) {
          results.add(BaseModel.fromJson<T>(val));
        } else {
          results.add(BaseModel.fromJson<T>({}));
        }
      }
    }
    return results;
  }

  static T listDynamic<T extends BaseModel>(List<dynamic> list) {
    logError("Unknown BaseModel class: $T");
    throw Exception("Unknown BaseModel class: $T");
  }

  static T map<T extends BaseModel>({
    required Map<String, dynamic> json,
    required String key,
    String defaultKey = '_id',
  }) {
    if (json.containsKey(key)) {
      final val = json[key];
      if (val is String) {
        return BaseModel.fromJson<T>({defaultKey: val});
      } else if (val is Map<String, dynamic>) {
        return BaseModel.fromJson<T>(val);
      } else if (val is List<dynamic> && val.isNotEmpty) {
        return BaseModel.fromJson<T>(val[0]);
      }
    }
    return BaseModel.fromJson({});
  }
}
