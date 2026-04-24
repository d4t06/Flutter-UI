import 'package:flutter/material.dart';
import 'package:my_app/components/app_sidebar.dart';
import 'package:my_app/components/app_top_bar.dart';
import 'package:my_app/theme/app_shadows.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<StatefulWidget> createState() => _FromPageState();
}

class _FromPageState extends State<FormPage> {
  String value = '';

  String _username = '';
  String _password = '';

  final node = FocusNode();

  final _controller = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(title: "Form"),
      drawer: AppSidebar(),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: ListView(
          children: [
            Column(
              spacing: 10,
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  controller: _controller,

                  decoration: InputDecoration(
                    filled: true,
                    border: InputBorder.none,
                    hintText: "hehe",
                    fillColor: Colors.black12,
                  ),
                  // onChanged: (val) => setState(() => value = val),
                ),

                Text("You typing: $value"),

                FilledButton(
                  child: Text("Get value"),
                  onPressed: () => setState(() => value = _controller.text),
                ),

                OutlinedButton(child: Text("asdfasdf"), onPressed: () {}),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: context.shadowXl,
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: key,
                      child: Column(
                        spacing: 16,
                        children: [
                          Text("Simple form"),
                          TextFormField(
                            decoration: InputDecoration(
                              label: Text("hehe"),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                              hintText: "asdas",
                              fillColor: Colors.black12,
                            ),
                            validator: (val) {
                              if (val == null || val.trim().isEmpty)
                                return "error";

                              return null;
                            },
                            onSaved: (v) => setState(() => _username = v!),
                          ),

                          TextFormField(
                            focusNode: node,
                            decoration: InputDecoration(
                              label: Text("hihi"),
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                              hintText: "hihi",
                              fillColor: Colors.black12,
                            ),
                            validator: (val) {
                              if (val == null || val.trim().isEmpty)
                                return "error";

                              return null;
                            },
                            onSaved: (v) => setState(() => _password = v!),
                          ),

                          DropdownButtonFormField(
                            initialValue: 4,
                            items: [
                              DropdownMenuItem(value: 1, child: Text("1")),
                              DropdownMenuItem(value: 2, child: Text("2")),
                              DropdownMenuItem(value: 3, child: Text("3")),
                              DropdownMenuItem(value: 4, child: Text("4")),
                            ],
                            onChanged: (v) {
                              print(v);
                            },
                          ),

                          FilledButton(
                            child: Text("Focus"),
                            onPressed: () {
                              node.requestFocus();
                            },
                          ),

                          FilledButton.tonal(
                            child: Text("Get value"),
                            onPressed: () {
                              if (key.currentState!.validate()) {
                                key.currentState!.save();

                                print('$_username $_password');
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
