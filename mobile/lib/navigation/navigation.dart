import 'package:flutter/material.dart';

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
  String text = "Home";

  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText;
    });
  }

  Color getShade(int index) {
    return selectedIndex == index ? Colors.blue.shade900 : Colors.grey.shade400;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              //if clickedCentreFAB == true, the first parameter is used. If it's false, the second.
              height:
              clickedCentreFAB ? MediaQuery.of(context).size.height : 10.0,
              width: clickedCentreFAB ? MediaQuery.of(context).size.height : 10.0,
              decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(clickedCentreFAB ? 0.0 : 300.0),
                  color: Colors.grey.shade300),
            ),
          )
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
          child: const Icon(Icons.add),
        ),
        elevation: 4.0,
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
                  updateTabSelection(0, "Home");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.home,
                  color: getShade(0),
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(1, "Outgoing");
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
                  updateTabSelection(2, "Incoming");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.pie_chart,
                  color: getShade(2),
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(3, "Settings");
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