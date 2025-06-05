import 'package:my_app/models/Todo.dart';

class UseTodo {
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
    print(todo.toString());

    todos.add(todo);
  }

  void delete(int index) {
    print(index);
    print(todos.length);
    todos.removeAt(0);
  }
}
