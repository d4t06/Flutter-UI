import 'package:flutter/material.dart';
import 'package:my_app/models/Todo.dart';
import 'package:my_app/pages/dialog/MyDialog.dart';

class TodoItem extends StatefulWidget {
  final Todo item;
  final int index;
  final Function delete;
  final Function(Todo todo) edit;
  final Function(bool value) complete;

  const TodoItem({
    super.key,
    required this.item,
    required this.index,
    required this.delete,
    required this.edit,
    required this.complete,
  });

  @override
  State<StatefulWidget> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  final _formGlobalKey = GlobalKey<FormState>();

  String todoTitle = '';
  String todoDescription = '';

  @override
  void initState() {
    super.initState();

    todoTitle = widget.item.title;
    todoDescription = widget.item.description;
  }

  void handleDeleteTodo(BuildContext ct, int index) async {
    final isConfirm = await MyDialog.show(
      context,
      "Delete",
      "This action can't be undone",
    );

    if (isConfirm) {
      // widget.todoProvider.delete(ct, index);
    }
  }

  void handleCompleteTodo(bool isComplete) {
    widget.complete(isComplete);
  }

  void handleEditTodo() {
    if (_formGlobalKey.currentState!.validate()) {
      _formGlobalKey.currentState!.save();

      Todo newTodo = Todo(
        title: todoTitle,
        description: todoDescription,
        isComplete: false,
      );

      widget.edit(newTodo);

      Navigator.of(context).pop();
    }
  }

  void openEditModal() async {
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
                    initialValue: todoDescription,
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
                onPressed: () => handleEditTodo(),
                child: Text('Save'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Opacity(
              opacity: widget.item.isComplete ? .6 : 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.item.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      decoration:
                          widget.item.isComplete
                              ? TextDecoration.lineThrough
                              : null,
                    ),
                  ),
                  Text(widget.item.description),
                ],
              ),
            ),

            SizedBox(height: 8),

            Row(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () => handleCompleteTodo(!widget.item.isComplete),
                  child:
                      widget.item.isComplete
                          ? Icon(Icons.close)
                          : Icon(Icons.check),
                ),

                ElevatedButton(
                  onPressed: () => openEditModal(),
                  child: Icon(Icons.edit),
                ),

                ElevatedButton(
                  onPressed: () => widget.delete(),
                  child: Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
