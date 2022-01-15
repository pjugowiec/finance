import 'package:flutter/material.dart';
import 'package:mobile/components/navigation.dart';
import 'package:mobile/components/rounded_button.dart';
import 'package:mobile/components/rounded_input.dart';
import 'package:mobile/components/rounded_password_field.dart';
import 'package:mobile/screens/auth/register.dart';
import 'package:mobile/services/auth/auth_service.dart';
import 'package:mobile/util/alert_util.dart';
import 'package:mobile/util/localization.dart';

import '../../constants.dart';
import 'forgotten_password.dart';

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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                  top: 60.0, left: 20.0, right: 20.0, bottom: 60.0),
              child: Text(
                "LOGIN".i18n,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 32.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
              child: RoundedInputField(
                keyboardtype: TextInputType.emailAddress,
                controller: _emailController,
                icon: Icons.alternate_email,
                hintText: "EMAIL".i18n,
                onChanged: (value) {},
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
              child: RoundedPasswordField(
                controller: _passwordController,
                onChanged: (value) {},
                hintText: 'PASSWORD'.i18n,
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
                child: TextButton(
                  onPressed: () => NavigationUtil.pushToNavigator(
                      context, ForgottenPassword()),
                  style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all<Color>(SECONDARY_COLOR),
                  ),
                  child: Text(
                    "FORGOT_PASSWORD".i18n,
                    style: const TextStyle(color: PRIMARY_COLOR),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: RoundedButton(
                  text: "LOGIN".i18n,
                  press: () {
                    if (_formKey.currentState!.validate()) {
                      AuthService.instance.login(_emailController.value.text,
                          _passwordController.value.text, context);
                    } else {
                      AlertUtil.instance.newInfoAlert(
                          'FIELDS_CAN_NO_BE_EMPTY'.i18n,
                          context,
                          const Duration(seconds: 2));
                    }
                  },
                  color: PRIMARY_COLOR,
                  textColor: Colors.white),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              child: Text(
                "OR_CREATE_NEW_ACCOUNT".i18n,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: const TextStyle(
                    fontWeight: FontWeight.w400, color: PRIMARY_COLOR),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              child: RoundedButton(
                text: "REGISTER".i18n,
                press: () =>
                    NavigationUtil.pushToNavigator(context, const Register()),
                color: SECONDARY_COLOR,
                textColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
