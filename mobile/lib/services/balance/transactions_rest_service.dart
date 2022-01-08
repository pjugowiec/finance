import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobile/model/balance/transaction_short.dart';
import 'package:mobile/model/transactions/transactions_request.dart';
import 'package:mobile/services/auth/auth_service.dart';
import 'package:mobile/util/alert_util.dart';
import 'package:mobile/util/localization.dart';
import 'package:mobile/util/request_util.dart';

class TransactionsRestService {
  Future<List<TransactionShort>> getTransactions(
      TransactionsRequest request, BuildContext context) async {
    Map<String, dynamic> query = request.toJson();

    final response =
        await get(RequestUtil.getUri('balance/transactions', query), headers: {
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
