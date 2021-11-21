import 'package:flutter/material.dart';
import 'package:mobile/components/rounded_button.dart';
import 'package:mobile/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
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
                    child: const Text(
                      "Gain total control of your money",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 32.0),
                    )),
                Container(
                  margin:
                  const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: const Text(
                      "Track your transaction easily, with categories and financial report",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(fontWeight: FontWeight.w400)),
                ),
                Container(
                    margin: const EdgeInsets.only(
                        top: 80.0, left: 20.0, right: 20.0),
                    child: RoundedButton(
                      text: "Sign Up",
                      color: PRIMARY_COLOR,
                      press: () => null,
                      textColor: Colors.white,
                    ),
                ),
                RoundedButton(
                    text: "Sign in",
                    press: () => null,
                    color: SECONDARY_COLOR,
                    textColor: Colors.black)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
