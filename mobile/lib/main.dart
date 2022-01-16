import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:mobile/screens/balance/balance_screen.dart';
import 'package:mobile/screens/welcome_screen.dart';
import 'package:mobile/services/auth/auth_service.dart';
import 'package:page_transition/page_transition.dart';

import 'constants.dart';
import 'util/localization.dart';

main() => runApp(Home());

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {}

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final GlobalKey<HomeState> homeKey = GlobalKey();
  final bool isLogged = AuthService.instance.getIsLogged();

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
          backgroundColor: Colors.black,
          body: AnimatedSplashScreen.withScreenFunction(
            duration: 3000,
            backgroundColor: PRIMARY_COLOR,
            splash: const Icon(
              Icons.attach_money,
              color: Colors.white,
              size: 100,
            ),
            screenFunction: () async {
              return isLogged ? const Balance() : const WelcomeScreen();
            },
            splashTransition: SplashTransition.fadeTransition,
          ),
        ),
      ),
    );
  }
}
