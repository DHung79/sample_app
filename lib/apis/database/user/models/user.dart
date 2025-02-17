import '../../../configs/rest/models/rest_api_response.dart';

class UserModel extends BaseModel {
  final int _id;
  final String _firstName;
  final String _lastName;
  final String _maidenName;
  final int _age;
  final String _gender;
  final String _email;
  final String _phone;
  final String _username;
  final String _password;
  final String _birthDate;
  final String _image;
  final String _bloodGroup;
  final double _height;
  final double _weight;
  final String _eyeColor;
  final String _domain;
  final String _ip;
  final String _macAddress;
  final String _university;

  UserModel.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _firstName = json['firstName'] ?? '',
        _lastName = json['lastName'] ?? '',
        _maidenName = json['maidenName'] ?? '',
        _age = json['age'],
        _gender = json['gender'] ?? '',
        _email = json['email'] ?? '',
        _phone = json['phone'] ?? '',
        _username = json['username'] ?? '',
        _password = json['password'] ?? '',
        _birthDate = json['birthDate'] ?? '',
        _image = json['image'] ?? '',
        _bloodGroup = json['bloodGroup'] ?? '',
        _height = json['height'].toDouble(),
        _weight = json['weight'].toDouble(),
        _eyeColor = json['eyeColor'] ?? '',
        _domain = json['domain'] ?? '',
        _ip = json['ip'] ?? '',
        _macAddress = json['macAddress'] ?? '',
        _university = json['university'] ?? '';

  Map<String, dynamic> toJson() => {
        'id': _id,
        'firstName': _firstName,
        'lastName': _lastName,
        'maidenName': _maidenName,
        'age': _age,
        'gender': _gender,
        'email': _email,
        'phone': _phone,
        'username': _username,
        'password': _password,
        'birthDate': _birthDate,
        'image': _image,
        'bloodGroup': _bloodGroup,
        'height': _height,
        'weight': _weight,
        'eyeColor': _eyeColor,
        'domain': _domain,
        'ip': _ip,
        'macAddress': _macAddress,
        'university': _university,
      };

  int get id => _id;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get maidenName => _maidenName;
  int get age => _age;
  String get gender => _gender;
  String get email => _email;
  String get phone => _phone;
  String get username => _username;
  String get password => _password;
  String get birthDate => _birthDate;
  String get image => _image;
  String get bloodGroup => _bloodGroup;
  double get height => _height;
  double get weight => _weight;
  String get eyeColor => _eyeColor;
  String get domain => _domain;
  String get ip => _ip;
  String get macAddress => _macAddress;
  String get university => _university;
}

class ShippingModel extends BaseModel {
  List<UserModel> _data = [];
  int _total = 0;
  int _skip = 0;
  ShippingModel.fromJson(Map<String, dynamic> parsedJson) {
    List<UserModel> tmp = [];
    for (int i = 0; i < parsedJson['users'].length; i++) {
      var result = BaseModel.fromJson<UserModel>(parsedJson['users'][i]);
      tmp.add(result);
    }
    _data = tmp;
    _total = parsedJson['total'];
    _skip = parsedJson['skip'];
  }

  List<UserModel> get records => _data;
  int get total => _total;
  int get skip => _skip;
}
