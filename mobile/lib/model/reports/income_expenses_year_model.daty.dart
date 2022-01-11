import 'dart:convert';

IncomeExpensesYearModel incomeExpensesYearModelFromJson(String str) =>
    IncomeExpensesYearModel.fromJson(json.decode(str));

String incomeExpensesYearModelToJson(IncomeExpensesYearModel data) =>
    json.encode(data.toJson());

class IncomeExpensesYearModel {
  IncomeExpensesYearModel({
    required this.month,
    required this.income,
    required this.expenses,
  });

  int month;
  double income;
  double expenses;

  factory IncomeExpensesYearModel.fromJson(Map<String, dynamic> json) =>
      IncomeExpensesYearModel(
        month: json["month"],
        income: json["income"],
        expenses: json["expenses"],
      );

  Map<String, dynamic> toJson() => {
        "month": month,
        "income": income,
        "expenses": expenses,
      };
}
