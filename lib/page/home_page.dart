import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/todo_services.dart';
import 'todo_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Fungsi untuk format harga ke Rupiah
  String formatRupiah(double price) {
    return 'Rp ${price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 97, 150),
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            "Cake list",
            style: TextStyle(
              color: Colors.pinkAccent,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        actions: const [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.pinkAccent),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search product",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.tune, color: Colors.pinkAccent),
                  onPressed: () {},
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Menu",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _buildCategoryChip("All", true),
                const SizedBox(width: 8),
                _buildCategoryChip("Dessert", false),
              ],
            ),
            const SizedBox(height: 20),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.50,
              children: [
                _buildProductCard(
                  "Macarons",
                  formatRupiah(90000) + " /kg",
                  Colors.pink[100]!,
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZVNbWnjepchFjDolc8ftVc3tXmRE1qho8Pg&s",
                ),
                _buildProductCard(
                  "Cheesecake",
                  formatRupiah(49900) + " /pc",
                  Colors.yellow[100]!,
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRc8PhjeuJaxebmCBmh5mZrO4vEYOz9wGBweA&s",
                ),
                _buildProductCard(
                  "Cupcake",
                  formatRupiah(29900) + " /pc",
                  Colors.grey[200]!,
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTq1S1PJ23pteBoMXfSW8uYNsFm2E-Zf1aIFA&s",
                ),
                _buildProductCard(
                  "Cookies",
                  formatRupiah(79900) + " /kg",
                  Colors.brown[100]!,
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc-noyFHG4_GxKMmYVwk151xHSpLYaF_yUAw&s",
                ),
                _buildProductCard(
                  "Brownie",
                  formatRupiah(39900) + " /pc",
                  Colors.brown[200]!,
                  "https://beyondfrosting.com/wp-content/uploads/2022/07/Cocoa-Powder-Brownies-3960.jpg",
                ),
                _buildProductCard(
                  "Waffle",
                  formatRupiah(59900) + " /pc",
                  Colors.orange[100]!,
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7iPnpFBrVzp8w_K__ns10eGFmwPOIpsULCA&s",
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () => _showAddTodoDialog(context),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.pinkAccent : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildProductCard(
    String name,
    String price,
    Color bgColor,
    String imageUrl,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.favorite_border, color: Colors.grey[700]),
          ),
          const Spacer(),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imageUrl, height: 250, fit: BoxFit.cover),
            ),
          ),
          const Spacer(),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(price, style: const TextStyle(color: Colors.black54)),
          const SizedBox(height: 6),
          Align(
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              radius: 16,
              child: const Icon(Icons.add, color: Colors.white, size: 18),
            ),
          ),
        ],
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
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: "Judul (contoh: Brownie)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(
                labelText: "Deskripsi",
                border: OutlineInputBorder(),
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

              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TodoListPage()),
              );
            },
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }
}
