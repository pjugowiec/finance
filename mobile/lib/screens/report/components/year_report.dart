import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:mobile/components/loader_round.dart';
import 'package:mobile/model/reports/income_expenses_year_model.daty.dart';
import 'package:mobile/services/reports/report_rest_service.dart';
import 'package:mobile/util/localization.dart';

class YearReport extends StatefulWidget {
  const YearReport({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _YearReportState();
}

class _YearReportState extends State<YearReport> {
  late Future<List<IncomeExpensesYearModel>> data =
  ReportRestService.getIncomeExpensesYear(context);

  Set<BarChartGroupData> balanceReportData = _fillSet();

  double maxValue = 5000;

  static Set<BarChartGroupData> _fillSet() {
    Set<BarChartGroupData> result = {};
    for (int i = 1; i <= 12; i++) {
      result.add(BarChartGroupData(x: i, barRods: []));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return FutureBuilder<List<IncomeExpensesYearModel>>(
        future: data,
        builder: (context, data) {
          if (data.hasData) {
            data.data!.forEach((element) {
              BarChartGroupData month = balanceReportData.firstWhere((group) =>
              element.month == group.x);

              List<BarChartRodData> barChart = month.barRods;

              BarChartRodData elementData = element.income == null
                  ? BarChartRodData(y: element.expenses, colors: [Colors.red])
                  : BarChartRodData(y: element.income, colors: [Colors.green]);

              barChart.add(elementData);

              balanceReportData.remove(month);
              balanceReportData.add(month);
            });
            return Column(
              children: [
                Text('YEAR_INCOME_EXPENSES_REPORT_DESCRIPTION'.i18n,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: size.height * 0.65,
                  child: BarChart(BarChartData(
                    titlesData: FlTitlesData(
                      rightTitles: SideTitles(
                        showTitles: false,
                      ),
                      topTitles: SideTitles(
                        showTitles: false,
                      ),
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTitles: (value) => value.toStringAsFixed(0),
                      ),
                      leftTitles: SideTitles(
                        showTitles: true,
                      ),
                    ),
                    borderData: FlBorderData(
                        border: Border.all(color: Colors.white, width: 0.5)),
                    alignment: BarChartAlignment.spaceEvenly,
                    maxY: maxValue,
                    barGroups: balanceReportData.toSet().toList(),
                  )),

                  // charts.BarChart(
                  //   _createSampleData(data.data!),
                  //   animate: true,
                  //   barGroupingType: charts.BarGroupingType.grouped,
                  //   defaultRenderer: charts.BarRendererConfig(
                  //     groupingType: charts.BarGroupingType.grouped,
                  //     strokeWidthPx: 1.0,
                  //   ),
                  // ),
                )
              ],
            );
          } else {
            return const LoaderRound();
          }
        });
  }

  static List<charts.Series<IncomeExpensesYearModel, String>> _createSampleData(
      List<IncomeExpensesYearModel> data) {
    return [
      charts.Series<IncomeExpensesYearModel, String>(
        id: 'Expenses',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (IncomeExpensesYearModel model, _) => model.month.toString(),
        measureFn: (IncomeExpensesYearModel model, _) => model.expenses,
        data: data,
      ),
      charts.Series<IncomeExpensesYearModel, String>(
        id: 'Income',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (IncomeExpensesYearModel model, _) => model.month.toString(),
        measureFn: (IncomeExpensesYearModel model, _) => model.income,
        data: data,
      ),
    ];
  }
}
