import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/bottom_dialog.dart';
import 'package:mobile/model/balance/category.dart';
import 'package:mobile/screens/transaction/components/amount_bottom_filter.dart';
import 'package:mobile/screens/transaction/components/date_bottom_filter.dart';
import 'package:mobile/util/localization.dart';

import 'category_bottom_filter.dart';

class TransactionsFilters extends StatefulWidget {
  List<Category> selectedCategories = [];
  double maxAmount = 0.0;
  double minAmount = 0.0;
  DateTime? start = null;
  DateTime? end = null;

  TransactionsFilters({Key? key}) : super(key: key);

  void categoriesFilter(List<Category> selectedCategories) {
    selectedCategories = selectedCategories;
  }

  void amountFilter(double minAmount, double maxAmount) {
    minAmount = minAmount;
    maxAmount = maxAmount;
  }

  void dateFilter(var start, var end) {
    if(start != null) {
      this.start = start;
    }

    if(end != null) {
      this.end = end;
    }
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
                      categoriesFilterCallback: widget.categoriesFilter),
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
              ),
              context).showBottomDialog(),
          avatar: const Icon(
            Icons.calendar_today,
            size: 18,
          ),
          label: Text('DATE'.i18n),
        ),
        ActionChip(
          onPressed: () => BottomDialog(
                  AmountBottomFilter(amountFilterCallback: widget.amountFilter),
                  context)
              .showBottomDialog(),
          avatar: const Icon(
            Icons.attach_money,
            size: 18,
          ),
          label: Text('AMOUNT'.i18n),
        ),
        ActionChip(
          onPressed: () => null,
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
