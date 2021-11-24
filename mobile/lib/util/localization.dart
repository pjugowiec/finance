// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:i18n_extension/i18n_widget.dart';

const Locale PL_LOCALE = Locale('pl', 'PL');
const Locale EN_LOCALE = Locale('en', 'US');

extension Localization on String {
  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(int value) => localizePlural(value, this, _t);

  static Map<String, Map<String, String>> translations = {};
  static final _t = Translations.byLocale("en_us") + {
    "en_us": {
      "LANGUAGE": "English",
      "IN_PROGRESS": "In progress",
      "REGISTER": "Register",
      "LOGIN": "Login",
      "EMAIL": "Email",
      "PASSWORD": "Password",
      "FORGOT_PASSWORD": "Forgot password?",
      "OR_CREATE_NEW_ACCOUNT": "Or register new account",
      "OR_ALREADY_HAVE_AN_ACCOUNT": "Or already have an account?",
      "FIRST_WELCOME": "Gain total control of your money",
      "SECOND_WELCOME": "Track your transaction easily, with categories and financial report",
      "CONNECTION_PROBLEM": "Problem with connection",
      "WRONG_CREDENTIALS": "Wrong credentials",
      "BALANCE": "Balance",
      "BALANCE_GOOD_FINANCE": "Your finances are looking good",
      "INCOME": "Income",
      "EXPENSES": "Expenses"
    },
    "pl_pl": {
      "LANGUAGE": "Polski",
      "IN_PROGRESS": "W trakcie pracy",
      "REGISTER": "Rejestracja",
      "LOGIN": "Zaloguj",
      "FIRST_WELCOME": "Uzyskaj kontrolę nad swoimi pieniędzmi",
      "SECOND_WELCOME": "Łatwe śledzenie transakcji dzięki kategoryzowaniu oraz raportom finansowym"
    }
  };

  static void changeLang(BuildContext context, Locale locale) {
    I18n.of(context).locale = locale;
  }
}
