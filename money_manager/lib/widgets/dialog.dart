import 'package:flutter/material.dart';

class CustomDialog {
  static void showAddExpenseDialog(context) {
    showDialog(
      context: context,
      builder: (_) {
        var descriptionController = TextEditingController();
        var amountController = TextEditingController();
        return AlertDialog(
          title: const Text('Add expense'),
          content: SingleChildScrollView(
            child: Column(
              //shrinkWrap: true,
              children: [
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(hintText: 'Description'),
                ),
                TextFormField(
                  controller: amountController,
                  decoration: const InputDecoration(hintText: 'Amount'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Send them to your email maybe?
                var email = descriptionController.text;
                var message = amountController.text;
                Navigator.pop(context);
              },
              child: const Text('Send'),
            ),
          ],
        );
      },
    );
  }
}
