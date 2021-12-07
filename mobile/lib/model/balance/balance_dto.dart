import 'dart:convert';

BalanceDto balanceDtoFromJson(String str) => BalanceDto.fromJson(json.decode(str));

String balanceDtoToJson(BalanceDto data) => json.encode(data.toJson());

class BalanceDto {
  BalanceDto({
    required this.balance,
    required this.description,
    required this.categoryId,
    required this.balanceFlow,
  });

  double balance;
  String description;
  int categoryId;
  String balanceFlow;

  factory BalanceDto.fromJson(Map<String, dynamic> json) => BalanceDto(
    balance: json["balance"].toDouble(),
    description: json["description"],
    categoryId: json["categoryId"],
    balanceFlow: json["balanceFlow"],
  );

  Map<String, dynamic> toJson() => {
    "balance": balance.toString(),
    "description": description,
    "categoryId": categoryId.toString(),
    "balanceFlow": balanceFlow,
  };
}