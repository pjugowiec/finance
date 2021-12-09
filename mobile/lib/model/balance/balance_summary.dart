import 'dart:convert';

BalanceSummaryModel balanceSummaryFromJson(String str) => BalanceSummaryModel.fromJson(json.decode(str));

String balanceSummaryToJson(BalanceSummaryModel data) => json.encode(data.toJson());

class BalanceSummaryModel {
  BalanceSummaryModel({
    required this.balance,
    required this.income,
    required this.expenses,
  });

  double balance;
  double income;
  double expenses;

  factory BalanceSummaryModel.fromJson(Map<String, dynamic> json) => BalanceSummaryModel(
    balance: json["balance"] ?? 0.0,
    income: json["income"] ?? 0.0,
    expenses: json["expenses"] ?? 0.0,
  );

  Map<String, dynamic> toJson() => {
    "balance": balance,
    "income": income,
    "expenses": expenses,
  };
}
