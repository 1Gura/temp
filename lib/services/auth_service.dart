import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:temp/model/auth_model.dart';

class AuthService {
  String baseUrl = "https://localhost:7151/api/AuthManagement";

  Future<AuthModel> registration(
    String name,
    String email,
    String password,
    String repeatPassword,
  ) async {
    var apiUrl = '/Register';
    try {
      http.Response res = await http.post(Uri.parse(baseUrl + apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'userName': name,
            'email': email,
            'password': password,
            'repeatPassword': repeatPassword,
          }));

      if (res.statusCode == 200 || res.statusCode == 400) {
        dynamic authInfo = json.decode(res.body);
        var auth = AuthModel.fromJson(authInfo);
        return auth;
      } else {
        return AuthModel(
            token: 'token',
            refreshToken: 'refreshToken',
            success: false,
            errors: []);
      }
    } catch (e) {
      print(e);
      return AuthModel(
          token: 'token',
          refreshToken: 'refreshToken',
          success: false,
          errors: []);
    }
  }
}
