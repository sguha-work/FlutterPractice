import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FBDB {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool userStatus = false;
  late Error e;
  FBDB() {
    //_initialize();
  }
  Future<void> _initialize() async {
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
    } catch (exception) {
      final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    }
  }

  bool isLoggedIn() {
    return userStatus;
  }

  Future<String> signin(email, password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final User userData = userCredential.user!;
      return 'success__' + userData.uid;
    } on FirebaseAuthException catch (e) {
      // if (e.code == 'user-not-found') {
      //   print('No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   print('Wrong password provided for that user.');
      // }
      return e.code;
    }
  }

  Future<String> register(email, password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final User userData = userCredential.user!;
      return 'success__' + userData.uid;
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

  Future<String> write(
      {String userGiven_collectionName = '',
      String userGiven_documentId = '',
      var userGiven_document}) async {
    try {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('/' + userGiven_collectionName);
      await collectionReference
          .doc(userGiven_documentId)
          .set(userGiven_document);
      return 'done';
    } catch (e) {
      return 'error__' + e.toString();
    }
  }

  Future<dynamic> read(
      {String provided_collectionName = '',
      String provided_doumentId = ''}) async {
    CollectionReference collectionReferrence =
        FirebaseFirestore.instance.collection(provided_collectionName);
    dynamic data = await collectionReferrence.doc(provided_doumentId).get();
    return data;
  }
}
