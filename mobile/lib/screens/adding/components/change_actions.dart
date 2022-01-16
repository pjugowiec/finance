import 'package:flutter/material.dart';
import 'package:mobile/components/date_select.dart';
import 'package:mobile/components/loader_round.dart';
import 'package:mobile/components/rounded_button.dart';
import 'package:mobile/components/rounded_input.dart';
import 'package:mobile/model/balance/category.dart';
import 'package:mobile/services/balance/category_rest_service.dart';
import 'package:mobile/util/localization.dart';

import '../../../constants.dart';

class ChangeActions extends StatefulWidget {
  final TextEditingController dateInput;
  final TextEditingController descriptionInput;
  int chosedCategory = 0;
  final Function callback;

  ChangeActions(
      {Key? key,
      required this.dateInput,
      required this.descriptionInput,
      required this.callback})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChangeActionsState();
}

class _ChangeActionsState extends State<ChangeActions> {
  late Future<List<Category>> categories =
      CategoryRestService.getCategories(context);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    void callback(var value) {
      widget.chosedCategory = int.parse(value);
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
          width: size.width * 0.9,
          child: DateSelect(
            iconColor: PRIMARY_COLOR,
            backgroundColor: SECONDARY_COLOR,
            controller: widget.dateInput,
            hintText: 'WHEN'.i18n,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          width: size.width * 0.9,
          child: RoundedInputField(
            validatorRequired: false,
            hintText: 'DESCRIPTION'.i18n,
            onChanged: (value) => {},
            controller: widget.descriptionInput,
            icon: Icons.description,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: size.width * 0.9,
            decoration: BoxDecoration(
              color: SECONDARY_COLOR,
              borderRadius: BorderRadius.circular(29),
            ),
            child: FutureBuilder<List<Category>>(
                future: categories,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return CategoryListDropDown(
                      callback: callback,
                      categories: snapshot.data!,
                    );
                  } else if (snapshot.hasError) {
                    return CategoryListDropDown(
                      callback: callback,
                      categories: const [],
                    );
                  }
                  return const LoaderRound();
                }),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          width: size.width * 0.9,
          child: RoundedButton(
            textColor: Colors.white,
            color: PRIMARY_COLOR,
            text: 'SAVE'.i18n,
            press: () {
              widget.callback(widget.chosedCategory);
            },
          ),
        ),
      ],
    );
  }
}

class CategoryListDropDown extends StatelessWidget {
  final Function callback;
  final List<Category> categories;

  const CategoryListDropDown(
      {Key? key, required this.callback, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'FILL_THIS_FIELD'.i18n;
        }
        return null;
      },
      dropdownColor: SECONDARY_COLOR,
      hint: Text('CHOOSE_CATEGORY'.i18n),
      iconSize: 24,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.category, color: PRIMARY_COLOR),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),
      style: const TextStyle(color: Colors.black),
      onChanged: (String? newValue) => callback(newValue),
      items: categories.map<DropdownMenuItem<String>>((Category category) {
        return DropdownMenuItem<String>(
          value: category.id.toString(),
          child: Text(category.value),
        );
      }).toList(),
    );
  }
}
