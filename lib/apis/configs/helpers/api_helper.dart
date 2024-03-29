import 'package:shared_preferences/shared_preferences.dart';
import '../../../main.dart';

class ApiHelper {
  static Future<String?> getUserToken() async {
    final SharedPreferences sharedPreferences = await prefs;
    if (sharedPreferences.getString('authtoken') != null) {
      return sharedPreferences.getString('authtoken');
    }
    return '';
  }

  static Future<String?> getCookie() async {
    final SharedPreferences sharedPreferences = await prefs;
    if (sharedPreferences.getString('cookie') != null) {
      return sharedPreferences.getString('cookie');
    }
    return null;
  }

  static Future<String?> getUserAgent() async {
    final SharedPreferences sharedPreferences = await prefs;
    if (sharedPreferences.getString('userAgent') != null) {
      return sharedPreferences.getString('userAgent');
    }
    return null;
  }

  static Future<String?> getTestCandidateToken() async {
    final SharedPreferences sharedPreferences = await prefs;
    if (sharedPreferences.getString('testCandidateToken') != null) {
      return sharedPreferences.getString('testCandidateToken');
    }
    return null;
  }

  static Map<String, String> headers(
    String? token, {
    String? userAgent,
    String? cookie,
    String? deviceName,
    String lang = 'vi',
  }) {
    Map<String, String> params = {
      'Content-Type': 'application/json',
      'lang': lang,
    };
    if (deviceName != null && deviceName.isNotEmpty) {
      params['device-name'] = deviceName;
    }
    if (userAgent != null) {
      params['User-Agent'] = userAgent;
    }
    if (cookie != null && cookie.isNotEmpty) {
      params['Cookie'] = cookie;
    }
    if (token != null && token.isNotEmpty) {
      params['Authorization'] = 'Bearer $token';
    }
    return params;
  }

  static Future<String?> getTaskToken() async {
    final SharedPreferences sharedPreferences = await prefs;
    if (sharedPreferences.getString('authtokenTask') != null) {
      return sharedPreferences.getString('authtokenTask');
    }
    return '';
  }

  static Map<String, String> headersTask(String? token) {
    Map<String, String> params = {
      'Content-Type': 'application/json',
    };
    if (token != null && token.isNotEmpty) {
      params['Authorization'] = 'Bearer $token';
    }
    return params;
  }

  static Map<String, String> upload(String? token) {
    Map<String, String> params = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    if (token != null && token.isNotEmpty) {
      params['Authorization'] = 'Bearer $token';
    }
    return params;
  }

  static Map<String, String> downloadHeaders(String? token) {
    Map<String, String> params = {
      'Content-Type': 'application/octet-stream',
      'Accept': 'application/octet-stream',
    };
    if (token != null && token.isNotEmpty) {
      params['Authorization'] = 'Bearer $token';
    }
    return params;
  }
}
