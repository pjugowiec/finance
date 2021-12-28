import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/baseappbar_navigation.dart';
import 'package:mobile/components/navigation.dart';
import 'package:mobile/screens/balance/components/balance_date_chip.dart';
import 'package:mobile/util/localization.dart';
import '../../constants.dart';
import 'components/balance_actions.dart';
import 'components/balance_recent_transactions.dart';
import 'components/balance_summary.dart';

class Balance extends StatefulWidget {
  static DateTime CURRENT_DATE_SELECTED = DateTime.now();

  const Balance({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BalanceState();
  }
}

class BalanceState extends State<Balance> {
  bool clickedCentreFAB = false;
  var transactionPage = BalanceRecentTransactions(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var currentDate = DateTime.now();

    void callback(var page) {
      setState(() {
        transactionPage = page;
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Navigation(selectedIndex: 0),
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              const BalanceSummary(),
              Expanded(
                flex: 9,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ChipsFilter(
                        callback: callback,
                        selected: 0,
                        filters: [
                          Filter(label: 'TODAY'.i18n, date: currentDate),
                          Filter(
                              label: 'WEEK'.i18n,
                              date: currentDate
                                  .subtract(const Duration(days: 7))),
                          Filter(
                              label: 'MONTH'.i18n,
                              date: DateTime(currentDate.year,
                                  currentDate.month - 1, currentDate.day)),
                          Filter(
                              label: 'YEAR'.i18n,
                              date: DateTime(currentDate.year - 1,
                                  currentDate.month, currentDate.day)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 14,
                      child: transactionPage,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: clickedCentreFAB ? size.height : 10.0,
              width: clickedCentreFAB ? size.height : 10.0,
              child: Container(
                margin: const EdgeInsets.only(bottom: 30.0),
                child: const BalanceActions(),
              ),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(clickedCentreFAB ? 0.0 : 300.0),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    PRIMARY_COLOR.withOpacity(0.5),
                    SECONDARY_COLOR.withOpacity(0.5)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            clickedCentreFAB = !clickedCentreFAB;
          });
        },
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: clickedCentreFAB
              ? const Icon(Icons.close)
              : const Icon(Icons.add),
        ),
        elevation: 4.0,
        backgroundColor: PRIMARY_COLOR,
      ),
    );
  }
}
