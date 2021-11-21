// ignore_for_file: file_names

class SharedPreferences {
  SharedPreferences._private();

  static final SharedPreferences _instance =
  SharedPreferences._private();

  static SharedPreferences get instance => _instance;

  bool _isLogged = false;

  bool getIsLogged() => _isLogged;
  void setIsLogged(bool value) => _isLogged = value;
}