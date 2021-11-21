import 'package:flutter/material.dart';
import 'package:mobile/components/text_field_container.dart';

import '../constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: SECONDARY_COLOR,
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: PRIMARY_COLOR,
        decoration: const InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: PRIMARY_COLOR,
          ),
          // suffixIcon: Icon(
          //   Icons.visibility,
          //   color: PRIMARY_COLOR,
          // ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}