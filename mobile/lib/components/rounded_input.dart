
import 'package:flutter/material.dart';
import 'package:mobile/components/text_field_container.dart';

import '../constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: SECONDARY_COLOR,
      child: TextField(
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