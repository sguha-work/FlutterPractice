import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FBDB {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool userStatus = false;
  late Error e;
  FBDB() {
    //_initialize();
  }
  Future<void> _initialize()async {
    await Firebase.initializeApp();
    auth = FirebaseAuth.instance;
  }
  monitorUserState() {
    try {
      auth.authStateChanges().listen((User? user) {
        if (user == null) {
          userStatus = false;
        } else {
          userStatus = true;
        }
      });
    } catch(exception) {
      final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    }
  }
  bool isLoggedIn() {
    return userStatus;
  }
  Future<String> register(email, password)async {
    await Firebase.initializeApp();
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return e.code;
      } else if (e.code == 'email-already-in-use') {
        return e.code;
      }
    } catch (e) {
      return e.toString();
    }
    return 'completed';
  }
}
