import 'package:flutter/material.dart';
import 'package:mobile/components/baseappbar_navigation.dart';
import 'package:mobile/components/bottom_dialog.dart';
import 'package:mobile/components/navigation.dart';
import 'package:mobile/model/balance/category.dart';
import 'package:mobile/screens/balance/components/balance_actions.dart';
import 'package:mobile/util/localization.dart';

import '../../constants.dart';
import 'components/category_bottom_filter.dart';

class TransactionScreen extends StatefulWidget {
  List<Category> selectedCategories = [];

  TransactionScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  bool clickedCentreFAB = false;

  void categoriesFilter(List<Category> selectedCategories) {
    widget.selectedCategories = selectedCategories;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: BaseAppBar(
        title: Text(
          'RECENT_TRANSACTION'.i18n,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        appBar: AppBar(),
        backgroundColor: Colors.white,
        widgets: const [],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Navigation(selectedIndex: 1),
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ActionChip(
                    onPressed: () => BottomDialog(
                            CategoryBottomFilter(callback: categoriesFilter),
                            context)
                        .showBottomDialog(),
                    avatar: const Icon(
                      Icons.category,
                      size: 20,
                    ),
                    label: Text('CATEGORY'.i18n),
                  ),
                  ActionChip(
                    onPressed: () => null,
                    avatar: const Icon(
                      Icons.create,
                      size: 20,
                    ),
                    label: Text('AMOUNT'.i18n),
                  ),
                  ActionChip(
                    onPressed: () => null,
                    avatar: const Icon(
                      Icons.calendar_today,
                      size: 20,
                    ),
                    label: Text('DATE'.i18n),
                  ),
                  ActionChip(
                    onPressed: () => null,
                    avatar: const Icon(
                      Icons.sort,
                      size: 20,
                    ),
                    label: Text('SORT'.i18n),
                  ),
                ],
              ),
              Expanded(
                flex: 10,
                child: Container(color: Colors.red),
              ),
            ],
          ),
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
