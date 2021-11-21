import 'package:flutter/material.dart';
import 'package:mobile/components/navigation.dart';
import 'package:mobile/components/rounded_button.dart';
import 'package:mobile/components/rounded_input.dart';
import 'package:mobile/components/rounded_password_field.dart';

import '../../constants.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
                top: 60.0, left: 20.0, right: 20.0, bottom: 60.0),
            child: const Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
            child: RoundedInputField(
              icon: Icons.alternate_email,
              hintText: "Email",
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
            child: RoundedPasswordField(
              onChanged: (value) {},
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
            child: RoundedButton(
                text: "Login",
                press: () => null, // todo serwis do logowania
                color: PRIMARY_COLOR,
                textColor: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
            child: const Text(
              "Or register new account",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                  fontWeight: FontWeight.w400, color: FONT_LIGHT_COLOR),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
            child: RoundedButton(
                text: "Register",
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
