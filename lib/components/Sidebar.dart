import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.all(0),
        child: ListView(
          children: [
            DrawerHeader(child: Center(child: Text("Flutter UI"))),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: Icon(Icons.link),
              title: Text('Todo'),
              onTap: () {
                Navigator.pushNamed(context, '/todo');
              },
            ),
             ListTile(
              leading: Icon(Icons.link),
              title: Text('Dialog'),
              onTap: () {
                Navigator.pushNamed(context, '/dialog');
              },
            ),
             ListTile(
              leading: Icon(Icons.link),
              title: Text('Tab Bar'),
              onTap: () {
                Navigator.pushNamed(context, '/tab-bar');
              },
            ),
            Divider(),
            ListTile(leading: Icon(Icons.folder), title: Text('Test')),
            ListTile(leading: Icon(Icons.folder), title: Text('Test')),
          ],
        ),
      ),
    );
  }
}
