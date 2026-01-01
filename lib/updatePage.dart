import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'TodoProvider.dart';

class UpdatePage extends StatefulWidget {
  final int index;

  const UpdatePage({super.key, required this.index});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);
    _controller =
        TextEditingController(text: todoProvider.todolist[widget.index]);
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Görevi Güncelle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Yeni görev",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                todoProvider.guncelle(widget.index, _controller.text,);
                Navigator.pop(context);
              },
              child: const Text("Güncelle"),
            ),
          ],
        ),
      ),
    );
  }
}
