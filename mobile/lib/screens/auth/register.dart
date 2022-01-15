import 'package:flutter/material.dart';
import 'package:mobile/components/navigation.dart';
import 'package:mobile/components/rounded_button.dart';
import 'package:mobile/components/rounded_input.dart';
import 'package:mobile/components/rounded_password_field.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/screens/auth/login.dart';
import 'package:mobile/services/auth/auth_service.dart';
import 'package:mobile/util/alert_util.dart';
import 'package:mobile/util/localization.dart';

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
                "REGISTER".i18n,
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
                hintText: 'PASSWORD'.i18n,
                controller: _passwordController,
                onChanged: (value) {},
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
              child: RoundedButton(
                  text: "REGISTER".i18n,
                  press: ()
                  {
                    if (_formKey.currentState!.validate()) {
                      AuthService.instance.registerUser(
                          _emailController.value.text,
                          _passwordController.value.text,
                          context);
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
                "OR_ALREADY_HAVE_AN_ACCOUNT".i18n,
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
                  text: "LOGIN".i18n,
                  press: () =>
                      NavigationUtil.pushToNavigator(context, const Login()),
                  color: SECONDARY_COLOR,
                  textColor: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
