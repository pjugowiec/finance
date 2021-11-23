import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/navigation.dart';

import '../../constants.dart';
import 'components/balance_actions.dart';

class Balance extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return BalanceState();
  }
}

class BalanceState extends State<Balance> {
  bool clickedCentreFAB = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const Navigation(),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: clickedCentreFAB ? size.height : 10.0,
              width: clickedCentreFAB ? size.height : 10.0,
              child: Container(
                margin: const EdgeInsets.only(bottom: 30.0),
                child: const BalanceActions(),
              ),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(clickedCentreFAB ? 0.0 : 300.0),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    PRIMARY_COLOR.withOpacity(0.5),
                    SECONDARY_COLOR.withOpacity(0.5)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            clickedCentreFAB = !clickedCentreFAB;
          });
        },
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: clickedCentreFAB
              ? const Icon(Icons.close)
              : const Icon(Icons.add),
        ),
        elevation: 4.0,
        backgroundColor: PRIMARY_COLOR,
      ),
    );
  }
}
