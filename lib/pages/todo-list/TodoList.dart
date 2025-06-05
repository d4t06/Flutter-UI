import 'package:flutter/material.dart';
import 'package:my_app/models/Todo.dart';
import 'package:my_app/pages/dialog/MyDialog.dart';
import 'package:my_app/pages/todo-list/TodoProvider.dart';
import 'package:my_app/pages/todo-list/useTodo.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final UseTodo useTodo = UseTodo();

  void handleDeleteTodo(BuildContext ct, int index) async {
    final isConfirm = await MyDialog.show(
      context,
      "Delete",
      "This action can't be undone",
    );

    if (isConfirm) {
      useTodo.delete(ct, index);
    }
  }

  void handleCompleteTodo(BuildContext ct, int index, bool isComplete) {
    useTodo.complete(context, index, isComplete);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, store, child) {
        // if (!store.todos.isNotEmpty) {
        //   return Center(child: Text("No todo found"));
        // } else {
        return ListView.builder(
          itemCount: store.todos.length,
          padding: EdgeInsets.all(10),
          itemBuilder: (_, index) {
            final Todo item = store.todos[index];

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
                        ElevatedButton(
                          onPressed:
                              () => handleCompleteTodo(
                                context,
                                index,
                                !item.isComplete,
                              ),
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all(
                              const CircleBorder(),
                            ),
                          ),
                          child:
                              item.isComplete
                                  ? Icon(Icons.close)
                                  : Icon(Icons.check),
                        ),
                        ElevatedButton(
                          onPressed: () => handleDeleteTodo(context, index),
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all(
                              const CircleBorder(),
                            ),
                          ),
                          child: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      // },
    );
  }
}
