import 'package:flutter/material.dart';
import '../widgets/dialog.dart';
class HomePage extends StatefulWidget {
  var uid;

  HomePage({Key? key, required this.uid}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(uid);
}

class _HomePageState extends State<HomePage> {
  String uid='';
  _HomePageState(uid) {
    uid = uid;
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
          child: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Welcome '+uid,
              style: const TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}