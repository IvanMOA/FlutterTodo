export '../widgets/Todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/Todo.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';
import 'package:flutter/src/widgets/navigator.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var todolist = context.watch<TodoListModel>();
    var todoWidgets = todolist.todos.map((todo) => TodoWidget(Todo(
        todo.id, todo.title, todo.description, todo.author, todo.completed)));

    return Column(
      children: [
        // Section to display some info
        Container(
          height: size.height / 4,
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Text("asdRutaPro");
                      }));
                    },
                  )
                ],
              ),
              // Actual todo list
              ...todoWidgets
              // Consumer<TodoListModel>(builder: (context, todolist, child) {
              //   Todo atodo = todolist.getById(0);
              //   return TodoWidget(Todo(atodo.id, atodo.title, atodo.description,
              //       atodo.author, atodo.completed));
              // }),
            ],
          ),
        ))
      ],
    );
  }
}
