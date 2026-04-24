import 'package:flutter/material.dart';
import 'package:my_app/main.dart';



class AppSidebar extends StatelessWidget {
  const AppSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.all(0),
        child: ListView(
          children: [
            const DrawerHeader(child: Center(child: Text("Flutter UI"))),

            ...routes
                .map(
                  (item) => ListTile(
                    leading: Icon(Icons.link),
                    title: Text(item.title),
                    onTap: () {
                      Navigator.pushNamed(context, item.path);
                    },
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
