import 'package:flutter/material.dart';

class Automatepage extends StatefulWidget {
  const Automatepage({super.key});

  @override
  State<Automatepage> createState() => _AutomatepageState();
}

class _AutomatepageState extends State<Automatepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Automate Me'),
      ),
    );
  }
}
