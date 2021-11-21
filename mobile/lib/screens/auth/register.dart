import 'package:flutter/material.dart';
import 'package:mobile/components/navigation.dart';
import 'package:mobile/components/rounded_button.dart';
import 'package:mobile/components/rounded_input.dart';
import 'package:mobile/components/rounded_password_field.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/screens/auth/login.dart';
import 'package:mobile/services/auth/auth_service.dart';
import 'package:mobile/util/app_localizations.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<Register> {
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
              AppLocalizations.of(context)!.translate("REGISTER"),
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
            margin: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
            child: RoundedButton(
                text: AppLocalizations.of(context)!.translate("REGISTER"),
                press: () => AuthService.instance.registerUser(
                    _emailController.value.text,
                    _passwordController.value.text,
                    context),
                color: PRIMARY_COLOR,
                textColor: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
            child: Text(
              AppLocalizations.of(context)!.translate("OR_ALREADY_HAVE_AN_ACCOUNT"),
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
                text: AppLocalizations.of(context)!.translate("LOGIN"),
                press: () =>
                    NavigationUtil.pushToNavigator(context, const Login()),
                color: SECONDARY_COLOR,
                textColor: Colors.black),
          ),
        ],
      ),
    );
  }
}
