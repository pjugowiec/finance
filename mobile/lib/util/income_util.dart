class IncomeUtil {

  static String addIncome(double newValue, double currentValue) {
    return (currentValue + newValue).toStringAsFixed(2);
  }

  static String addExpenses(double newValue, double currentValue) {
    return (currentValue - newValue).toStringAsFixed(2);
  }

}