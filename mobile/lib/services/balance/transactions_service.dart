import 'package:flutter/material.dart';
import 'package:mobile/components/app_icons.dart';

class TransactionService {
  TransactionService._private();

  static final TransactionService _instance = TransactionService._private();

  static TransactionService get instance => _instance;

  static IconData getIconByType(String type) {
    switch (type) {
      case 'INCOME':
        {
          return AppIcons.income;
        }
      case 'EXPENSES':
        {
          return AppIcons.expense;
        }
      default:
        {
          throw Exception('WRONG TYPE');
        }
    }
  }
}
