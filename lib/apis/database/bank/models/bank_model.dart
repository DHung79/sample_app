import '../../../configs/rest/models/rest_api_response.dart';

class BankModel extends BaseModel {
  final int id;
  final String name;
  final String shortName;
  final String code;
  final String bin;
  final String logo;
  final int transferSupported;
  final int lookupSupported;
  BankModel({
    required this.id,
    required this.name,
    required this.shortName,
    required this.code,
    required this.bin,
    required this.logo,
    required this.transferSupported,
    required this.lookupSupported,
  });

  factory BankModel.fromJson(Map<String, dynamic> source) {
    return BankModel(
      id: source['id']?.toInt() ?? 0,
      name: source['name'] ?? '',
      shortName: source['shortName'] ?? '',
      code: source['code'] ?? '',
      bin: source['bin'] ?? 0,
      logo: source['logo'] ?? '',
      transferSupported: source['transferSupported']?.toInt() ?? 0,
      lookupSupported: source['lookupSupported']?.toInt() ?? 0,
    );
  }
  // BankModel.fromJson(Map<String, dynamic> json)
  //     : id = json['id'],
  //       name = json['name'] ?? '',
  //       shortName = json['shortName'] ?? '',
  //       code = json['code'] ?? '',
  //       bin = json['bin'],
  //       logo = json['logo'] ?? '',
  //       transferSupported = json['transferSupported'],
  //       lookupSupported = json['lookupSupported'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'shortName': shortName,
        'code': code,
        'bin': bin,
        'logo': logo,
        'transferSupported': transferSupported,
        'lookupSupported': lookupSupported,
      };
}

class ListBankModel extends BaseModel {
  List<BankModel> _data = [];
  ListBankModel.fromJson(Map<String, dynamic> parsedJson) {
    List<BankModel> tmp = [];
    for (int i = 0; i < parsedJson['data'].length; i++) {
      var result = BaseModel.fromJson<BankModel>(parsedJson['data'][i]);
      tmp.add(result);
    }
    _data = tmp;
  }

  List<BankModel> get records => _data;
}
