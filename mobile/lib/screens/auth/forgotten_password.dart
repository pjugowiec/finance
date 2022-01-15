import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobile/components/back_bar_navigation.dart';
import 'package:mobile/components/navigation.dart';
import 'package:mobile/components/rounded_input.dart';
import 'package:mobile/components/rounded_password_field.dart';
import 'package:mobile/screens/auth/login.dart';
import 'package:mobile/services/auth/forgotten_password_rest.dart';
import 'package:mobile/util/alert_util.dart';
import 'package:mobile/util/localization.dart';
import 'package:mobile/util/shared_preferences.dart';

import '../../constants.dart';

class ForgottenPassword extends StatefulWidget {
  const ForgottenPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ForgottenPasswordState();
}

class _ForgottenPasswordState extends State<ForgottenPassword> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newPasswordConfirmController =
      TextEditingController();
  int _currentStep = 0;
  bool _loading = false;

  _continued() async {
    setState(() {
      _loading = true;
    });

    try {
      bool validStep = await _validateRequest().then((bool value) => value);

      if (validStep) {
        if(_currentStep == 2) {
          NavigationUtil.pushToNavigator(context, Login());
        } else {
          _currentStep < 2 ? setState(() => _currentStep += 1) : null;
          setState(() {
            _loading = false;
          });
        }
      }
    } catch (e) {
      setState(() {
        _loading = false;
      });
    }
  }

  _cancel() {
    _currentStep > 0
        ? setState(() => _currentStep -= 1)
        : Navigator.pop(context);
  }

  Future<bool> _validateRequest() async {
    switch (_currentStep) {
      case 0:
        return ForgottenPasswordRest.instance
            .sendCodeToEmail(context, _emailController.text);
      case 1:
        return ForgottenPasswordRest.instance.validateResetCode(
            context, _emailController.text, _codeController.text);
      case 2:
        _validatePassword(context);
        return ForgottenPasswordRest.instance.changePassword(
            context, _newPasswordConfirmController.text, _emailController.text);
      default:
        throw Exception('Wrong step');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: BackBarNavigation(
            label: 'FORGOTTEN_PASSWORD'.i18n,
            background: Colors.white,
            textColor: Colors.black,
            iconColor: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: Theme(
              data: ThemeData(
                  colorScheme: const ColorScheme.light(primary: PRIMARY_COLOR)),
              child: Stepper(
                type: StepperType.vertical,
                physics: const ScrollPhysics(),
                currentStep: _currentStep,
                onStepContinue: _continued,
                onStepCancel: _cancel,
                controlsBuilder: (BuildContext context,
                    {VoidCallback? onStepContinue,
                    VoidCallback? onStepCancel}) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _loading
                          ? const SpinKitThreeBounce(
                              color: PRIMARY_COLOR, size: 20.0)
                          : ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        PRIMARY_COLOR),
                              ),
                              onPressed: onStepContinue,
                              child: _currentStep > 0
                                  ? Text('CONFIRM'.i18n)
                                  : Text('SEND'.i18n),
                            ),
                    ],
                  );
                },
                steps: <Step>[
                  Step(
                    subtitle: Text('FORGOTTEN_EMAIL_SUBTITLE'.i18n),
                    title: Text('EMAIL'.i18n),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                    content: RoundedInputField(
                      keyboardtype: TextInputType.emailAddress,
                      icon: Icons.alternate_email,
                      controller: _emailController,
                      hintText: 'EMAIL'.i18n,
                      onChanged: (value) {},
                    ),
                  ),
                  Step(
                    subtitle: Text('FORGOTTEN_CODE_SUBTITLE'.i18n),
                    title: Text('CODE'.i18n),
                    content: RoundedInputField(
                      icon: Icons.confirmation_number,
                      controller: _codeController,
                      hintText: 'FORGOTTEN_CODE_INPUT'.i18n,
                      onChanged: (value) {},
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    subtitle: Text('FORGOTTEN_PASSWORD_SUBTITLE'.i18n),
                    title: Text('PASSWORD_CHANGE'.i18n),
                    content: Column(
                      children: <Widget>[
                        RoundedPasswordField(
                          controller: _newPasswordController,
                          hintText: 'NEW_PASSWORD'.i18n,
                          onChanged: (value) {},
                        ),
                        RoundedPasswordField(
                          hintText: 'CONFIRM_NEW_PASSWORD'.i18n,
                          controller: _newPasswordConfirmController,
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _validatePassword(BuildContext context) {
    SharedPreferences.validatePassword(context, _newPasswordController.text);
    SharedPreferences.validatePassword(
        context, _newPasswordConfirmController.text);

    if (_newPasswordController.text != _newPasswordConfirmController.text) {
      AlertUtil.showAlertWithDuration(
          context, 'PASSWORD_ARE_NOT_SAME'.i18n, const Duration(seconds: 2));
      throw Exception('PASSWORD_ARE_NOT_SAME'.i18n);
    }
  }
}
