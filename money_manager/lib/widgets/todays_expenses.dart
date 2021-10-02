import 'package:flutter/material.dart';

class TodaysExpenses extends StatefulWidget {
  const TodaysExpenses({Key? key}) : super(key: key);
  @override
  State<TodaysExpenses> createState() => _TodaysExpenses();
}

class _TodaysExpenses extends State<TodaysExpenses> {
  final double heightOfListItem = 10;
  @override
  Widget build(context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: heightOfListItem,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: heightOfListItem,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: heightOfListItem,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );
  }
}
