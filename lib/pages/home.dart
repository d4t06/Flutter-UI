import 'package:flutter/material.dart';
import 'package:my_app/components/app_sidebar.dart';
import 'package:my_app/components/app_top_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppSidebar(),
      appBar: AppTopBar(title: "Home"),
      body: Center(child: Text("Home")),
    );
  }
}
