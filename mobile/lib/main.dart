import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:mobile/screens/balance/balance_screen.dart';
import 'package:mobile/screens/welcome_screen.dart';
import 'package:mobile/services/auth/auth_service.dart';

import 'components/navigation.dart';
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

  @override
  Widget build(BuildContext context) {
    return I18n(
      initialLocale: supportedLocales
          .firstWhere((element) => element.languageCode == 'en'),
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: supportedLocales,
        home: Scaffold(
          body: isLogged ? const Balance() : const WelcomeScreen(),
        ),
      ),
    );
  }
}
