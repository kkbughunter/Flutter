import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'firebase_options.dart'; // Ensure you have this file correctly set up with your Firebase config

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Database Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _messagesRef = FirebaseDatabase.instance.ref('messages');
  final _userInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Database Example'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _userInputController,
            decoration: const InputDecoration(
              labelText: 'Enter data to insert',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_userInputController.text.isNotEmpty) {
                _insertData(_userInputController.text);
                _userInputController.clear();
              }
            },
            child: const Text('Insert Data'),
          ),
          Flexible(
            child: FirebaseAnimatedList(
              key: const ValueKey<int>(0), // Unique key for the list
              query: _messagesRef,
              itemBuilder: (context, snapshot, animation, index) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: ListTile(
                    trailing: IconButton(
                      onPressed: () => _deleteMessage(snapshot),
                      icon: const Icon(Icons.delete),
                    ),
                    title: Text('$index: ${snapshot.value}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _insertData(String data) async {
    try {
      final newMessageRef = _messagesRef.push();
      await newMessageRef.set(data);
    } on FirebaseException catch (e) {
      print("ERROR: ${e.message}");
    }
  }

  Future<void> _deleteMessage(DataSnapshot snapshot) async {
    final messageRef = _messagesRef.child(snapshot.key!);
    await messageRef.remove();
  }
}
