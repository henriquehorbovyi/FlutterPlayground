import 'package:flutter/material.dart';
import '../../../../shared/todo_model.dart';

class TodoItemWidget extends StatelessWidget {
  final TodoModel todo;

  const TodoItemWidget({this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      onTap: () {},
    );
  }
}
