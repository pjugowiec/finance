import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:intl/intl.dart';
import 'package:mobile/components/text_field_container.dart';

class DateSelect extends StatefulWidget {
  final Color iconColor;
  final Color backgroundColor;
  final String hintText;
  final TextEditingController controller;

  const DateSelect(
      {Key? key,
      required this.iconColor,
      required this.backgroundColor,
      required this.hintText,
      required this.controller})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _DateSelectState();
}

class _DateSelectState extends State<DateSelect> {
  Locale currentLocale = I18n.locale;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: widget.backgroundColor,
      child: TextFormField(
        controller: widget.controller,
        cursorColor: widget.iconColor,
        decoration: InputDecoration(
          icon: Icon(
            Icons.calendar_today,
            color: widget.iconColor,
          ),
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              locale: currentLocale,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
              builder: (context, child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    colorScheme: const ColorScheme.light().copyWith(
                      primary: widget.iconColor,
                    ),
                  ),
                  child: child!,
                );
              });
          if (pickedDate != null) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            setState(
              () {
                widget.controller.text =
                    formattedDate; //set output date to TextField value.
              },
            );
          }
        },
      ),
    );
  }
}
