import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/todo_services.dart';
import 'page/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => TodoServices(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cake To-do',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const HomePage(),
    );
  }
}
