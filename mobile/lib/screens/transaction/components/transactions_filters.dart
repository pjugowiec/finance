import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/bottom_dialog.dart';
import 'package:mobile/model/transactions/transactions_request.dart';
import 'package:mobile/screens/transaction/components/amount_bottom_filter.dart';
import 'package:mobile/screens/transaction/components/date_bottom_filter.dart';
import 'package:mobile/screens/transaction/components/sort_bottom.dart';
import 'package:mobile/util/localization.dart';
import 'package:mobile/util/sort_util.dart';

import 'category_bottom_filter.dart';

class TransactionsFilters extends StatefulWidget {
  final Function requestCallback;
  final TransactionsRequest request;

  TransactionsFilters(
      {Key? key, required this.requestCallback, required this.request})
      : super(key: key);

  void categoriesFilter(List<int> selectedCategories) {
    requestCallback(null, null, selectedCategories, null, null, null);
  }

  void amountFilter(double minAmount, double maxAmount) {
    requestCallback(minAmount, maxAmount, null, null, null, null);
  }

  void dateFilter(var start, var end) {
    DateTime? startDate;
    if (start != null) {
      startDate = start;
    }
    DateTime? endDate;
    if (end != null) {
      endDate = end;
    }
    requestCallback(null, null, null, startDate, endDate, null);
  }

  void sortCallback(String field, String direction) {
    requestCallback(null, null, null, null, null,
        SortUtil.parseSort(field, direction).toLowerCase());
  }

  @override
  State<StatefulWidget> createState() => _TransactionsFilterState();
}

class _TransactionsFilterState extends State<TransactionsFilters> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ActionChip(
          onPressed: () => BottomDialog(
                  CategoryBottomFilter(
                    categoriesFilterCallback: widget.categoriesFilter,
                    categoryIds: widget.request.categories,
                  ),
                  context)
              .showBottomDialog(),
          avatar: const Icon(
            Icons.category,
            size: 18,
          ),
          label: Text('CATEGORY'.i18n),
        ),
        ActionChip(
          onPressed: () => BottomDialog(
                  DateBottomFilter(
                    dateFilterCallback: widget.dateFilter,
                    endDate: widget.request.dateTo,
                    startDate: widget.request.dateFrom,
                  ),
                  context)
              .showBottomDialog(),
          avatar: const Icon(
            Icons.calendar_today,
            size: 18,
          ),
          label: Text('DATE'.i18n),
        ),
        ActionChip(
          onPressed: () => BottomDialog(
                  AmountBottomFilter(
                    amountFilterCallback: widget.amountFilter,
                    minAmount: widget.request.minAmount,
                    maxAmount: widget.request.maxAmount,
                  ),
                  context)
              .showBottomDialog(),
          avatar: const Icon(
            Icons.attach_money,
            size: 18,
          ),
          label: Text('AMOUNT'.i18n),
        ),
        ActionChip(
          onPressed: () => BottomDialog(
                  SortBottom(
                    sortCallback: widget.sortCallback,
                  ),
                  context)
              .showBottomDialog(),
          avatar: const Icon(
            Icons.sort,
            size: 18,
          ),
          label: Text('SORT'.i18n),
        ),
      ],
    );
  }
}
