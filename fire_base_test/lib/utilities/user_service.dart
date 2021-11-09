// Importing Firebase packages
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import common
import 'common.dart';

// importing models
import '../models/user.dart';

class UserService {
  String userCollectionName = 'collections_user';

  Future<String> register(email, password) async {
    email = email.trim();
    password = password.trim();
    if (password == '') {
      return 'error_empty-password';
    }
    if (Common.isValidEmail(email)) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        final User userData = userCredential.user!;
        return 'success__' + userData.uid;
      } on FirebaseAuthException catch (e) {
        //'weak-password','email-already-in-use'
        return e.code;
      } catch (e) {
        return e.toString();
      }
    } else {
      return 'error_invalid-email';
    }
  }

  Future<String?> getCurrentUserId() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      return null;
    }
  }

  Future<String> signIn(String email, String password) async {
    email = email.trim();
    password = password.trim();
    if (password == '') {
      return 'error_empty-password';
    }
    if (Common.isValidEmail(email)) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        final User userData = userCredential.user!;
        return 'success__' + userData.uid;
      } on FirebaseAuthException catch (e) {
        //weak-password,email-already-in-use
        return ('error_' + e.code);
      } catch (e) {
        return ('error_' + e.toString());
      }
    } else {
      return 'error_invalid-email';
    }
  }

  Future<List<UserModel>?> getAllSupervisorBasedOnRegion(
      {String regionCode = ''}) async {
    List<UserModel> usersList = [];
    try {
      if (regionCode == '') {
        await FirebaseFirestore.instance
            .collection(userCollectionName)
            .where('userType', isEqualTo: 'supervisor')
            .get()
            .then((QuerySnapshot querySnapshot) {
          for (var doc in querySnapshot.docs) {
            UserModel user = UserModel(
                fullName: doc['fullName'] ?? '',
                dateOfBirth: doc['dateOfBirth'] ?? '',
                email: doc['email'] ?? '',
                phoneNumber: doc['phoneNumber'] ?? '',
                userType: doc['userType'] ?? '',
                regionCode: doc['regionCode'] ?? '',
                area: doc['are'] ?? '',
                city: doc['city'] ?? '',
                pin: doc['pin'] ?? '',
                state: doc['state'] ?? '',
                isApprovedByAdmin: doc['isApprovedByAdmin'] ?? '',
                createdOn: doc['createdOn'] ?? '',
                approvedOn: doc['approvedOn'] ?? '');
            usersList.add(user);
          }
        });
      } else {
        await FirebaseFirestore.instance
            .collection(userCollectionName)
            .where('regionCode', isEqualTo: regionCode)
            .where('userType', isEqualTo: 'supervisor')
            .get()
            .then((QuerySnapshot querySnapshot) {
          for (var doc in querySnapshot.docs) {
            UserModel user = UserModel(
                fullName: doc['fullName'] ?? '',
                dateOfBirth: doc['dateOfBirth'] ?? '',
                email: doc['email'] ?? '',
                phoneNumber: doc['phoneNumber'] ?? '',
                userType: doc['userType'] ?? '',
                regionCode: doc['regionCode'] ?? '',
                area: doc['are'] ?? '',
                city: doc['city'] ?? '',
                pin: doc['pin'] ?? '',
                state: doc['state'] ?? '',
                isApprovedByAdmin: doc['isApprovedByAdmin'] ?? '',
                createdOn: doc['createdOn'] ?? '',
                approvedOn: doc['approvedOn'] ?? '');
            usersList.add(user);
          }
        });
      }
      return usersList;
    } catch (e) {
      return null;
    }
  }

  Future<List<UserModel>?> getAllUser(
      {String userType = '', String regionCode = ''}) async {
    List<UserModel> usersList = [];
    try {
      await FirebaseFirestore.instance
          .collection(userCollectionName)
          .where('userType', isEqualTo: userType)
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          UserModel user = UserModel(
              fullName: doc['fullName'] ?? '',
              dateOfBirth: doc['dateOfBirth'] ?? '',
              email: doc['email'] ?? '',
              phoneNumber: doc['phoneNumber'] ?? '',
              userType: doc['userType'] ?? '',
              regionCode: doc['regionCode'] ?? '',
              area: doc['are'] ?? '',
              city: doc['city'] ?? '',
              pin: doc['pin'] ?? '',
              state: doc['state'] ?? '',
              isApprovedByAdmin: doc['isApprovedByAdmin'] ?? '',
              createdOn: doc['createdOn'] ?? '',
              approvedOn: doc['approvedOn'] ?? '');
          usersList.add(user);
        }
      });

      return usersList;
    } catch (e) {
      return null;
    }
  }

  Future<String?> addUser(UserModel user) async {
    String registrationResult = await register(user.email, user.password);
    if (registrationResult.contains('error_')) {
      return registrationResult;
    }
    String userId = registrationResult.split('success__').last;
    CollectionReference usersCollectionReference =
        FirebaseFirestore.instance.collection(userCollectionName);
    String result = '';
    await usersCollectionReference
        .doc(userId)
        .set(user)
        .then((value) => {result = 'success__' + userId})
        .catchError((error) => {result = 'error_' + error.toString()});
    return result;
  }
}
