import 'package:flutter/material.dart';
import 'package:mobile/components/baseappbar_navigation.dart';
import 'package:mobile/components/navigation.dart';
import 'package:mobile/components/transactions_list.dart';
import 'package:mobile/model/transactions/transactions_request.dart';
import 'package:mobile/screens/balance/components/balance_actions.dart';
import 'package:mobile/util/date_util.dart';
import 'package:mobile/util/income_util.dart';
import 'package:mobile/util/localization.dart';
import 'package:mobile/util/sort_util.dart';

import '../../constants.dart';
import 'components/transactions_filters.dart';

class TransactionScreen extends StatefulWidget {
  double minAmount = 0.0;
  double maxAmount = IncomeUtil.MAX_VALUE;
  List<int> categories = [];
  DateTime dateFrom = DateUtil.OLD_DATE;
  DateTime dateTo = DateUtil.OLD_DATE;
  String sort = SortUtil.DEFAULT_SORT;
  int count = 20;

  TransactionScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  bool clickedCentreFAB = false;

  void requestCallback(
      double? minAmount,
      double? maxAmount,
      List<int>? categories,
      DateTime? dateFrom,
      DateTime? dateTo,
      String? sort) {
    setState(() {
      if (minAmount != null) {
        widget.minAmount = minAmount;
      }

      if (maxAmount != null) {
        widget.maxAmount = maxAmount;
      }

      if (categories != null) {
        widget.categories = categories;
      }

      if (dateFrom != null) {
        widget.dateFrom = dateFrom;
      }

      if (dateTo != null) {
        widget.dateTo = dateTo;
      }

      if (sort != null) {
        widget.sort = sort;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: BaseAppBar(
        title: Text(
          'TRANSACTIONS'.i18n,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        appBar: AppBar(),
        backgroundColor: Colors.white,
        widgets: const [],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Navigation(selectedIndex: 1),
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              TransactionsFilters(
                requestCallback: requestCallback,
                request: TransactionsRequest(
                    minAmount: widget.minAmount,
                    maxAmount: widget.maxAmount,
                    categories: widget.categories,
                    dateFrom: widget.dateFrom,
                    dateTo: widget.dateTo,
                    sort: widget.sort,
                    count: widget.count),
              ),
              Expanded(
                flex: 10,
                child: TransactionListView(
                    categories: widget.categories,
                    dateFrom: widget.dateFrom,
                    dateTo: widget.dateTo,
                    minAmount: widget.minAmount,
                    maxAmount: widget.maxAmount,
                    sort: widget.sort,
                    count: 20),
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
