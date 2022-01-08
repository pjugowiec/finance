import 'dart:convert';

import 'package:intl/intl.dart';

TransactionsRequest transactionsRequestFromJson(String str) =>
    TransactionsRequest.fromJson(json.decode(str));

String transactionsRequestToJson(TransactionsRequest data) =>
    json.encode(data.toJson());

class TransactionsRequest {
  TransactionsRequest(
      {required this.minAmount,
      required this.maxAmount,
      required this.categories,
      required this.dateFrom,
      required this.dateTo,
      required this.sort,
      required this.count});

  double minAmount;
  double maxAmount;
  List<int> categories;
  DateTime dateFrom;
  DateTime dateTo;
  String sort;
  int count;

  factory TransactionsRequest.fromJson(Map<String, dynamic> json) =>
      TransactionsRequest(
          minAmount: json["minAmount"].toDouble(),
          maxAmount: json["maxAmount"].toDouble(),
          categories: List<int>.from(json["categories"].map((x) => x)),
          dateFrom: DateTime.parse(json["dateFrom"]),
          dateTo: DateTime.parse(json["dateTo"]),
          sort: json["sort"],
          count: json["count"]);

  Map<String, dynamic> toJson() => {
        "minAmount": minAmount.toDouble().toString(),
        "maxAmount": maxAmount.toDouble().toString(),
        "categoriesIds": List<dynamic>.from(categories.map((x) => x)),
        "from": DateFormat('yyyy-MM-ddThh:mm:ss').format(dateFrom),
        "to": DateFormat('yyyy-MM-ddThh:mm:ss').format(dateTo),
        "sort": sort,
        "count": count.toString()
      };
}
