class SharedPreferences {

  static String CURRENCY = 'DOLLAR';

  static String getCurrencyShort(String currency) {
    switch (currency) {
      case('DOLLAR'):
        {
          return '\$';
        }
      default:
        {
          throw Exception('Not supported currency');
        }
    }
  }
}