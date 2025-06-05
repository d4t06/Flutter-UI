import 'package:flutter/material.dart';
import 'package:my_app/models/Todo.dart';
import 'package:my_app/pages/dialog/MyDialog.dart';
import 'package:my_app/pages/todo-list/useTodo.dart';

class TodoList extends StatefulWidget {
  const TodoList({required this.todos, super.key});

  final List<Todo> todos;

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final UseTodo useTodo = UseTodo();

  void handleDeleteTodo(int index) async {
    final isConfirm = await MyDialog.show(context, "Title here", "body here");

    if (isConfirm) {
      setState(() {
        useTodo.delete(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todos.length,
      padding: EdgeInsets.all(10),
      itemBuilder: (_, index) {
        final Todo item = widget.todos[index];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2,
                  blurStyle: BlurStyle.outer,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: item.isComplete ? .6 : 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          decoration:
                              item.isComplete
                                  ? TextDecoration.lineThrough
                                  : null,
                        ),
                      ),
                      Text(item.description),
                    ],
                  ),
                ),
                Row(
                  children: [
                    TextButton(onPressed: () {}, child: Text("Complete")),
                    ElevatedButton(
                      onPressed: () => handleDeleteTodo(index),
                      child: Icon(Icons.delete),
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all(const CircleBorder()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
