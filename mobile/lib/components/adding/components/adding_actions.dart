import 'package:flutter/material.dart';
import 'package:mobile/util/localization.dart';

import '../../../constants.dart';
import '../../date_select.dart';
import '../../rounded_button.dart';
import '../../rounded_input.dart';

class AddingActions extends StatelessWidget {
  final TextEditingController dateInput;
  final TextEditingController descriptionInput;

  const AddingActions(
      {Key? key, required this.dateInput, required this.descriptionInput})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          width: size.width * 0.9,
          child: DateSelect(
            iconColor: PRIMARY_COLOR,
            backgroundColor: SECONDARY_COLOR,
            controller: dateInput,
            hintText: 'WHEN'.i18n,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          width: size.width * 0.9,
          child: DateSelect(
            iconColor: PRIMARY_COLOR,
            backgroundColor: SECONDARY_COLOR,
            controller: dateInput,
            hintText: 'WHEN'.i18n,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          width: size.width * 0.9,
          child: RoundedInputField(
            hintText: 'DESCRIPTION'.i18n,
            onChanged: (value) => {},
            controller: descriptionInput,
            icon: Icons.description,
          ),
        ),
        Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            width: size.width * 0.9,
            child: RoundedButton(
              textColor: Colors.white,
              color: PRIMARY_COLOR,
              text: 'SAVE'.i18n,
              press: () => {},
            )),
      ],
    );
  }
}
