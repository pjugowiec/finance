import 'dart:convert';

TransactionsRequest transactionsRequestFromJson(String str) => TransactionsRequest.fromJson(json.decode(str));

String transactionsRequestToJson(TransactionsRequest data) => json.encode(data.toJson());

class TransactionsRequest {
  TransactionsRequest({
    required this.minAmount,
    required this.maxAmount,
    required this.categories,
    required this.dateFrom,
    required this.dateTo,
    required this.sort,
  });

  double minAmount;
  double maxAmount;
  List<int> categories;
  DateTime dateFrom;
  DateTime dateTo;
  String sort;

  factory TransactionsRequest.fromJson(Map<String, dynamic> json) => TransactionsRequest(
    minAmount: json["minAmount"].toDouble(),
    maxAmount: json["maxAmount"].toDouble(),
    categories: List<int>.from(json["categories"].map((x) => x)),
    dateFrom: DateTime.parse(json["dateFrom"]),
    dateTo: DateTime.parse(json["dateTo"]),
    sort: json["sort"],
  );

  Map<String, dynamic> toJson() => {
    "minAmount": minAmount,
    "maxAmount": maxAmount,
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "dateFrom": "${dateFrom.year.toString().padLeft(4, '0')}-${dateFrom.month.toString().padLeft(2, '0')}-${dateFrom.day.toString().padLeft(2, '0')}",
    "dateTo": "${dateTo.year.toString().padLeft(4, '0')}-${dateTo.month.toString().padLeft(2, '0')}-${dateTo.day.toString().padLeft(2, '0')}",
    "sort": sort,
  };
}
