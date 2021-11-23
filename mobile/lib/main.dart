import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:mobile/screens/balance/balance_screen.dart';
import 'package:mobile/screens/welcome_screen.dart';
import 'package:mobile/services/auth/auth_service.dart';

import 'util/localization.dart';

main() => runApp(const Home());

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {}

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final GlobalKey<HomeState> homeKey = GlobalKey();
  bool isLogged = AuthService.instance.getIsLogged();

  Locale _locale = const Locale('pl');

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          EN_LOCALE,
          PL_LOCALE,
        ],
        home: I18n(
          initialLocale: EN_LOCALE,
          child: Scaffold(
            body: true ? const Balance() : const WelcomeScreen(),
          ),
        ));
  }
}
