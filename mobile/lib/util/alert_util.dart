import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AlertUtil {
  AlertUtil._private();

  static final AlertUtil _instance = AlertUtil._private();

  static AlertUtil get instance => _instance;

  void newInfoAlert(
      String message, BuildContext context, Duration duration) {

    showFlash(
      context: context,
      duration: duration,
      persistent: true,
      builder: (_, controller) {
        return Flash(
          controller: controller,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          boxShadows: const [BoxShadow(blurRadius: 4)],
          barrierBlur: 5.0,
          barrierColor: Colors.black38,
          barrierDismissible: true,
          behavior: FlashBehavior.fixed,
          position: FlashPosition.bottom,
          child: FlashBar(
            content: Text(message),
            primaryAction: TextButton(
              onPressed: () => controller.dismiss(),
              child: const Text('Ok', style: TextStyle(color: Colors.black)),
            ),
          ),
        );
      },
    );
  }
}
