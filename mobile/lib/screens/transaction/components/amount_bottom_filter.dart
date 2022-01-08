import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/util/income_util.dart';
import 'package:mobile/util/localization.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class AmountBottomFilter extends StatefulWidget {
  final Function amountFilterCallback;
  final double minAmount;
  final double maxAmount;

  const AmountBottomFilter(
      {Key? key,
      required this.amountFilterCallback,
      required this.minAmount,
      required this.maxAmount})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _AmountBottomFilterState();
}

class _AmountBottomFilterState extends State<AmountBottomFilter> {
  SfRangeValues _currentRangeValues = const SfRangeValues(0.0, 20000.0);
  String _roundedMinValue = "";
  String _roundedMaxValue = "";

  @override
  void initState() {
    _roundedMaxValue = widget.maxAmount.toString();
    _roundedMinValue = widget.minAmount.toString();
    _currentRangeValues = SfRangeValues(widget.minAmount, widget.maxAmount);
  }

  @override
  void deactivate() {
    widget.amountFilterCallback(
        _currentRangeValues.start, _currentRangeValues.end);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      height: size.height * 0.3,
      width: size.width,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
                top: 20.0, bottom: 10.0, left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "MIN_AMOUNT".i18n + "\n\n" + _roundedMinValue,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "MAX_AMOUNT".i18n + "\n\n" + _roundedMaxValue,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                top: 30.0, bottom: 10.0, left: 10.0, right: 10.0),
            child: SfRangeSlider(
              values: _currentRangeValues,
              max: widget.maxAmount,
              min: widget.minAmount,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              activeColor: PRIMARY_COLOR,
              inactiveColor: SECONDARY_COLOR,
              onChanged: (SfRangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                  _roundedMinValue =
                      IncomeUtil.getFixedStringFromDouble(values.start);
                  _roundedMaxValue =
                      IncomeUtil.getFixedStringFromDouble(values.end);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
