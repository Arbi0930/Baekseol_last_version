import 'dart:convert';

import 'package:http/http.dart';
import 'package:lapp/api%20&%20bloc/api_helper.dart';
import 'package:lapp/models/login.dart';
import 'package:http/http.dart' as http;
import 'package:lapp/models/userInfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiManager {
  Future<bool> setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', value);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<LoginResponse> login(Map<String, dynamic> request) async {
    Response response = await http.post(
      Uri.parse(ApiHelper.BaseUrl + HttpPaths.login),
      body: request,
    );
    var res = LoginResponse.fromJson(jsonDecode(response.body));
    return res;
  }

  static Future<Userinfo> GetUserData(Map<String, dynamic> request) async {
    String? token;

    Response response = await http
        .post(Uri.parse(ApiHelper.BaseUrl + HttpPaths.GetUserData), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    var res = Userinfo.fromJson(jsonDecode(response.body));
    return res;
  }
}

class HttpPaths {
  static const String login = '/api/auth/login';
  static const String GetUserData = 'api/user/info/';
}
