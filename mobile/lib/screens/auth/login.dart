import 'package:flutter/material.dart';
import 'package:mobile/components/navigation.dart';
import 'package:mobile/components/rounded_button.dart';
import 'package:mobile/components/rounded_input.dart';
import 'package:mobile/components/rounded_password_field.dart';
import 'package:mobile/screens/auth/register.dart';
import 'package:mobile/services/auth/auth_service.dart';
import 'package:mobile/util/app_localizations.dart';

import '../../constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
                top: 60.0, left: 20.0, right: 20.0, bottom: 60.0),
            child: Text(
              AppLocalizations.of(context)!.translate("LOGIN"),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
            child: RoundedInputField(
              controller: _emailController,
              icon: Icons.alternate_email,
              hintText: AppLocalizations.of(context)!.translate("EMAIL"),
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
            child: RoundedPasswordField(
              controller: _passwordController,
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                primary: PRIMARY_COLOR,
                textStyle: const TextStyle(fontSize: 14),
              ),
              child: Text(AppLocalizations.of(context)!.translate("FORGOT_PASSWORD")),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: RoundedButton(
                text: AppLocalizations.of(context)!.translate("LOGIN"),
                press: () => AuthService.instance.login(
                    _emailController.value.text,
                    _passwordController.value.text,
                    context),
                color: PRIMARY_COLOR,
                textColor: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
            child: Text(
              AppLocalizations.of(context)!.translate("OR_CREATE_NEW_ACCOUNT"),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: const TextStyle(
                  fontWeight: FontWeight.w400, color: FONT_LIGHT_COLOR),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
            child: RoundedButton(
                text: AppLocalizations.of(context)!.translate("REGISTER"),
                press: () =>
                    NavigationUtil.pushToNavigator(context, const Register()),
                color: SECONDARY_COLOR,
                textColor: Colors.black),
          ),
        ],
      ),
    );
  }
}
