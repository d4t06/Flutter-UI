import 'package:flutter/material.dart';
import 'package:my_app/models/Todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todos = [
    Todo(
      title: 'Buy milk',
      description: 'There is no milk left in the fridge!',
      isComplete: false,
    ),
    Todo(
      title: 'Do washer',
      description: 'There is no milk left in the fridge!',
      isComplete: true,
    ),
  ];

  void addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }

  void complete(int index, bool value) {
    todos[index].isComplete = value;
    notifyListeners();
  }

  void delete(int index) {
    todos.removeAt(index);
    notifyListeners();
  }

  void edit(int index, Todo data) {
    todos[index].title = data.title;
    todos[index].description = data.description;

    notifyListeners();
  }
}
