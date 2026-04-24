import 'package:flutter/material.dart';
import 'package:my_app/components/app_sidebar.dart';
import 'package:my_app/components/app_top_bar.dart';
import 'package:my_app/models/Todo.dart';
import 'package:my_app/pages/provider/todo_item.dart';
import 'package:my_app/pages/provider/todo_provider.dart';

class ProviderPage extends StatefulWidget {
  const ProviderPage({super.key});

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  final todoProvider = TodoProvider();
  final _formGlobalKey = GlobalKey<FormState>();

  String todoTitle = '';
  String todoDescription = '';

  void handleAddTodo(BuildContext ct) {
    if (_formGlobalKey.currentState!.validate()) {
      _formGlobalKey.currentState!.save();
      Todo newTodo = Todo(
        title: todoTitle,
        description: todoDescription,
        isComplete: false,
      );

      todoProvider.addTodo(newTodo);

      _formGlobalKey.currentState!.reset();
    }
  }

  void handleDeleteTodo() {}

  @override
  Widget build(BuildContext context) {
    final todos = todoProvider.todos;

    return Scaffold(
      drawer: AppSidebar(),
      appBar: AppTopBar(title: "Provider Page"),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 10,
          children: [
            ListenableBuilder(
              listenable: todoProvider,
              builder: (context, child) {
                if (todos.isEmpty) {
                  return Text('Not found!');
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (_, index) {
                        final Todo item = todos[index];

                        return TodoItem(
                          item: item,
                          index: index,
                          delete: () => todoProvider.delete(index),
                          complete:
                              (bool value) =>
                                  todoProvider.complete(index, value),
                          edit: (Todo todo) => todoProvider.edit(index, todo),
                        );
                      },
                    ),
                  );
                }
              },
            ),

            ListenableBuilder(
              listenable: todoProvider,

              builder: (context, _) {
                return Form(
                  key: _formGlobalKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(label: Text("Title")),
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "You must enter value for the title";
                          }
                          return null;
                        },
                        onSaved: (v) {
                          todoTitle = v!;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(label: Text("Description")),
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "You must enter value for the description";
                          }
                          return null;
                        },
                        onSaved: (v) {
                          todoDescription = v!;
                        },
                      ),
                      ElevatedButton(
                        style: ButtonStyle(),
                        onPressed: () => handleAddTodo(context),
                        child: Text("Add"),
                      ),
                    ],
                  ),
                );
              },
            ),

            // form
          ],
        ),
      ),
    );
  }
}
