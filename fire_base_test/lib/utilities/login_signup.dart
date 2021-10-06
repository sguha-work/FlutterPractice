import 'firebase_db.dart';
import '../models/user.dart';
class LoginSignup {
  FBDB dbInstance = FBDB();
  static final instance = LoginSignup();
  LoginSignup() {

  }
  static Future<String> signup(User user)async {
    String result = await instance.dbInstance.register(user.email, user.password);
    return result;
  }
  static bool isLoggedIn() {
    return instance.dbInstance.isLoggedIn();
  }

}