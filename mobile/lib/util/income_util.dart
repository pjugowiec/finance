class IncomeUtil {

  static double MAX_VALUE = 1500.0;
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