import 'package:flutter/material.dart';

class Director extends StatefulWidget {
  const Director({Key? key}) : super(key: key);

  @override
  State<Director> createState() => _DirectorState();
}

class _DirectorState extends State<Director> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Bot"),
        backgroundColor: Colors.green.shade200,
      ),
      body: Column(
        children: const [
          Text("Chat Bot"),
        ],
      ),
    );
  }
}
