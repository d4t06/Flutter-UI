import 'package:flutter/material.dart';
import 'package:my_app/components/app_sidebar.dart';
import 'package:my_app/components/app_top_bar.dart';
import 'package:my_app/theme/app_text_styles.dart';

class SheetPage extends StatefulWidget {
  const SheetPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SheetPageState();
  }
}

class _SheetPageState extends State<SheetPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppTopBar(title: "Sheet"),
      drawer: AppSidebar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(
              child: Text('open'),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: _buildSheet,
                  isScrollControlled: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSheet(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ListView(
              children: [
                Text("This is bottom sheet", style: context.text2xl.bold),

                Container(height: 20, color: Colors.lightBlue),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
                Text("This is bottom sheet", style: context.textLg),
              ],
            ),

            Positioned(
              right: 8,
              top: 8,
              child: ElevatedButton(
                child: Text("X"),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
