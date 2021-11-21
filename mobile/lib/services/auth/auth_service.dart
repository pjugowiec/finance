// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/components/navigation.dart';
import 'package:mobile/model/auth/register_user.dart';
import 'package:mobile/util/alert_util.dart';

import 'package:mobile/util/request_util.dart';

import '../../main.dart';

class AuthService {
  AuthService._private();

  static final AuthService _instance = AuthService._private();

  static AuthService get instance => _instance;

  bool _isLogged = false;

  bool getIsLogged() => _isLogged;

  void setIsLogged(bool value) => _isLogged = value;

  static String JWT_TOKEN = "";
  static const String AUTHORIZATION = "authorization";

  void registerUser(String email, String password, BuildContext context) async {
    var body = RegisterUser(email: email, password: password).toJson();

    await http.post(RequestUtil.getUri("register"),
        body: jsonEncode({"email": email, "password": password}),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json'
        }).then((response) {
      if (response.statusCode == 202) {
        login(email, password, context);
      } else {
        AlertUtil.instance.newInfoAlert(
            "Problem with connection", context, const Duration(seconds: 2));
      }
    });
  }

  Future login(String email, String password, BuildContext context) async {
    Map<String, String> headers = {
      "Authorization": 'Basic ' + base64Encode('$email:$password'.codeUnits)
    };

    await http
        .post(RequestUtil.getUri("login"), headers: headers)
        .then((response) {
      if (response.statusCode == 200) {
        Map<String, String> responseMap = response.headers;
        if (responseMap.containsKey(AUTHORIZATION)) {
          JWT_TOKEN = responseMap[AUTHORIZATION]!;
          setIsLogged(true);

          NavigationUtil.pushToNavigator(context, const Home());
        } else {
          AlertUtil.instance.newInfoAlert(
              "Problem with connection", context, const Duration(seconds: 2));
        }
      } else {
        AlertUtil.instance.newInfoAlert(
            "Wrong credentials", context, const Duration(seconds: 2));
      }
    });
  }
}