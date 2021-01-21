import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
export '../widgets/Todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/todo.dart';

class TodoWidget extends StatefulWidget {
  Todo todo;

  TodoWidget(Todo todo) {
    this.todo = todo;
  }

  @override
  _TodoState createState() => _TodoState(todo);
}

class _TodoState extends State<TodoWidget> {
  Todo todo;

  _TodoState(Todo todo) {
    this.todo = todo;
  }

  toggleCompleted(TodoListModel todolist) {
    todolist.updateTodo(this.todo);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo.title,
              textScaleFactor: 1.5,
              softWrap: true,
            ),
            Text(
              todo.description,
              textScaleFactor: 1,
            )
          ],
        )),
        Container(
            decoration: BoxDecoration(
                color: todo.completed ? Colors.green : Colors.red),
            padding: EdgeInsets.all(5),
            child: Consumer<TodoListModel>(builder: (context, todolist, child) {
              return IconButton(
                  onPressed: () {
                    toggleCompleted(todolist);
                  },
                  icon: Icon(Icons.emoji_emotions));
            }))
      ],
    );
  }
}
