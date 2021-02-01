export '../widgets/Todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todolist/src/models/auth.dart';
import '../widgets/Todo.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final TodoListModel todolist = Provider.of<TodoListModel>(context);
    final Auth auth = Provider.of<Auth>(context);
    var todoWidgets = todolist.todos.map((todo) => TodoWidget(Todo(
        todo.id, todo.title, todo.description, todo.author, todo.completed)));

    return Column(
      children: [
        // Section to display some info
        Container(
          height: size.height / 4,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(auth.welcomeMessage,
                      textScaleFactor: 1.5,
                      style: TextStyle(color: Colors.white)),
                  IconButton(
                      icon: Icon(Icons.logout),
                      color: Colors.white,
                      onPressed: () async {
                        await auth.signOut();
                        // Navigator.pushNamed(context, '/login');
                      })
                ],
              )
            ],
          ),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          // White section
          child: Column(
            children: [
              // Title and add todo button
              Row(
                children: [
                  Text(
                    "Todo list",
                    textScaleFactor: 1.75,
                  ),
                  IconButton(
                      icon: Icon(Icons.add),
                      tooltip: "Add a todo",
                      onPressed: auth.signOut)
                ],
              ),
              // Actual todo list
              ...todoWidgets
            ],
          ),
        ))
      ],
    );
  }
}
