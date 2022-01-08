import 'package:flutter/material.dart';
import 'package:mobile/model/balance/transaction_short.dart';
import 'package:mobile/model/transactions/transactions_request.dart';
import 'package:mobile/screens/balance/balance_screen.dart';
import 'package:mobile/services/balance/transactions_rest_service.dart';
import 'package:mobile/services/balance/transactions_service.dart';
import 'package:mobile/util/date_util.dart';
import 'package:mobile/util/shared_preferences.dart';
import 'package:mobile/util/sort_util.dart';

class TransactionListView extends StatefulWidget {
  final int count;
  final double maxAmount;
  final double minAmount;
  final List<int> categories;
  final DateTime dateFrom;
  final DateTime dateTo;
  final String sort;
  late TransactionsRequest request;

  TransactionListView(
      {Key? key,
      required this.count,
      required this.maxAmount,
      required this.minAmount,
      required this.categories,
      required this.dateFrom,
      required this.dateTo,
      required this.sort})
      : super(key: key) {
      request = TransactionsRequest(
          minAmount: minAmount,
          maxAmount: maxAmount,
          categories: categories,
          dateFrom: dateFrom,
          dateTo: dateTo,
          sort: sort,
          count: count);
  }


  @override
  State<StatefulWidget> createState() => TransactionListViewState();
}

class TransactionListViewState extends State<TransactionListView> {
  late Future<List<TransactionShort>> transactionsShort =
      TransactionsRestService().getTransactions(
          widget.request,
          context);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TransactionShort>>(
      future: transactionsShort,
      builder: (context, transactions) {
        if (transactions.hasData) {
          return ListView.separated(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
              separatorBuilder: (context, index) {
                return const Divider();
              },
              shrinkWrap: true,
              itemCount: transactions.data!.length,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) =>
                  TransactionView(transaction: transactions.data![index]));
        } else if (transactions.hasError) {
          return Container();
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class TransactionView extends StatelessWidget {
  final TransactionShort transaction;

  const TransactionView({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.only(right: 10.0, left: 10.0),
            alignment: Alignment.centerLeft,
            child: Icon(TransactionService.getIconByType(transaction.type)),
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            margin: const EdgeInsets.only(left: 5.0),
            alignment: Alignment.centerLeft,
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                children: [
                  TextSpan(
                      text: transaction.category,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 14)),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  TextSpan(
                      text: transaction.description,
                      // data from server
                      style:
                          const TextStyle(color: Colors.black, fontSize: 10)),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            alignment: Alignment.center,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                      text: SharedPreferences.getCurrencyShort(
                              SharedPreferences.CURRENCY) +
                          transaction.balance.toString(),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 16)),
                  const TextSpan(text: '\n'),
                  const TextSpan(text: '\n'),
                  TextSpan(
                      text: DateUtil.getTimeFromDateToNow(
                          transaction.transactionDate),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 12)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
