import 'package:flutter/material.dart';

import '../../../constants.dart';

class Filter {
  final String label;

  const Filter({required this.label});
}

class ChipsFilter extends StatefulWidget {
  final List<Filter> filters;

  final int selected;

  const ChipsFilter({Key? key, required this.filters, required this.selected})
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
      // padding: const EdgeInsets.all(2.0),
    );
  }

  Widget chipBuilder(context, currentIndex) {
    Filter filter = widget.filters[currentIndex];
    bool isActive = selectedIndex == currentIndex;

    return Container(
      margin: const EdgeInsets.only(left: 10.0,),
      child: ChoiceChip(
        label: Text(filter.label),
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        labelStyle: TextStyle(
            color: isActive ? Colors.white : Colors.black, fontSize: 13),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        selected: isActive,
        onSelected: (bool selected) => setState(() {
          selectedIndex = currentIndex;
        }),
        disabledColor: Colors.red,
        selectedColor: PRIMARY_COLOR,
      ),
    );
  }
}
