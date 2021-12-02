import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/model/balance/transaction_short.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/services/auth/auth_service.dart';
import 'package:mobile/util/alert_util.dart';
import 'package:mobile/util/localization.dart';
import 'package:mobile/util/request_util.dart';

class TransactionsRestService {

  Future<List<TransactionShort>> getTransactions(
      BuildContext context, int count, DateTime from, DateTime to) async {

    Map<String, dynamic> query = {
      "count": count.toString(),
      "to": DateFormat('yyyy-MM-ddThh:mm:ss').format(to),
      "from": DateFormat('yyyy-MM-ddThh:mm:ss').format(from)
    };

    final response = await http
        .get(RequestUtil.getUri('balance/transactions', query), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      AuthService.AUTHORIZATION: AuthService.JWT_TOKEN
    });
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body) as List<dynamic>;

      return parsed.map((data) => TransactionShort.fromJson(data)).toList();
    } else {
      AlertUtil.instance.newInfoAlert(
          'CONNECTION_PROBLEM'.i18n, context, const Duration(seconds: 2));
      throw Exception('CONNECTION_PROBLEM'.i18n);
    }
  }
}
