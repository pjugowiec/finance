import 'package:flutter/material.dart';
import 'package:mobile/components/back_bar_navigation.dart';
import 'package:mobile/util/localization.dart';

class SettingsLanguage extends StatelessWidget {
  const SettingsLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: BackBarNavigation(label: 'LANGUAGE'.i18n),
      ),


    );
  }
}
