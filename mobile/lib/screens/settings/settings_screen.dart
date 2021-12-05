import 'package:flutter/material.dart';
import 'package:mobile/components/navigation.dart';
import 'package:mobile/screens/balance/components/balance_actions.dart';

import '../../constants.dart';
import 'components/settings_sections.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  bool clickedCentreFAB = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Navigation(selectedIndex: 3),
      body: Stack(
        children: <Widget>[
          const SettingsSections(),
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
