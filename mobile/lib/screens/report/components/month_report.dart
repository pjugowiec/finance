import 'package:flutter/material.dart';

class MonthReport extends StatefulWidget {
  const MonthReport({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MonthReportState();
}

class _MonthReportState extends State<MonthReport> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(color: Colors.blue),
    );
  }
}
