import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/dialog.dart';
import '../utilities/firebase_db.dart';
import '../models/user.dart';

class HomePage extends StatefulWidget {
  var uid;

  HomePage({Key? key, required this.uid}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(uid);
}

class _HomePageState extends State<HomePage> {
  String uid = '';
  dynamic user;
  _HomePageState(uid) {}
  void _getUserDataFromUID(String uid) async {
    print('*****uid ' + uid);
    dynamic snapshot = await FBDB().read(
        provided_collectionName: 'users_collection', provided_doumentId: uid);
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    print(data.toString());

    setState(() {
      if(data==null) {
        user = UserModel(fullName: '');
      } else {
        user = UserModel(fullName: data['fullName']);
      }
    });
    dynamic getUser = await FirebaseAuth.instance.currentUser!;
    print('************ user'+getUser.toString());
    String userID = getUser.uid;

  }

  @override
  void initState() {
    super.initState();
    print('*****getting data');
    _getUserDataFromUID(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Container(
          height: 80,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: TextButton(
            onPressed: () {
              //

            },
            child: Text(
              'Welcome '+(user!=null?user.fullName:''),
              style: const TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
