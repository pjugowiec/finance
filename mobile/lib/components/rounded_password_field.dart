import 'package:flutter/material.dart';
import 'package:mobile/components/text_field_container.dart';
import 'package:mobile/util/localization.dart';

import '../constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: SECONDARY_COLOR,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'FILL_THIS_FIELD'.i18n;
          }
          return null;
        },
        controller: controller,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: PRIMARY_COLOR,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.lock,
            color: PRIMARY_COLOR,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}