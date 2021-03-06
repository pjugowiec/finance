import 'package:flutter/material.dart';
import 'package:mobile/components/app_icons.dart';
import 'package:mobile/components/navigation.dart';
import 'package:mobile/screens/adding/change_balance.dart';

import '../../../constants.dart';

class BalanceActions extends StatelessWidget {
  const BalanceActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Spacer(),
        const Spacer(),
        Expanded(
          child: FloatingActionButton(
            heroTag: "income",
            child: const Icon(AppIcons.income),
            onPressed: () => NavigationUtil.pushToNavigator(
                context, const ChangeBalance(isIncome: true)),
            backgroundColor: PRIMARY_COLOR,
          ),
        ),
        const Spacer(),
        Expanded(
          child: FloatingActionButton(
            heroTag: "expense",
            child: const Icon(AppIcons.expense),
            onPressed: () => NavigationUtil.pushToNavigator(
                context, const ChangeBalance(isIncome: false)),
            backgroundColor: PRIMARY_COLOR,
          ),
        ),
        const Spacer(),
        const Spacer(),
      ],
    );
  }
}
