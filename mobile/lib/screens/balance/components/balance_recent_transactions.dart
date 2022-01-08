import 'package:flutter/material.dart';
import 'package:mobile/components/navigation.dart';
import 'package:mobile/components/transactions_list.dart';
import 'package:mobile/screens/transaction/transations_screen.dart';
import 'package:mobile/util/localization.dart';
import 'package:mobile/util/sort_util.dart';

import '../balance_screen.dart';

class BalanceRecentTransactions extends StatefulWidget {
  const BalanceRecentTransactions({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BalanceRecentTransactionsState();
  }
}

class BalanceRecentTransactionsState extends State<BalanceRecentTransactions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BalanceRecentTransactionsText(),
        const Divider(),
        Expanded(
          flex: 9,
          child: TransactionListView(
              dateFrom: Balance.CURRENT_DATE_SELECTED,
              dateTo: DateTime.now(),
              sort: SortUtil.DEFAULT_SORT,
              categories: [],
              maxAmount: 200000.0,
              minAmount: 0.0,
              count: 5),
        ),
      ],
    );
  }
}

class BalanceRecentTransactionsText extends StatelessWidget {
  const BalanceRecentTransactionsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Expanded(
        flex: 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                'RECENT_TRANSACTION'.i18n,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 35),
              child: TextButton(
                onPressed: () => NavigationUtil.pushToNavigator(
                    context, TransactionScreen()),
                child: Text('SEE_ALL'.i18n),
                style: TextButton.styleFrom(
                    primary: Colors.black,
                    textStyle: const TextStyle(fontSize: 14)),
              ),
            ),
          ],
        ),
      );
}
