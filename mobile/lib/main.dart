import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile/screens/balance/balance_screen.dart';
import 'package:mobile/screens/welcome_screen.dart';
import 'package:mobile/services/auth/auth_service.dart';
import 'package:mobile/util/app_localizations.dart';

import 'components/navigation.dart';

main() => runApp(const Home());

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
  }

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
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: Scaffold(
        bottomNavigationBar: isLogged ? const Balance() : const WelcomeScreen(),
      ),
    );
  }
}
