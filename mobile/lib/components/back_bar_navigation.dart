import 'package:flutter/material.dart';

class BackBarNavigation extends StatelessWidget {
  final String label;

  const BackBarNavigation({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) => AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back),
        color: Colors.black,
      ),
      elevation: 1,
      title: Text(label,
          style: const TextStyle(color: Colors.black, fontSize: 20)));
}
