import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mobile/components/report_component.dart';
import 'package:mobile/model/reports/category_report_model.dart';
import 'package:mobile/services/reports/report_rest_service.dart';
import 'package:mobile/util/income_util.dart';
import 'package:mobile/util/localization.dart';
import 'package:pie_chart/pie_chart.dart';

class CategoryReport extends StatefulWidget {
  const CategoryReport({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CategoryReportState();
}

class _CategoryReportState extends State<CategoryReport> {
  @override
  Widget build(BuildContext context) {
    late Future<List<CategoryReportModel>> data =
        ReportRestService.getCategoryReport(context);

    return FutureBuilder<List<CategoryReportModel>>(
      future: data,
      builder: (context, data) {
        if (data.hasData) {
          Map<String, double> pieData = {
            for (CategoryReportModel e in data.data!)
              e.category:
                  double.parse(IncomeUtil.getFixedStringFromDouble(e.value))
          };
          return ReportComponent(
            description: 'CATEGORY_REPORT_DESCRIPTION'.i18n,
            widget: PieChart(
              dataMap: pieData,
              animationDuration: const Duration(milliseconds: 800),
              chartLegendSpacing: 30,
              chartRadius: MediaQuery.of(context).size.width,
              initialAngleInDegree: 0,
              chartType: ChartType.disc,
              ringStrokeWidth: 32,
              // centerText: "HYBRID",
              legendOptions: const LegendOptions(
                showLegendsInRow: true,
                legendPosition: LegendPosition.bottom,
                showLegends: true,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: const ChartValuesOptions(
                showChartValueBackground: true,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: false,
                decimalPlaces: 2,
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
