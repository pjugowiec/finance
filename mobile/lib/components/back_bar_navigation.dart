import 'package:flutter/material.dart';

class BackBarNavigation extends StatelessWidget {
  final String label;
  final Color background;
  final Color textColor;
  final Color iconColor;

  const BackBarNavigation(
      {Key? key,
      required this.label,
      required this.background,
      required this.textColor,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) => AppBar(
      backgroundColor: background,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back),
        color: iconColor,
      ),
      elevation: 1,
      title: Text(label,
          style: TextStyle(color: textColor, fontSize: 20)));
}
