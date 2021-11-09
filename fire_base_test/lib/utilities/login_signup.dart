import 'firebase_db.dart';
import '../models/user.dart';

class LoginSignup {
  FBDB dbInstance = FBDB();
  static final instance = LoginSignup();
  LoginSignup() {}
  static Future<String> login(email, password) async{
    String result =  await instance.dbInstance.signin(email, password);
    return result;
  }
  static Future<String> signup(UserModel user) async {
    String result =
        await instance.dbInstance.register(user.email, user.password);
    if (result.contains('success__')) {
      // registration successful
      // storing additional info
      String uid = result.split('success__').last;
      var userAdditionalInfo = {
        'fullName': user.fullName,
        'dateOfBirth': user.dateOfBirth,
        'email': user.email,
        'phoneNumber': user.phoneNumber
      };
      String finalResult = await instance.dbInstance
          .write(userGiven_collectionName: 'users_collection', userGiven_document: userAdditionalInfo, userGiven_documentId: uid);
      return finalResult.toString();
    } else {
      return result;
    }
  }

  static bool isLoggedIn() {
    return instance.dbInstance.isLoggedIn();
  }
}
