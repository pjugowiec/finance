import 'package:flutter/material.dart';
import 'package:mobile/screens/welcome_screen.dart';
import 'package:mobile/services/auth/auth_service.dart';

import 'components/navigation.dart';

main() {
  runApp(const MaterialApp(home: Home()));
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
