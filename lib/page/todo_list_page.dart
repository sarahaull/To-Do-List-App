import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/todo_services.dart';
import '../widgets/todo_item.dart';
import 'history_page.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<TodoServices>().todos;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          "Daftar list Menu ",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const HistoryPage()),
              );
            },
          ),
        ],
      ),
      body: todos.isEmpty
          ? const Center(child: Text("Belum ada list"))
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (_, index) => TodoItem(todo: todos[index]),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.add),
        onPressed: () => _showAddTodoDialog(context),
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _descController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Row(
          children: const [
            Icon(Icons.cake, color: Colors.pinkAccent),
            SizedBox(width: 10),
            Text(
              "Tambah list",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Input Judul
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "Judul (contoh: Brownie)",
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Input Deskripsi
            TextField(
              controller: _descController,
              decoration: InputDecoration(
                labelText: "Deskripsi",
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Batal",
              style: TextStyle(color: Colors.pinkAccent),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pinkAccent,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              final title = _titleController.text.trim();
              final desc = _descController.text.trim();

              if (title.isEmpty || desc.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Harap isi semua kolom!"),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }

              // Menambahkan todo dengan judul + deskripsi
              context.read<TodoServices>().addTodo("$title - $desc");

              Navigator.pop(context); // tutup pop-up
            },
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }
}
