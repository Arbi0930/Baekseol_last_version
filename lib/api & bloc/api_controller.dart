import 'dart:convert';

import 'package:http/http.dart';
import 'package:lapp/api%20&%20bloc/api_helper.dart';
import 'package:lapp/models/login.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future<LoginResponse> login(Map<String, dynamic> request) async {
    Response response = await http.post(
      Uri.parse(ApiHelper.BaseUrl + HttpPaths.login),
      body: request,
    );
    var res = LoginResponse.fromJson(jsonDecode(response.body));
    return res;
  }
}

class HttpPaths {
  static const String login = '/api/auth/login';
}
