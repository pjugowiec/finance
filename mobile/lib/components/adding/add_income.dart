import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:intl/intl.dart';
import 'package:mobile/components/rounded_button.dart';
import 'package:mobile/components/rounded_input.dart';
import 'package:mobile/components/text_field_container.dart';
import 'package:mobile/util/localization.dart';

import '../../constants.dart';
import '../back_bar_navigation.dart';
import '../date_select.dart';
import 'components/adding_actions.dart';

class AddIncome extends StatefulWidget {
  const AddIncome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  TextEditingController dateInput = TextEditingController();
  TextEditingController descriptionInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: BackBarNavigation(
          label: 'INCOME'.i18n,
          background: Colors.white,
          textColor: Colors.black,
          iconColor: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(color: Colors.red),
          ),
          const Divider(),
          Expanded(
            flex: 6,
            child: AddingActions(
              dateInput: dateInput,
              descriptionInput: descriptionInput,
            ),
          ),
        ],
      ),
    );
  }
}
