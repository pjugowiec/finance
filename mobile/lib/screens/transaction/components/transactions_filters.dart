import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/bottom_dialog.dart';
import 'package:mobile/model/balance/category.dart';
import 'package:mobile/screens/transaction/components/amount_bottom_filter.dart';
import 'package:mobile/util/localization.dart';

import 'category_bottom_filter.dart';

class TransactionsFilters extends StatefulWidget {
  List<Category> selectedCategories = [];
  double maxAmount = 0.0;
  double minAmount = 0.0;

  TransactionsFilters({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TransactionsFilterState();
}

class _TransactionsFilterState extends State<TransactionsFilters> {
  void categoriesFilter(List<Category> selectedCategories) {
    widget.selectedCategories = selectedCategories;
  }

  void amountFilter(double minAmount, double maxAmount) {
    widget.minAmount = minAmount;
    widget.maxAmount = maxAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ActionChip(
          onPressed: () => BottomDialog(
                  CategoryBottomFilter(callback: categoriesFilter), context)
              .showBottomDialog(),
          avatar: const Icon(
            Icons.category,
            size: 18,
          ),
          label: Text('CATEGORY'.i18n),
        ),
        ActionChip(
          onPressed: () => BottomDialog(
                  AmountBottomFilter(callback: amountFilter), context)
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
            Icons.calendar_today,
            size: 18,
          ),
          label: Text('DATE'.i18n),
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
