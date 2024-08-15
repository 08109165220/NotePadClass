import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../models/todos.dart';
import '../todoItem.dart';

class Todos extends StatelessWidget {
  const Todos({super.key});

  @override
  Widget build(BuildContext context) {
    final todoList = Todo.todos();
    final _searchcontroller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.8),
        actions: [
          Icon(
            Ionicons.ellipse,
            size: 12,
            color: Colors.white,
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'To-dos',
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 36),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Search Box
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade700),
                    color: Colors.grey.shade900,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search_rounded,
                          color: Colors.grey,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.grey),
                            controller: _searchcontroller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Search Notes',
                              labelStyle:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView(
                children: [
                  for( Todo todo in todoList )
                    Todoitem(todos: todo,)
                ],
              )

            ],
          ),
        ),
      ),
    );
  }




}
