// ignore_for_file: non_constant_identifier_names

import 'package:i18n_extension/i18n_extension.dart';

class SortUtil {
  static final List<String> TRANSACTIONS_SORT_FIELDS =
      ['CATEGORY', 'DATE', 'AMOUNT'];

  static final List<String> SORT_ORDER = ['INCREASING', 'DECREASING'];

  static const String DEFAULT_SORT = 'date';

  static String parseSort(String field, String direction) {
    if(field.isEmpty || direction.isEmpty) {
      return DEFAULT_SORT;
    }
    return _getDirection(direction) + field;
  }

  static String _getDirection(String direction) {
    switch (direction) {
      case 'INCREASING': {
        return '';
      }
      case 'DECREASING': {
        return '-';
      }
      default: {
        throw Exception('Wrong direction');
      }
    }
  }
}