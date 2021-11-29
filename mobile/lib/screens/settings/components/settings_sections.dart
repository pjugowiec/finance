import 'package:flutter/material.dart';
import 'package:mobile/components/navigation.dart';
import 'package:mobile/screens/settings/components/settings_language.dart';
import 'package:mobile/util/localization.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsSections extends StatelessWidget {
  const SettingsSections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SettingsList(
        sections: [
          SettingsSection(
            title: 'COMMONS'.i18n,
            tiles: [
              SettingsTile(
                title: 'LANGUAGES'.i18n,
                subtitle: 'ENGLISH'.i18n,
                onPressed: (BuildContext context) {
                  NavigationUtil.pushToNavigator(context, const SettingsLanguage());
                },
              ),
              SettingsTile(
                title: 'CURRENCIES'.i18n,
                subtitle: 'USD_SHORT'.i18n,
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
          SettingsSection(title: 'INFORMATION'.i18n, tiles: [
            SettingsTile(
              title: 'HELP'.i18n,
              onPressed: (BuildContext context) {},
            ),
            SettingsTile(
              title: 'ABOUT'.i18n,
              onPressed: (BuildContext context) {},
            ),
          ]),
          SettingsSection(
            title: 'GENERAL'.i18n,
            tiles: [
              SettingsTile(
                title: 'LOGOUT'.i18n,
                onPressed: (BuildContext context) {},
              ),
            ],
          )
        ],
      );
}
