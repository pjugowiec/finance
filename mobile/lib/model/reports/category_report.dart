import 'dart:convert';

CategoryReportModel categoryReportFromJson(String str) => CategoryReportModel.fromJson(json.decode(str));

String categoryReportToJson(CategoryReportModel data) => json.encode(data.toJson());

class CategoryReportModel {
  CategoryReportModel({
    required this.category,
    required this.value,
  });

  String category;
  int value;

  factory CategoryReportModel.fromJson(Map<String, dynamic> json) => CategoryReportModel(
    category: json["category"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "value": value,
  };
}