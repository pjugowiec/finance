class IncomeUtil {

  static double MAX_VALUE = 200000.0;
  static String addIncome(double newValue, double currentValue) {
    return (currentValue + newValue).toStringAsFixed(2);
  }

  static String addExpenses(double newValue, double currentValue) {
    return (currentValue - newValue).toStringAsFixed(2);
  }

  static String getFixedStringFromDouble(double value) {
    return value.toStringAsFixed(2);
  }

}