import 'package:flutter/material.dart';
import 'package:mobile/screens/balance/components/balance_summary.dart';
import 'package:mobile/util/localization.dart';
import 'package:mobile/util/shared_preferences.dart';

import '../../../constants.dart';

class BalanceChangeLine extends StatelessWidget {
  final Function calculateDifferent;
  final String prefixCurrency =
      SharedPreferences.getCurrencyShort(SharedPreferences.CURRENCY);

  BalanceChangeLine({Key? key, required this.calculateDifferent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                    style: const TextStyle(color: Colors.grey, fontSize: 14)),
                const TextSpan(text: '\n'),
                const TextSpan(text: '\n'),
                TextSpan(
                    text: prefixCurrency +
                        BalanceSummary.currentBalance.toString(),
                    style: const TextStyle(color: PRIMARY_COLOR, fontSize: 16)),
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
                    style: const TextStyle(color: Colors.grey, fontSize: 14)),
                const TextSpan(text: '\n'),
                const TextSpan(text: '\n'),
                TextSpan(
                    text: prefixCurrency +
                        calculateDifferent
                            .call(1000.0, BalanceSummary.currentBalance)
                            .toString(),
                    style: const TextStyle(color: PRIMARY_COLOR, fontSize: 16)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
