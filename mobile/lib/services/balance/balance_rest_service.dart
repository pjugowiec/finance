import 'dart:io';

import 'package:mobile/model/balance/balance_summary.dart';
import 'package:mobile/services/auth/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/util/request_util.dart';

class BalanceRestService {

  static Future<BalanceSummaryModel> getSummary() async {
    AuthService.JWT_TOKEN;

    final response = await http.get(RequestUtil.getUri('balance'), headers: {
    HttpHeaders.contentTypeHeader: 'application/json',
      AuthService.AUTHORIZATION: AuthService.JWT_TOKEN
    });
    if (response.statusCode == 200) {
      final parsed = balanceSummaryFromJson(response.body);

      return parsed;
    } else {
      throw Exception('Failed to load album');
    }
  }

  BalanceRestService();
}