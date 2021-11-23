import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/components/rounded_button.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/screens/balance/balance_screen.dart';

import '../main.dart';
import 'app_icons.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NavigationState();
  }
}

class NavigationState extends State<Navigation> {
  bool clickedCentreFAB = false;
  int selectedIndex = 0;

  void updateTabSelection(int index, Widget widget) {
    setState(() {
      selectedIndex = index;
      NavigationUtil.pushToNavigator(context, widget);
    });
  }

  Color getShade(int index) {
    return selectedIndex == index ? PRIMARY_COLOR : ICON_UNUSED_COLOR;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Spacer(),
                    const Spacer(),
                    Expanded(
                      child: FloatingActionButton(
                        child: const Icon(AppIcons.income),
                        onPressed: () => null, //todo
                        backgroundColor: PRIMARY_COLOR,
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: FloatingActionButton(
                        child: const Icon(AppIcons.expense),
                        onPressed: () => null, //todo
                        backgroundColor: PRIMARY_COLOR,
                      ),
                    ),
                    const Spacer(),
                    const Spacer(),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(clickedCentreFAB ? 0.0 : 300.0),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[PRIMARY_COLOR, SECONDARY_COLOR],
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
      bottomNavigationBar: BottomAppBar(
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
                  updateTabSelection(1, const Balance());
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
                  updateTabSelection(2, const Balance());
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.pie_chart,
                  color: getShade(2),
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(3, const Home());
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.person,
                  color: getShade(3),
                ),
              ),
            ],
          ),
        ),
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
      ),
    );
  }
}

class NavigationUtil {
  static void pushToNavigator(BuildContext? context, Widget widget) {
    Navigator.push(
      context!,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }
}
