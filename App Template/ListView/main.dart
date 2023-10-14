import 'package:flutter/material.dart';
import 'package:kktask/screens/group_task.dart';
import 'package:kktask/screens/list_task.dart';

void main() {
  runApp(
    MaterialApp(
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("kkTask")),
      body: Column(
        children: [
          GroupTask.myView(context),
          ListTask.myView(context),
        ],
      ),
    );
  }
}
