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
      "DECREASING": "Decreasing DESC",
      "REPORTS": "Reports",
      "CATEGORY_REPORT_DESCRIPTION": "Report on the share of expenses in categories",
      "YEAR_INCOME_EXPENSES_REPORT_DESCRIPTION": "Income and expense report throughout the year",
      "FORGOTTEN_PASSWORD": "Forgotten password reminder",
      "FORGOTTEN_EMAIL_SUBTITLE": "Enter your email address to receive a password reset code",
      "CONFIRM": "Confirm",
      "CANCEL": "Cancel",
      "BACK": "Back",
      "SEND": "Send",
      "CODE": "Code",
      "FORGOTTEN_CODE_INPUT": "Code from email",
      "FORGOTTEN_CODE_SUBTITLE": "Enter the code from your email",
      "PASSWORD_CHANGE": "Password change",
      "FORGOTTEN_PASSWORD_SUBTITLE": "Change your account password",
      "NEW_PASSWORD": "New password",
      "CONFIRM_NEW_PASSWORD": "Confirm new password",
      "EMAIL_NOT_FOUND": "Email not found",
      "EMAIL_WITH_CODE_SEND": "Email sent with code",
      "EMAIL_CAN_NOT_BE_EMPTY": "Email can't be empty",
      "CODE_CAN_NOT_BE_EMPTY": "Code can't be empty",
      "PASSWORD_CAN_NOT_BE_EMPTY": "Password can't be empty",
      "INCORRECT_CODE": "Incorrect code",
      "FIELDS_CAN_NO_BE_EMPTY": "Fields can't be empty",
      "FILL_THIS_FIELD": "Please fill this field",
      "FILL_PASSWORD_FIELD": "Please fill password field",
      "MIN_8_LENGTH_PASSWORD": "Password must be at least 8 characters long",
      "PASSWORD_ARE_NOT_SAME": "Passwords are not the same"

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
      "DESCRIPTION": "Opis",
      "CHOOSE_CATEGORY": "Wybór kategorii",
      "SUCCESSES_ADDED": "Pomyślnie dodano",
      "CATEGORY": "Kategoria",
      "SORT": "Sortowanie",
      "AMOUNT": "Ilość",
      "DATE": "Data",
      "TRANSACTIONS": "Transakcje",
      "MIN_AMOUNT": "Minimalna ilość",
      "MAX_AMOUNT": "Maksymalna ilość",
      "FROM": "Od",
      "TO": "Do",
      "SORT_FIELD": "Sortowanie",
      "SORT_ORDER": "Kierunek",
      "INCREASING": "Rosnące ASC",
      "DECREASING": "Malejące DESC",
      "REPORTS": "Raporty",
      "CATEGORY_REPORT_DESCRIPTION": "Raport o udziale wydatków w kategoriach",
      "YEAR_INCOME_EXPENSES_REPORT_DESCRIPTION": "Raport przychodów i wydatków przez cały rok",
      "FORGOTTEN_PASSWORD": "Przypomnienie zapomnianego hasła",
      "FORGOTTEN_EMAIL_SUBTITLE": "Wpisz swój adres email, aby otrzymać kod resetowania hasła",
      "CONFIRM": "Potwierdź",
      "CANCEL": "Anuluj",
      "BACK": "Cofnij",
      "SEND": "Wyślij",
      "CODE": "Kod",
      "FORGOTTEN_CODE_INPUT": "Kod z emaila",
      "FORGOTTEN_CODE_SUBTITLE": "Wpisz kod z emaila",
      "PASSWORD_CHANGE": "Zmiana hasła",
      "FORGOTTEN_PASSWORD_SUBTITLE": "Pomyślnie zmieniono hasło",
      "NEW_PASSWORD": "Nowe hasło",
      "CONFIRM_NEW_PASSWORD": "Potwierdź nowe hasło",
      "EMAIL_NOT_FOUND": "Nie znaleziono emaila",
      "EMAIL_WITH_CODE_SEND": "Email z kodem został wysłany",
      "EMAIL_CAN_NOT_BE_EMPTY": "Email nie może być pusty",
      "CODE_CAN_NOT_BE_EMPTY": "Kod nie może być pusty",
      "PASSWORD_CAN_NOT_BE_EMPTY": "Hasło nie może być puste",
      "INCORRECT_CODE": "Nieprawidłowy kod",
      "FIELDS_CAN_NO_BE_EMPTY": "Pola nie mogą być puste",
      "FILL_THIS_FIELD": "Proszę wypełnić to pole",
      "FILL_PASSWORD_FIELD": "Proszę wypełnić pole hasła",
      "MIN_8_LENGTH_PASSWORD": "Hasło musi mieć co najmniej 8 znaków",
      "PASSWORD_ARE_NOT_SAME": "Hasła nie są takie same"
    }
  };

  static void changeLang(BuildContext context, Locale locale) {
    I18n.of(context).locale = locale;
  }
}
