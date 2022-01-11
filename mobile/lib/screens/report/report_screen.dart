import 'package:flutter/material.dart';
import 'package:mobile/components/baseappbar_navigation.dart';
import 'package:mobile/components/navigation.dart';
import 'package:mobile/components/select_menu_appbar.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/model/shared/select_menu_model.dart';
import 'package:mobile/screens/balance/components/balance_actions.dart';
import 'package:mobile/screens/balance/components/balance_summary.dart';
import 'package:mobile/screens/report/components/category_report.dart';
import 'package:mobile/screens/report/components/month_report.dart';
import 'package:mobile/screens/report/components/year_report.dart';
import 'package:mobile/util/localization.dart';

class ReportScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ReportScreenState();

  void moveToSelectedPage(SelectMenuModel model) {}
}

class _ReportScreenState extends State<ReportScreen> {
  bool clickedCentreFAB = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: BaseAppBar(
        title: Text(
          'REPORTS'.i18n,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        appBar: AppBar(),
        backgroundColor: Colors.white,
        widgets: [],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Navigation(selectedIndex: 2),
      body: Stack(
        children: <Widget>[
          PageView(
            children: const [
              CategoryReport(),
              // MonthReport(),
              YearReport(),
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
