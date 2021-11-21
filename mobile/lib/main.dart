import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile/screens/welcome_screen.dart';
import 'package:mobile/services/auth/auth_service.dart';
import 'package:mobile/util/app_localizations.dart';

import 'components/navigation.dart';

main() {
  runApp(const MaterialApp(
      supportedLocales: [
        Locale('pl','PL'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  bool isLogged = AuthService.instance.getIsLogged();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          isLogged ? const Navigation() : const WelcomeScreen(),
    );
  }
}
