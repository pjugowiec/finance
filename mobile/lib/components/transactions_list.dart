import 'package:flutter/material.dart';
import 'package:mobile/model/balance/transaction_short.dart';
import 'package:mobile/screens/balance/balance_screen.dart';
import 'package:mobile/services/balance/transactions_rest_service.dart';
import 'package:mobile/services/balance/transactions_service.dart';
import 'package:mobile/util/date_util.dart';
import 'package:mobile/util/shared_preferences.dart';

class TransactionListView extends StatefulWidget {
  final int count;

  const TransactionListView({Key? key, required this.count}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TransactionListViewState();
}

class TransactionListViewState extends State<TransactionListView> {
  late Future<List<TransactionShort>> transactionsShort =
      TransactionsRestService().getTransactions(
          context, widget.count, Balance.CURRENT_DATE_SELECTED, DateTime.now());

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
            // margin: const EdgeInsets.only(right: 0.0),
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
                      text: DateUtil.getTimeFromDateToNow(transaction.created),
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