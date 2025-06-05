import 'package:flutter/material.dart';
import 'package:my_app/components/Sidebar.dart';

class ChooseLocation extends StatefulWidget {
  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int count = 0;

  @override
  void initState() {
    print("Init state");
    super.initState();
  }

  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(),
      body: ElevatedButton(
        onPressed:
            () => {
              setState(() {
                count += 1;
              }),
            },
        child: Text('Count $count'),
      ),
    );
  }
}
