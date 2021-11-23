import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/navigation.dart';

class Balance extends StatefulWidget {
  const Balance({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BalanceState();
  }
}

class _BalanceState extends State<Balance> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(

      bottomNavigationBar: const Navigation(),
      body: Text('TEST'),
    );
  }
}
