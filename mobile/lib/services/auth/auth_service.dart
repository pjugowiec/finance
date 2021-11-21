import 'package:mobile/model/auth/register_user.dart';

class AuthService {
  Future<RegisterUser> registerUser(
      String email, String password) async {


    return RegisterUser(email: email, password: password);
  }
}
