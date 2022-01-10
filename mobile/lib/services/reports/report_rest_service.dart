import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:mobile/model/reports/category_report_model.dart';
import 'package:mobile/services/auth/auth_service.dart';
import 'package:mobile/util/alert_util.dart';
import 'package:mobile/util/localization.dart';
import 'package:mobile/util/request_util.dart';

class ReportRestService {

  static Future<List<CategoryReportModel>> getCategoryReport(BuildContext context) async {

    final response =
        await get(RequestUtil.getUri('report/category', {}), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      AuthService.AUTHORIZATION: AuthService.JWT_TOKEN
    });

    if (response.statusCode == 200) {
      final parsed = jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;

      return parsed.map((data) => CategoryReportModel.fromJson(data)).toList();
    } else {
      AlertUtil.instance.newInfoAlert(
          'CONNECTION_PROBLEM'.i18n, context, const Duration(seconds: 2));
      throw Exception('CONNECTION_PROBLEM'.i18n);
    }
  }
}
