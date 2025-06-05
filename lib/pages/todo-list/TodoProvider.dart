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

  void notify() {
    notifyListeners();
  }
}
