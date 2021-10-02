import 'dart:html';

import 'package:flutter/material.dart';

class CustomDialog {
  static void showAddExpenseDialog(context) {
    showDialog(
      context: context,
      builder: (_) {
        var emailController = TextEditingController();
        var messageController = TextEditingController();
        return AlertDialog(
          title: const Text('Add expense'),
          content: SingleChildScrollView(
            child: Column(
              //shrinkWrap: true,
              children: [
                TextFormField(
                  controller: messageController,
                  decoration: const InputDecoration(hintText: 'Description'),
                ),
                TextFormField(
                  controller: messageController,
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
                var email = emailController.text;
                var message = messageController.text;
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
