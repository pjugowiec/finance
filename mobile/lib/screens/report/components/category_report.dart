import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mobile/model/reports/category_report.dart';
import 'package:mobile/services/reports/report_rest_service.dart';
import 'package:mobile/util/income_util.dart';
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
            for (var e in data.data!)
              e.category:
                  double.parse(IncomeUtil.getFixedStringFromDouble(e as double))
          };
          return PieChart(
            dataMap: pieData,
            animationDuration: const Duration(milliseconds: 800),
            chartLegendSpacing: 50,
            chartRadius: MediaQuery.of(context).size.width,
            initialAngleInDegree: 0,
            chartType: ChartType.disc,
            ringStrokeWidth: 32,
            centerText: "HYBRID",
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
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
              decimalPlaces: 2,
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
