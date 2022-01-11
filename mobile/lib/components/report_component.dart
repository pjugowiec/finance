import 'package:flutter/cupertino.dart';

class ReportComponent extends StatelessWidget {
  final Widget widget;
  final String description;

  const ReportComponent(
      {Key? key,
      required this.widget,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(description,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const Spacer(),
        widget,
        const Spacer(),
        const Spacer(),
      ],
    );
  }
}
