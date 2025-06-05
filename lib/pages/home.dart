import 'package:flutter/material.dart';
import 'package:my_app/components/Sidebar.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(backgroundColor: Colors.greenAccent[200]),
      body: Center(child: Text("Home page")),
    );
  }
}
