import 'package:flutter/material.dart';
import 'package:mobile/components/app_icons.dart';
import 'package:mobile/components/loader_round.dart';
import 'package:mobile/model/balance/balance_summary.dart';
import 'package:mobile/services/balance/balance_rest_service.dart';
import 'package:mobile/util/localization.dart';

import '../../../constants.dart';

class BalanceSummary extends StatefulWidget {
  const BalanceSummary({Key? key}) : super(key: key);

  static double currentBalance = 0.0;

  @override
  State<StatefulWidget> createState() {
    return _BalanceSummaryState();
  }
}

class _BalanceSummaryState extends State<BalanceSummary> {
  late Future<BalanceSummaryModel> summary;

  @override
  void initState() {
    summary =
        BalanceRestService.getSummary(context);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              PRIMARY_COLOR.withOpacity(0.5),
              SECONDARY_COLOR.withOpacity(0.5)
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: FutureBuilder<BalanceSummaryModel>(
                future: summary,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ConditionBalance(
                        income: snapshot.data!.income,
                        expenses: snapshot.data!.expenses);
                  } else if (snapshot.hasError) {
                    return const ConditionBalance(income: 0, expenses: 0);
                  }
                  return const LoaderRound();
                },
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                alignment: Alignment.topCenter,
                child: FutureBuilder<BalanceSummaryModel>(
                  future: summary,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      BalanceSummary.currentBalance = snapshot.data!.balance;
                      return BalanceSummaryText(
                          balance: snapshot.data!.balance);
                    } else if (snapshot.hasError) {
                      return const LoaderRound();
                    }
                    return const LoaderRound();
                  },
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                // color: Colors.blue,
                // margin: const EdgeInsets.only(bottom: 70.0),
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: FutureBuilder<BalanceSummaryModel>(
                  future: summary,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return IncomeExpensesButtons(
                          expenses: snapshot.data!.expenses,
                          income: snapshot.data!.income);
                    } else if (snapshot.hasError) {
                      return const LoaderRound();
                    }
                    return const LoaderRound();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConditionBalance extends StatelessWidget {
  final double income;
  final double expenses;

  const ConditionBalance(
      {Key? key, required this.income, required this.expenses})
      : super(key: key);

  String checkConditionOfFinances() {
    if (expenses - income < 0) {
      return 'BALANCE_BAD_FINANCE'.i18n;
    } else {
      'BALANCE_GOOD_FINANCE'.i18n;
    }
    return 'BALANCE_BAD_FINANCE'.i18n;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(left: 10.0),
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'DASHBOARD'.i18n,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              // const TextSpan(text: '\n'),
              // TextSpan(
              //   text: checkConditionOfFinances(),
              //   style: const TextStyle(fontSize: 14, color: Colors.black),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class IncomeExpensesButtons extends StatelessWidget {
  final double income;
  final double expenses;

  const IncomeExpensesButtons(
      {Key? key, required this.income, required this.expenses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 80,
          width: 160,
          child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  AppIcons.income,
                  size: 40,
                ),
                // Spacer(),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'INCOME'.i18n),
                      const TextSpan(text: '\n'),
                      const TextSpan(text: '\n'),
                      TextSpan(
                          text: '$income', // data from server
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              primary: PRIMARY_COLOR,
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 80,
          width: 160,
          child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  AppIcons.expense,
                  size: 40,
                ),
                // Spacer(),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'EXPENSES'.i18n),
                      const TextSpan(text: '\n'),
                      const TextSpan(text: '\n'),
                      TextSpan(
                          text: '$expenses', // data from server
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              primary: PRIMARY_COLOR,
            ),
          ),
        ),
      ],
    );
  }
}

class BalanceSummaryText extends StatelessWidget {
  final double balance;

  const BalanceSummaryText({Key? key, required this.balance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          const TextSpan(text: '\n'),
          const TextSpan(text: '\n'),
          TextSpan(
            text: 'BALANCE'.i18n + ' - ' + 'Dollars',
            style: const TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400),
          ),
          const TextSpan(text: '\n'),
          const TextSpan(text: '\n'),
          TextSpan(
            text: "$balance",
            style: const TextStyle(
                fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
