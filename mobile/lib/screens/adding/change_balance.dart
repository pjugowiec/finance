import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/components/back_bar_navigation.dart';
import 'package:mobile/model/balance/balance_dto.dart';
import 'package:mobile/screens/balance/components/balance_summary.dart';
import 'package:mobile/services/balance/balance_rest_service.dart';
import 'package:mobile/util/income_util.dart';
import 'package:mobile/util/localization.dart';
import 'package:mobile/util/shared_preferences.dart';

import '../../constants.dart';
import 'components/adding_actions.dart';

class ChangeBalance extends StatefulWidget {
  const ChangeBalance({Key? key, required this.isIncome}) : super(key: key);

  final bool isIncome;

  @override
  State<StatefulWidget> createState() => _ChangeBalanceState();
}

class _ChangeBalanceState extends State<ChangeBalance> {
  double balance = 0.0;
  TextEditingController dateInput = TextEditingController();
  TextEditingController descriptionInput = TextEditingController();
  TextEditingController balanceInput = TextEditingController();

  final String prefixCurrency =
      SharedPreferences.getCurrencyShort(SharedPreferences.CURRENCY);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void callback(int categoryId) {
      BalanceDto balanceDto = BalanceDto(
          description: descriptionInput.text,
          categoryId: categoryId,
          balanceFlow: widget.isIncome ? 'INCOME' : 'EXPENSES',
          balance: double.parse(balanceInput.text),
          date: DateTime.parse(dateInput.text));

      BalanceRestService.addBalance(context, balanceDto);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.07),
        child: BackBarNavigation(
          label: widget.isIncome ? 'INCOME'.i18n : 'EXPENSES'.i18n,
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
                    cursorColor: PRIMARY_COLOR,
                    textAlign: TextAlign.center,
                    onChanged: (value) => balance = double.parse(value),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
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
                                text: BalanceSummary.currentBalance.toString(),
                                style: const TextStyle(
                                    color: PRIMARY_COLOR, fontSize: 16)),
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
                                text: widget.isIncome
                                    ? IncomeUtil.addIncome(balance,
                                            BalanceSummary.currentBalance)
                                        .toString()
                                    : IncomeUtil.addExpenses(
                                        balance, BalanceSummary.currentBalance),
                                style: const TextStyle(
                                    color: PRIMARY_COLOR, fontSize: 16)),
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
              callback: callback,
              dateInput: dateInput,
              descriptionInput: descriptionInput,
            ),
          ),
        ],
      ),
    );
  }
}
