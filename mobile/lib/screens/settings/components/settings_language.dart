import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:mobile/components/back_bar_navigation.dart';
import 'package:mobile/util/localization.dart';

import '../../../constants.dart';

class SettingsLanguage extends StatelessWidget {
  const SettingsLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final String currentLocale = I18n.language;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: BackBarNavigation(label: 'LANGUAGES'.i18n),
      ),
      body: ListView(
        children: [
          ListBody(
            children: supportedLocales.map((locale) {
              return ListTile(
                  trailing: currentLocale == locale.languageCode
                      ? const Icon(Icons.check_circle, color: PRIMARY_COLOR)
                      : null,
                  title: Text(getTranslatedLanguage(locale.languageCode)),
                  onTap: () {
                    Localization.changeLang(context, locale);
                    Navigator.pop(context);
                  });
            }).toList(),
          ),
        ],
      ),
    );
  }
}
