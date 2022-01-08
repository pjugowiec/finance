import 'package:flutter/material.dart';
import 'package:mobile/util/localization.dart';
import 'package:mobile/util/sort_util.dart';

import '../../../constants.dart';

class SortBottom extends StatefulWidget {
  final Function sortCallback;
  String sortField = '';
  String sortOrder = '';

  SortBottom({Key? key, required this.sortCallback}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SortBottomState();
}

class _SortBottomState extends State<SortBottom> {
  @override
  void deactivate() {
    widget.sortCallback(widget.sortField, widget.sortOrder);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      height: size.height * 0.2,
      width: size.width,
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            dropdownColor: SECONDARY_COLOR,
            hint: Text('SORT_FIELD'.i18n),
            iconSize: 24,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.sort,
                color: PRIMARY_COLOR,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: SECONDARY_COLOR),
              ),
            ),
            style: const TextStyle(color: Colors.black),
            onChanged: (String? newValue) => widget.sortField = newValue!,
            items: SortUtil.TRANSACTIONS_SORT_FIELDS
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value.i18n),
              );
            }).toList(),
          ),
          const Spacer(),
          DropdownButtonFormField<String>(
            dropdownColor: SECONDARY_COLOR,
            hint: Text('SORT_ORDER'.i18n),
            iconSize: 24,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.compare_arrows,
                color: PRIMARY_COLOR,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: SECONDARY_COLOR),
              ),
            ),
            style: const TextStyle(color: Colors.black),
            onChanged: (String? newValue) => widget.sortOrder = newValue!,
            items: SortUtil.SORT_ORDER
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value.i18n),
              );
            }).toList(),
          ),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }
}
