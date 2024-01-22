import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textController = TextEditingController();
  List<String> dataList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Entry App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Enter your Data:"),
            TextField(
              controller: _textController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  dataList.add(_textController.text);
                  _textController.clear();
                });
              },
              child: const Text("Add"),
            ),
            const SizedBox(height: 20),
            const Text(
              "Entered Data:",
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _showUpdateDialog(index);
                    },
                    child: Card(
                      color: Colors.grey.withOpacity(0.1),
                      child: ListTile(
                        title: Text(dataList[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _removeItem(index);
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showUpdateDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController _updateController =
            TextEditingController(text: dataList[index]);

        return AlertDialog(
          title: const Text("Update Data"),
          content: TextField(
            controller: _updateController,
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  dataList[index] = _updateController.text;
                  Navigator.pop(context);
                });
              },
              child:const Text("Submit"),
            ),
          ],
        );
      },
    );
  }

  void _removeItem(int index) {
    setState(() {
      dataList.removeAt(index);
    });
  }
}
