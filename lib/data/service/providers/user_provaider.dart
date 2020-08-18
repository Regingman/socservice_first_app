import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:socservice_first_app/data/model/user.dart';

import '../api_service.dart';

class UserProvider {
  // login
  Future<User> getUserID(String username, String password) async {
    Map data = {
      'username': username,
      'password': password,
      'rememberMe': "false"
    };
    var response = await http.post(
      ApiService.login,
      headers: {"Content-Type": "application/json"},
      body: utf8.encode(json.encode(data)),
    );

    print("user: " + response.statusCode.toString());
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse == 488)
      throw Exception([jsonResponse, username, password]);
    if (jsonResponse == 401) throw Exception(jsonResponse);
    // сделать еще один запрос, с данными юзера или же возвращать их сразу на сервере
    User user = User(token: "qwe"); //User.fromJson(jsonResponse);
    if (user.name == null) {
      user.name = "";
    }
    if (user.userName == null) {
      user.userName = "";
    }
    if (user.phone == null) {
      user.phone = "";
    }
    return user;
  }
}
