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
    balance: json["balance"],
    income: json["income"],
    expenses: json["expenses"],
  );

  Map<String, dynamic> toJson() => {
    "balance": balance,
    "income": income,
    "expenses": expenses,
  };
}
