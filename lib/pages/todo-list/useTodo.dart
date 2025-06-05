import 'package:flutter/material.dart';
import 'package:my_app/models/Todo.dart';
import 'package:my_app/pages/todo-list/TodoProvider.dart';
import 'package:provider/provider.dart';

class UseTodo {
  void notify(BuildContext context) {
    Provider.of<TodoProvider>(context, listen: false).notify();
  }

  void addTodo(BuildContext context, Todo todo) {
    Provider.of<TodoProvider>(context, listen: false).todos.add(todo);

    notify(context);
  }

  void complete(BuildContext context, int index, bool value) {
    Provider.of<TodoProvider>(context, listen: false).todos[index].isComplete =
        value;

    notify(context);
  }

  void delete(BuildContext context, int index) {
    Provider.of<TodoProvider>(context, listen: false).todos.removeAt(index);
    notify(context);
  }
}
