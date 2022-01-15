import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:i18n_extension/i18n_widget.dart';
import 'package:mobile/util/alert_util.dart';
import 'package:mobile/util/localization.dart';
import 'package:mobile/util/request_util.dart';

class ForgottenPasswordRest {
  ForgottenPasswordRest._private();

  static final ForgottenPasswordRest _instance =
      ForgottenPasswordRest._private();

  static ForgottenPasswordRest get instance => _instance;

  Future<bool> sendCodeToEmail(BuildContext context, String email) async {
    final String currentLocale = I18n.language;

    if (email.isEmpty) {
      AlertUtil.showAlertWithDuration(
          context, 'EMAIL_CAN_NOT_BE_EMPTY'.i18n, const Duration(seconds: 2));
      throw Exception('EMAIL_CAN_NOT_BE_EMPTY'.i18n);
    }

    final response = await http.post(
        RequestUtil.getUri('password/forgot', {"email": email}),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          'lang': currentLocale
        });

    if (response.statusCode == 202) {
      AlertUtil.showAlertWithDuration(
          context, 'EMAIL_WITH_CODE_SEND'.i18n, const Duration(seconds: 2));
      return true;
    } else {
      AlertUtil.showAlertWithDuration(
          context, 'EMAIL_NOT_FOUND'.i18n, const Duration(seconds: 2));
      throw Exception('EMAIL_NOT_FOUND'.i18n);
    }
  }

  Future<bool> validateResetCode(
      BuildContext context, String email, String code) async {
    if (code.isEmpty) {
      AlertUtil.showAlertWithDuration(
          context, 'CODE_CAN_NOT_BE_EMPTY'.i18n, const Duration(seconds: 2));
      throw Exception('CODE_CAN_NOT_BE_EMPTY'.i18n);
    }
    final response = await http.post(
        RequestUtil.getUri('password/forgot/validate', {}),
        body: jsonEncode({"email": email, "code": code}),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});

    if (response.statusCode == 202) {
      return true;
    } else {
      AlertUtil.showAlertWithDuration(
          context, 'INCORRECT_CODE'.i18n, const Duration(seconds: 2));
      throw Exception('INCORRECT_CODE'.i18n);
    }
  }

  Future<bool> changePassword(
      BuildContext context, String newPassword, String email) async {
    if (email.isEmpty) {
      AlertUtil.showAlertWithDuration(
          context, 'EMAIL_CAN_NOT_BE_EMPTY'.i18n, const Duration(seconds: 2));
      throw Exception('EMAIL_CAN_NOT_BE_EMPTY'.i18n);
    }

    final response = await http.put(RequestUtil.getUri('change-password', {}),
        body: jsonEncode({"email": email, "newPassword": newPassword}),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});

    if (response.statusCode == 202) {
      return true;
    } else {
      AlertUtil.showAlertWithDuration(
          context, 'CONNECTION_PROBLEM'.i18n, const Duration(seconds: 2));
      throw Exception('CONNECTION_PROBLEM'.i18n);
    }
  }
}
