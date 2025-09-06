import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/todo_services.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final history = context.watch<TodoServices>().history;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          "History List Menu",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: history.isEmpty
          ? const Center(
              child: Text("Belum ada history", style: TextStyle(fontSize: 18)),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: history.length,
              itemBuilder: (_, index) {
                final todo = history[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  child: ListTile(
                    leading: Icon(
                      todo.isDeleted
                          ? Icons.delete_forever
                          : todo.isDone
                          ? Icons.check_circle
                          : Icons.cake,
                      color: todo.isDeleted
                          ? Colors.redAccent
                          : todo.isDone
                          ? Colors.green
                          : Colors.pinkAccent,
                      size: 28,
                    ),
                    title: Text(
                      todo.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        decoration: todo.isDone
                            ? TextDecoration.lineThrough
                            : null,
                        color: todo.isDeleted
                            ? Colors.grey
                            : todo.isDone
                            ? Colors.black54
                            : Colors.black87,
                      ),
                    ),
                    trailing: Text(
                      todo.isDeleted
                          ? "Dihapus"
                          : todo.isDone
                          ? "Selesai"
                          : "Aktif",
                      style: TextStyle(
                        color: todo.isDeleted
                            ? Colors.redAccent
                            : todo.isDone
                            ? Colors.green
                            : Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
