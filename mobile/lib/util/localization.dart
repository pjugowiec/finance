// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:i18n_extension/i18n_widget.dart';

const List<Locale> supportedLocales = [
  Locale('pl', 'PL'),
  Locale('en', 'US')
];

String getTranslatedLanguage(String language) {
  switch(language) {
    case 'pl': {
      return 'POLISH'.i18n;
    }
    case 'en': {
      return 'ENGLISH'.i18n;
    }
    default: {
      throw Exception('Not supported language');
    }
  }
}
extension Localization on String {
  String get i18n => localize(this, _t);

  String fill(List<Object> params) => localizeFill(this, params);

  String plural(int value) => localizePlural(value, this, _t);

  static Map<String, Map<String, String>> translations = {};
  static final _t = Translations.byLocale("en_us") + {
    "en_us": {
      "ENGLISH": "English",
      "POLISH": "Polish",
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
      "DASHBOARD": "Dashboard",
      "BALANCE_GOOD_FINANCE": "Your finances are looking good",
      "BALANCE_BAD_FINANCE": "Your finances are looking bad",
      "INCOME": "Income",
      "EXPENSES": "Expenses",
      "TODAY": "Today",
      "WEEK": "Week",
      "MONTH": "Month",
      "YEAR": "Year",
      "SETTINGS": "Settings",
      "COMMONS": "Commons",
      "LANGUAGES": "Languages",
      "CURRENCIES": "Currencies",
      "DOLLAR": "Dollar",
      "POLISH_ZLOTY": "Polish złoty",
      "USD_SHORT": "USD",
      "INFORMATION": "Information",
      "HELP": "Help",
      "ABOUT": "About",
      "LOGOUT": "Logout",
      "GENERAL": "General",
      "RECENT_TRANSACTION": "Recent Transaction",
      "SEE_ALL": "See all",
      "WHEN": "When",
      "SAVE": "Save",
      "AFTER_CHANGE": "After Change:",
      "CURRENT_BALANCE": "Current Balance:",
      "HOW_MUCH": "How much?",
      "DESCRIPTION": "Description",
      "CHOOSE_CATEGORY": "Choose category",
      "SUCCESSES_ADDED": "Successes added",
      "CATEGORY": "Category",
      "SORT": "Sort",
      "AMOUNT": "Amount",
      "DATE": "Date",
      "TRANSACTIONS": "Transactions",
      "MIN_AMOUNT": "Minimum amount",
      "MAX_AMOUNT": "Maximum amount",
      "FROM": "From",
      "TO": "To",
      "SORT_FIELD": "Sort field",
      "SORT_ORDER": "Order",
      "INCREASING": "Increasing ASC",
      "DECREASING": "Decreasing DESC"
    },
    "pl_pl": {
      "ENGLISH": "Angielski",
      "POLISH": "Polski",
      "IN_PROGRESS": "W trakcie prac",
      "REGISTER": "Rejestracja",
      "LOGIN": "Logowanie",
      "EMAIL": "Email",
      "PASSWORD": "Hasło",
      "FORGOT_PASSWORD": "Zapomniane hasło?",
      "OR_CREATE_NEW_ACCOUNT": "Lub zarejestruj nowe konto",
      "OR_ALREADY_HAVE_AN_ACCOUNT": "Lub posiadasz konto?",
      "FIRST_WELCOME": "Uzyskaj kontrolę nad swoimi pieniędzmi",
      "SECOND_WELCOME": "Łatwe śledzenie transakcji dzięki kategoryzowaniu oraz raportom finansowym",
      "CONNECTION_PROBLEM": "Problem z połączeniem",
      "WRONG_CREDENTIALS": "Złe dane do logowania",
      "BALANCE": "Bilans",
      "DASHBOARD": "Pulpit",
      "BALANCE_GOOD_FINANCE": "Twoje finanse wyglądają dobrze",
      "BALANCE_BAD_FINANCE": "Twoje finanse wyglądają źle",
      "INCOME": "Przychody",
      "EXPENSES": "Wydatki",
      "TODAY": "Dzisiaj",
      "WEEK": "Tydzień",
      "MONTH": "Miesiąc",
      "YEAR": "Rok",
      "SETTINGS": "Ustawienia",
      "COMMONS": "Ogólne",
      "LANGUAGES": "Języki",
      "CURRENCIES": "Waluty",
      "DOLLAR": "Dolar",
      "POLISH_ZLOTY": "Polski złoty",
      "USD_SHORT": "USD",
      "INFORMATION": "Informacje",
      "HELP": "Pomoc",
      "ABOUT": "O nas",
      "LOGOUT": "Wyloguj",
      "GENERAL": "Ogólne",
      "RECENT_TRANSACTION": "Ostatnie transakcje",
      "SEE_ALL": "Pokaż wszystko",
      "WHEN": "Kiedy",
      "SAVE": "Zapisz",
      "AFTER_CHANGE": "Po zmianie:",
      "CURRENT_BALANCE": "Akutalny bilans:",
      "HOW_MUCH": "Ile?",
      "DESCRIPTION": "Opis"
    }
  };

  static void changeLang(BuildContext context, Locale locale) {
    I18n.of(context).locale = locale;
  }
}
