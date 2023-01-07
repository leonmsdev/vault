import 'package:flutter/material.dart';

class KeyScreen extends StatefulWidget {
  final int id;
  const KeyScreen({required this.id, Key? key}) : super(key: key);

  @override
  State<KeyScreen> createState() => _KeyScreenState();
}

class _KeyScreenState extends State<KeyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Product Detail : ${widget.id}')],
        ),
      ),
    );
  }
}
