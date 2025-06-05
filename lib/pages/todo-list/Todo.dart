import 'package:flutter/material.dart';
import 'package:my_app/components/Sidebar.dart';
import 'package:my_app/models/Todo.dart';
import 'package:my_app/pages/todo-list/TodoList.dart';
import 'package:my_app/pages/todo-list/useTodo.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final UseTodo useTodo = UseTodo();

  final _formGlobalKey = GlobalKey<FormState>();

  String todoTitle = '';
  String todoDescription = '';

  void handleAddTodo() {
    if (_formGlobalKey.currentState!.validate()) {
      _formGlobalKey.currentState!.save();
      Todo newTodo = Todo(
        title: todoTitle,
        description: todoDescription,
        isComplete: false,
      );

      setState(() {
        useTodo.addTodo(newTodo);
      });

      _formGlobalKey.currentState!.reset();
    }
  }

  void handleDeleteTodo () {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text('Todo list'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent[200],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 10,
          children: [
            Expanded(child: TodoList(todos: useTodo.todos)),

            // form
            Form(
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
                    onPressed: handleAddTodo,
                    child: Text("Add"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
