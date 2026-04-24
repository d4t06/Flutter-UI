import 'package:flutter/material.dart';
import 'package:my_app/components/app_sidebar.dart';
import 'package:my_app/components/app_top_bar.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppTopBar(title: "Layout"),
      drawer: AppSidebar(),

      body: Column(
        children: [
          Text("lakdfsjglkdfjas"),
          Expanded(
            child: ListView(
              children: [
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("Test Text"),
                            Row(
                              children: [
                                ElevatedButton(
                                  child: Text("adfd"),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            Text("Test Text"),

                            SizedBox(height: 700),
                            Text("Test Text"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
