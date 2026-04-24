import 'package:flutter/material.dart';
import 'package:my_app/components/app_sidebar.dart';
import 'package:my_app/components/app_top_bar.dart';

class SnackBarPage extends StatelessWidget {
  const SnackBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(title: "Snack bar"),

      drawer: AppSidebar(),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              child: Text("Simle snack bar"),
              onPressed: () {
                final snackBar = SnackBar(content: Text("hehe"));

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ),
        ],
      ),
    );
  }
}
