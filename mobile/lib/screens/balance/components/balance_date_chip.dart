import 'package:flutter/material.dart';
import 'package:mobile/screens/balance/balance_screen.dart';

import '../../../constants.dart';
import 'balance_recent_transactions.dart';

class Filter {
  final String label;
  final DateTime date;

  const Filter({required this.label, required this.date});
}

class ChipsFilter extends StatefulWidget {
  final List<Filter> filters;
  final Function callback;
  final int selected;

  const ChipsFilter(
      {Key? key,
      required this.filters,
      required this.selected,
      required this.callback})
      : super(key: key);

  @override
  _ChipsFilterState createState() => _ChipsFilterState();
}

class _ChipsFilterState extends State<ChipsFilter> {
  late int selectedIndex;

  @override
  void initState() {
    if (widget.selected >= 0 && widget.selected < widget.filters.length) {
      selectedIndex = widget.selected;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: chipBuilder,
      itemCount: widget.filters.length,
      scrollDirection: Axis.horizontal,
    );
  }

  Widget chipBuilder(context, currentIndex) {
    Filter filter = widget.filters[currentIndex];
    bool isActive = selectedIndex == currentIndex;

    return Container(
      margin: const EdgeInsets.only(
        left: 10.0,
      ),
      child: ChoiceChip(
        label: Text(filter.label),
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        labelStyle: TextStyle(
            color: isActive ? Colors.black : Colors.grey, fontSize: 13),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        selected: isActive,
        onSelected: (bool selected) => setState(() {
          Balance.CURRENT_DATE_SELECTED = filter.date;
          selectedIndex = currentIndex;
          widget.callback(BalanceRecentTransactions(key: UniqueKey()));
        }),
        selectedColor: SECONDARY_COLOR,
        backgroundColor: Colors.white,
      ),
    );
  }
}
