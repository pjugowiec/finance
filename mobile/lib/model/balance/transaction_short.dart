import 'dart:convert';

TransactionShort transactionShortFromJson(String str) =>
    TransactionShort.fromJson(json.decode(str));

String transactionShortToJson(TransactionShort data) =>
    json.encode(data.toJson());

class TransactionShort {
  TransactionShort({
    required this.id,
    required this.type,
    required this.description,
    required this.category,
    required this.balance,
    required this.transactionDate,
  });

  int id;
  String type;
  String description;
  String category;
  double balance;
  DateTime transactionDate;

  factory TransactionShort.fromJson(Map<String, dynamic> json) =>
      TransactionShort(
        id: json["id"],
        description: json["description"],
        category: json["category"],
        balance: json["balance"],
        transactionDate: DateTime.parse(json["transactionDate"]),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "category": category,
        "balance": balance,
        "type": type,
        "created":
            "${transactionDate.year.toString().padLeft(4, '0')}-${transactionDate.month.toString().padLeft(2, '0')}-${transactionDate.day.toString().padLeft(2, '0')}",
      };
}
