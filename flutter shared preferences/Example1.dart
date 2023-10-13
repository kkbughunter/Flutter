import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String data = "hello";
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      data = (prefs.getString("data") ?? "hello");
      textController.text = data; 
    });
  }


  void handleButtonPress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      data = textController.text; // read the content in the input field.
      prefs.setString("data", textController.text);  // set the data to shared preferences.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPreferences Example"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("hello $data"),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(controller: textController),
              ),
              ElevatedButton(
                onPressed: handleButtonPress,
                child: const Text("Update Data"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
