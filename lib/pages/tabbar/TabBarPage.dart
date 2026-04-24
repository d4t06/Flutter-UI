import 'package:flutter/material.dart';
import 'package:my_app/components/app_sidebar.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: AppSidebar(),
        appBar: AppBar(
          backgroundColor: Colors.greenAccent[200],
          title: Text("Tab Bar"),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.message), text: 'Chat'),
              Tab(icon: Icon(Icons.message), text: 'Call'),
              Tab(icon: Icon(Icons.message), text: 'Test'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(child: Center(child: Text('Chat'))),
            Container(child: Center(child: Text('Call'))),
            Container(child: Center(child: Text('Test'))),
          ],
        ),
      ),
    );
  }
}
