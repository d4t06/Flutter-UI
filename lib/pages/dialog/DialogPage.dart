import 'package:flutter/material.dart';
import 'package:my_app/components/Sidebar.dart';
import 'package:my_app/pages/dialog/MyDialog.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(backgroundColor: Colors.greenAccent[200]),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final isConfirm = await MyDialog.show(
              context,
              "Title here",
              "body here",
            );

            print(isConfirm);
          },
          child: Text('Show modal'),
        ),
      ),
    );
  }
}
