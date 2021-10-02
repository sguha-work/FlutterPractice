import 'package:flutter/material.dart';

class TodaysExpenses extends StatefulWidget {
  const TodaysExpenses({Key? key}) : super(key: key);
  @override
  State<TodaysExpenses> createState() => _TodaysExpenses();
}

class _TodaysExpenses extends State<TodaysExpenses> {
  final double heightOfListItem = 30;
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(context) {
    return ListView.separated(
      itemCount: entries.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Container(
            height: 50,
            color: Colors.red[200],
            child: const Center(child: Text('Todays Expense list')),
          );
        } else {
          return Container(
            height: heightOfListItem,
            color: Colors.blue[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        }
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
