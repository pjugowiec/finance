import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/screens/balance/balance_screen.dart';
import 'package:mobile/screens/report/report_screen.dart';
import 'package:mobile/screens/settings/settings_screen.dart';
import 'package:mobile/screens/transaction/transations_screen.dart';

class Navigation extends StatefulWidget {
  int selectedIndex = 0;

  Navigation({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NavigationState();
  }
}

class NavigationState extends State<Navigation> {
  bool clickedCentreFAB = false;

  void setSelectedIndex(int selectedIndex) {
    widget.selectedIndex = selectedIndex;
  }

  void updateTabSelection(int index, Widget widget) {
    setState(() {
      setSelectedIndex(index);
      NavigationUtil.pushToNavigator(context, widget);
    });
  }

  Color getShade(int index) {
    return widget.selectedIndex == index ? PRIMARY_COLOR : ICON_UNUSED_COLOR;
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        margin: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {
                updateTabSelection(0, const Balance());
              },
              iconSize: 27.0,
              icon: Icon(
                Icons.home,
                color: getShade(0),
              ),
            ),
            IconButton(
              onPressed: () {
                updateTabSelection(1, const TransactionScreen());
              },
              iconSize: 27.0,
              icon: Icon(
                Icons.compare_arrows,
                color: getShade(1),
              ),
            ),
            const SizedBox(
              width: 40.0, // Space between central button and left/right icon
            ),
            IconButton(
              onPressed: () {
                updateTabSelection(2, ReportScreen());
              },
              iconSize: 27.0,
              icon: Icon(
                Icons.pie_chart,
                color: getShade(2),
              ),
            ),
            IconButton(
              onPressed: () {
                updateTabSelection(3, const SettingsScreen());
              },
              iconSize: 27.0,
              icon: Icon(
                Icons.settings,
                color: getShade(3),
              ),
            ),
          ],
        ),
      ),
      shape: const CircularNotchedRectangle(),
      color: Colors.white,
    );
  }
}

class NavigationUtil {
  static void pushToNavigator(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }
}
