import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/todo_services.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      child: ListTile(
        leading: Checkbox(
          value: todo.isDone,
          onChanged: (value) {
            context.read<TodoServices>().toggleTodoStatus(todo);
          },
          activeColor: Colors.pinkAccent,
        ),
        title: Text(
          todo.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
            color: todo.isDone ? Colors.grey[700] : Colors.black87,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.redAccent),
          onPressed: () {
            context.read<TodoServices>().removeTodo(todo);
          },
        ),
      ),
    );
  }
}
