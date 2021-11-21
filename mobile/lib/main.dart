import 'package:flutter/material.dart';
import 'package:mobile/screens/welcome_screen.dart';

import 'components/navigation.dart';
import 'components/shared_preferences.dart';

bool isLogged = SharedPreferences.instance.getIsLogged();

main() {
  runApp(const MaterialApp(home: Home())
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: isLogged ? const Navigation() : const WelcomeScreen(),
    );
  }

}





