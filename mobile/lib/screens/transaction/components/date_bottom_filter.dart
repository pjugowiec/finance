import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/components/date_select.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/util/date_util.dart';
import 'package:mobile/util/localization.dart';

class DateBottomFilter extends StatefulWidget {
  final Function dateFilterCallback;
  final DateTime startDate;
  final DateTime endDate;

  DateBottomFilter(
      {Key? key,
      required this.dateFilterCallback,
      required this.startDate,
      required this.endDate})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _DateBottomFilterState();
}

class _DateBottomFilterState extends State<DateBottomFilter> {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  @override
  void initState() {
    if (DateUtil.OLD_DATE != widget.startDate) {
      startDateController.text =
          DateFormat('yyyy-MM-dd').format(widget.startDate);
    }

    if (DateUtil.OLD_DATE != widget.endDate)  {
      endDateController.text = DateFormat('yyyy-MM-dd').format(widget.endDate);
    }
  }

  @override
  void deactivate() {
    DateTime? startDate = startDateController.text.isNotEmpty
        ? DateTime.parse(startDateController.text)
        : null;

    DateTime? endDate = endDateController.text.isNotEmpty
        ? DateTime.parse(startDateController.text)
        : null;
    widget.dateFilterCallback(
      startDate,
      endDate,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      height: size.height * 0.2,
      width: size.width,
      child: Column(
        children: [
          DateSelect(
            iconColor: PRIMARY_COLOR,
            controller: startDateController,
            backgroundColor: SECONDARY_COLOR,
            hintText: "FROM".i18n,
          ),
          DateSelect(
            iconColor: PRIMARY_COLOR,
            controller: endDateController,
            backgroundColor: SECONDARY_COLOR,
            hintText: "TO".i18n,
          ),
        ],
      ),
    );
  }
}
