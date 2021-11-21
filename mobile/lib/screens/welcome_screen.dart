import 'package:flutter/material.dart';
import 'package:mobile/components/navigation.dart';
import 'package:mobile/components/rounded_button.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/util/app_localizations.dart';

import 'auth/login.dart';
import 'auth/register.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin:
                      const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                  child: Image.asset(
                    "assets/images/welcome_screen.png",
                    width: size.width * 0.8,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(
                        top: 40.0, left: 20.0, right: 20.0),
                    child: Text(
                      AppLocalizations.of(context)!.translate("FIRST_WELCOME"),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 32.0),
                    )),
                Container(
                  margin:
                      const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Text(
                      AppLocalizations.of(context)!.translate("SECOND_WELCOME"),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(fontWeight: FontWeight.w400)),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
                  child: RoundedButton(
                    text: AppLocalizations.of(context)!.translate("REGISTER"),
                    color: PRIMARY_COLOR,
                    press: () =>
                        NavigationUtil.pushToNavigator(context, const Register()),
                    textColor: Colors.white,
                  ),
                ),
                RoundedButton(
                    text: AppLocalizations.of(context)!.translate("LOGIN"),
                    press: () => NavigationUtil.pushToNavigator(context, const Login()),
                    color: SECONDARY_COLOR,
                    textColor: Colors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
