import 'package:flutter/material.dart';
import 'package:mobile/model/shared/select_menu_model.dart';
import 'package:mobile/util/localization.dart';

class SelectMenuAppBar extends StatelessWidget {
  final List<SelectMenuModel> elements;
  final Function callback;

  const SelectMenuAppBar(
      {Key? key, required this.elements, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          alignment: AlignmentDirectional.centerEnd,
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          // iconSize: 20,
          onChanged: (SelectMenuModel? newValue) => callback(newValue),
          items: elements
              .map<DropdownMenuItem<SelectMenuModel>>((SelectMenuModel model) {
            return DropdownMenuItem(
              value: model,
              child: Text(model.value.i18n),
            );
          }).toList(),
        ),
    );
  }
}
