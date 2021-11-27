import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile/model/balance/balance_summary.dart';
import 'package:mobile/services/auth/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/util/alert_util.dart';
import 'package:mobile/util/localization.dart';
import 'package:mobile/util/request_util.dart';

class BalanceRestService {

  static Future<BalanceSummaryModel> getSummary(BuildContext context) async {
    AuthService.JWT_TOKEN;

    final response = await http.get(RequestUtil.getUri('balance'), headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
      AuthService.AUTHORIZATION: AuthService.JWT_TOKEN
    });
    if (response.statusCode == 200) {
      final parsed = balanceSummaryFromJson(response.body);

      return parsed;
    } else {
      AlertUtil.instance.newInfoAlert('CONNECTION_PROBLEM'.i18n, context, const Duration(seconds: 2));
      throw Exception('CONNECTION_PROBLEM'.i18n);
    }
  }
}