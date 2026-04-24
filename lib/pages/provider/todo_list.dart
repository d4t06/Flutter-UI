import 'package:flutter/material.dart';
import 'package:my_app/models/Todo.dart';
import 'package:my_app/pages/dialog/MyDialog.dart';
import 'package:my_app/pages/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {
  final TodoProvider todoProvider;

  const TodoList({super.key, required this.todoProvider});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final _formGlobalKey = GlobalKey<FormState>();

  String todoTitle = '';
  String todoDescription = '';
  int todoIndex = -1;

  void handleDeleteTodo(BuildContext ct, int index) async {
    final isConfirm = await MyDialog.show(
      context,
      "Delete",
      "This action can't be undone",
    );

    if (isConfirm) {
      widget.todoProvider.delete(ct, index);
    }
  }

  void handleCompleteTodo(BuildContext ct, int index, bool isComplete) {
    widget.todoProvider.complete(context, index, isComplete);
  }

  void handleEditTodo(BuildContext ct) {
    if (_formGlobalKey.currentState!.validate()) {
      _formGlobalKey.currentState!.save();

      Todo newTodo = Todo(
        title: todoTitle,
        description: todoDescription,
        isComplete: false,
      );

      widget.todoProvider.edit(ct, todoIndex, newTodo);

      Navigator.of(context).pop();

      setState(() {
        todoTitle = '';
        todoDescription = '';
        todoIndex = -1;
      });
    }
  }

  ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    padding: EdgeInsets.zero,
    minimumSize: Size.square(40),
    shape: CircleBorder(),
  );

  OutlineInputBorder inputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black12,
      width: 4,
      style: BorderStyle.solid,
      strokeAlign: 1,
    ),
    borderRadius: BorderRadius.circular(12),
  );

  void openEditModal() async {
    if (todoIndex == -1 || todoTitle.isEmpty || todoDescription.isEmpty) return;

    await showDialog(
      context: context,
      builder:
          (ct) => AlertDialog(
            title: Text('Edit todo'),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),

            content: Form(
              key: _formGlobalKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  TextFormField(
                    initialValue: todoTitle,
                    decoration: InputDecoration(
                      label: Text("Title"),
                      border: inputBorder,
                    ),
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
                    initialValue: todoDescription,
                    decoration: InputDecoration(
                      label: Text("Description"),
                      border: inputBorder,
                    ),
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
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text("Close"),
              ),
              ElevatedButton(
                onPressed: () => handleEditTodo(context),
                child: Text('Save'),
              ),
            ],
          ),
    );
  }

  void handleOpenEditModal(int index) async {
    Todo target =
        Provider.of<TodoProvider>(context, listen: false).todos[index];

    setState(() {
      todoTitle = target.title;
      todoDescription = target.description;
      todoIndex = index;
    });
    openEditModal();
  }

  @override
  Widget build(BuildContext context) {
    final todos = widget.todoProvider.todos;

    if (todos.isEmpty) {
      return Center(child: Text("No todo found"));
    } else {
      return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (_, index) {
          final Todo item = todos[index];

          return Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Opacity(
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
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      ElevatedButton(
                        onPressed:
                            () => handleCompleteTodo(
                              context,
                              index,
                              !item.isComplete,
                            ),
                        style: buttonStyle,
                        child:
                            item.isComplete
                                ? Icon(Icons.close)
                                : Icon(Icons.check),
                      ),

                      ElevatedButton(
                        onPressed: () => handleOpenEditModal(index),
                        style: buttonStyle,
                        child: Icon(Icons.edit),
                      ),
                      ElevatedButton(
                        onPressed: () => handleDeleteTodo(context, index),
                        style: buttonStyle,
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
    }
  }
}
