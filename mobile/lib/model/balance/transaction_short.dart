import 'dart:convert';

TransactionShort transactionShortFromJson(String str) => TransactionShort.fromJson(json.decode(str));

String transactionShortToJson(TransactionShort data) => json.encode(data.toJson());

class TransactionShort {
  TransactionShort({
    required this.id,
    required this.description,
    required this.category,
    required this.balance,
    required this.created,
  });

  int id;
  String description;
  String category;
  int balance;
  DateTime created;

  factory TransactionShort.fromJson(Map<String, dynamic> json) => TransactionShort(
    id: json["id"],
    description: json["description"],
    category: json["category"],
    balance: json["balance"],
    created: DateTime.parse(json["created"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "description": description,
    "category": category,
    "balance": balance,
    "created": "${created.year.toString().padLeft(4, '0')}-${created.month.toString().padLeft(2, '0')}-${created.day.toString().padLeft(2, '0')}",
  };
}
