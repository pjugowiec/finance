import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/screens/balance/components/balance_summary.dart';
import 'package:mobile/util/income_util.dart';
import 'package:mobile/util/localization.dart';
import 'package:mobile/util/shared_preferences.dart';

import '../back_bar_navigation.dart';
import 'components/adding_actions.dart';

class AddIncome extends StatefulWidget {
  const AddIncome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  TextEditingController dateInput = TextEditingController();
  TextEditingController descriptionInput = TextEditingController();
  TextEditingController balanceInput = TextEditingController();

  final String prefixCurrency =
      SharedPreferences.getCurrencyShort(SharedPreferences.CURRENCY);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: BackBarNavigation(
          label: 'INCOME '.i18n,
          background: Colors.white,
          textColor: Colors.black,
          iconColor: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'HOW_MUCH'.i18n,
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 16)),
                      const TextSpan(text: '\n'),
                      const TextSpan(text: '\n'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 30.0),
                  child: TextFormField(
                    textDirection: TextDirection.ltr,
                    controller: balanceInput,
                    onChanged: (value) {
                      balanceInput.text = value;
                    },
                    cursorColor: Colors.black,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: prefixCurrency + '000',
                      hintStyle: const TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 30.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'CURRENT_BALANCE'.i18n,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 14)),
                            const TextSpan(text: '\n'),
                            const TextSpan(text: '\n'),
                            TextSpan(
                                text: prefixCurrency +
                                    BalanceSummary.currentBalance.toString(),
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 30.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'AFTER_CHANGE'.i18n,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 14)),
                            const TextSpan(text: '\n'),
                            const TextSpan(text: '\n'),
                            TextSpan(
                                text: prefixCurrency +
                                    IncomeUtil.addIncome(
                                            1000, BalanceSummary.currentBalance)
                                        .toString(),
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
