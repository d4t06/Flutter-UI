import 'package:flutter/material.dart';

class MyDialog {
  static Future<bool> show(
    BuildContext context,
    String title,
    String body,
  ) async {
    final isConfirm = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          content: Text(body),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Yes, please'),
            ),
          ],
        );
      },
    );

    return (isConfirm != null) ? isConfirm : false;
  }
}
