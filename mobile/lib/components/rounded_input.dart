import 'package:flutter/material.dart';
import 'package:mobile/components/text_field_container.dart';
import 'package:mobile/util/localization.dart';

import '../constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final TextInputType? keyboardtype;
  final Function validator;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.controller,
    this.keyboardtype = TextInputType.text,
    this.validator = basicValidate,
  }) : super(key: key);

  static String? basicValidate(value) {
    if (value == null || value.isEmpty) {
      return 'FILL_THIS_FIELD'.i18n;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: SECONDARY_COLOR,
      child: TextFormField(
        keyboardType: keyboardtype,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'FILL_THIS_FIELD'.i18n;
          }
          return null;
        },
        controller: controller,
        onChanged: onChanged,
        cursorColor: PRIMARY_COLOR,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: PRIMARY_COLOR,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
