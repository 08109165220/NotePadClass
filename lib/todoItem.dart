import 'package:flutter/material.dart';

import 'models/todos.dart';


class Todoitem extends StatelessWidget {
  final Todo todos;

  const Todoitem({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Colors.black.withOpacity(0.8),
      child: ListTile(
        onTap: () {},
        leading: Icon(
          todos.isDone?
          Icons.radio_button_on: Icons.radio_button_off,
          color: Colors.grey,
        ),
        title: Text(
          todos.todo!,
          style: TextStyle(
              decoration: todos.isDone? TextDecoration.lineThrough : null,
              color: Colors.grey.shade700,
              fontSize: 18),
        ),
        trailing: Container(
            margin: EdgeInsets.all(8),
            color: Colors.red,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
        ),
      ),
    );
  }
}
