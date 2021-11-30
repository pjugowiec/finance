import 'package:flutter/material.dart';
import 'package:mobile/util/localization.dart';

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
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const BalanceRecentTransactionsText(),
        Expanded(
          flex: 9,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 20,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(child: Text('dwa'));
            },
          ),
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
              margin: const EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: () {},
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
