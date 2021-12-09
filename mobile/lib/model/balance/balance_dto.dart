import 'dart:convert';

import 'package:intl/intl.dart';

BalanceDto balanceDtoFromJson(String str) => BalanceDto.fromJson(json.decode(str));

String balanceDtoToJson(BalanceDto data) => json.encode(data.toJson());

class BalanceDto {
  BalanceDto({
    required this.balance,
    required this.description,
    required this.categoryId,
    required this.balanceFlow,
    required this.date
  });

  double balance;
  String description;
  int categoryId;
  String balanceFlow;
  DateTime date;

  factory BalanceDto.fromJson(Map<String, dynamic> json) => BalanceDto(
    balance: json["balance"].toDouble(),
    description: json["description"],
    categoryId: json["categoryId"],
    balanceFlow: json["balanceFlow"],
    date: json["date"]
  );

  Map<String, dynamic> toJson() => {
    "balance": balance.toString(),
    "description": description,
    "categoryId": categoryId.toString(),
    "balanceFlow": balanceFlow,
    "date": DateFormat('yyyy-MM-ddThh:mm:ss').format(date)
  };
}