import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile/model/balance/balance_dto.dart';
import 'package:mobile/model/balance/balance_summary.dart';
import 'package:mobile/services/auth/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/util/alert_util.dart';
import 'package:mobile/util/localization.dart';
import 'package:mobile/util/request_util.dart';

class BalanceRestService {
  static Future<BalanceSummaryModel> getSummary(BuildContext context) async {
    AuthService.JWT_TOKEN;

    final response =
        await http.get(RequestUtil.getUri('balance', {}), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      AuthService.AUTHORIZATION: AuthService.JWT_TOKEN
    });
    if (response.statusCode == 200) {
      final parsed = balanceSummaryFromJson(response.body);

      return parsed;
    } else {
      AlertUtil.instance.newInfoAlert(
          'CONNECTION_PROBLEM'.i18n, context, const Duration(seconds: 2));
      throw Exception('CONNECTION_PROBLEM'.i18n);
    }
  }

  static Future<void> addBalance(
      BuildContext context, BalanceDto balance) async {
    await http.post(RequestUtil.getUri("balance", {}),
        body: jsonEncode(balance.toJson()),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          AuthService.AUTHORIZATION: AuthService.JWT_TOKEN
        }).then((response) {
      if (response.statusCode == 200) {
        Navigator.pop(context);
        AlertUtil.instance.newInfoAlert(
            "SUCCESSES_ADDED".i18n, context, const Duration(seconds: 2));
      } else {
        AlertUtil.instance.newInfoAlert(
            "CONNECTION_PROBLEM".i18n, context, const Duration(seconds: 2));
      }
    });
  }
}
