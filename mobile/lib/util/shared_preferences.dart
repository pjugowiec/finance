
import 'package:flutter/material.dart';
import 'package:mobile/util/localization.dart';

import 'alert_util.dart';

class SharedPreferences {

  static String CURRENCY = 'DOLLAR';

  static String getCurrencyShort(String currency) {
    switch (currency) {
      case('DOLLAR'):
        {
          return '\$';
        }
      default:
        {
          throw Exception('Not supported currency');
        }
    }
  }

  static void validatePassword(BuildContext context, String password) {
      if(password.isEmpty) {
        AlertUtil.showAlertWithDuration(
            context, 'FILL_PASSWORD_FIELD'.i18n, const Duration(seconds: 2));
        throw Exception('FILL_PASSWORD_FIELD'.i18n);
      } else if (password.length < 8) {
        AlertUtil.showAlertWithDuration(
            context, 'MIN_8_LENGTH_PASSWORD'.i18n, const Duration(seconds: 2));
        throw Exception('MIN_8_LENGTH_PASSWORD'.i18n);
      }

  }
}