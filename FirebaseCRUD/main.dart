import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      databaseURL:
          "https://xyz-default-rtdb.asia-southeast1.firebasedatabase.app/",  //  Add the RTDB Database URL
      apiKey: "xyz",
      authDomain: "xyz.firebaseapp.com",
      projectId: "xyz",
      storageBucket: "xyz.appspot.com",
      messagingSenderId: "xyz",
      appId: "xyz",
    ),
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final DatabaseReference ref = FirebaseDatabase.instance.ref('nameList');

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'ID'),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Your name'),
            ),
            ElevatedButton(
              onPressed: () =>
                  _addData(_idController.text, _nameController.text),
              child: Text('Add Task'),
            ),
            ElevatedButton(
              onPressed: listenForData,
              child: Text('Listen for Data'),
            ),
            ElevatedButton(
              onPressed: readDataOnce,
              child: Text('Read Data Once'),
            ),
            ElevatedButton(
              onPressed: () => _deleteData(_idController.text),
              child: Text('Delete Task'),
            ),
            ElevatedButton(
              onPressed: () =>
                  _updateData(_idController.text, _nameController.text),
              child: Text('Update Task'),
            ),
          ],
        ),
      ),
    );
  }

  void _addData(String id, String name) {
    ref.child(id).set(name);
    _nameController.clear();
    _idController.clear();
  }

  void listenForData() {
    ref.onValue.listen((event) {
      var snapshot = event.snapshot;
      var data = snapshot.value;

      if (data is List) {
        List<dynamic> dataList = data as List<dynamic>;
        for (int index = 0; index < dataList.length; index++) {
          var value = dataList[index];
          if (value != null) {
            print('ID: $index, Name: $value');
          }
        }
      } else if (data is Map) {
        Map<dynamic, dynamic> dataMap = data as Map<dynamic, dynamic>;
        dataMap.forEach((key, value) {
          print('ID: $key, Name: $value');
        });
      } else {
        print('No data available');
      }
    }, onError: (Object error) {
      print('Error listening for data: $error');
    });
  }

  Future<void> readDataOnce() async {
    try {
      DataSnapshot snapshot = await ref.get();
      print(snapshot.value);
      if (snapshot.value is List) {
        List<dynamic> dataList = snapshot.value as List<dynamic>;
        for (int index = 0; index < dataList.length; index++) {
          var data = dataList[index];
          if (data != null) {
            print('ID: $index, Name: $data');
          }
        }
      } else if (snapshot.value is Map) {
        Map<dynamic, dynamic> dataMap = snapshot.value as Map<dynamic, dynamic>;
        dataMap.forEach((key, value) {
          print('ID: $key, Name: $value');
        });
      } else {
        print('No data available');
      }
    } catch (e) {
      print('Error reading data: $e');
    }
  }

  void _updateData(String id, String name) {
    ref.child(id).set(name);
  }

  void _deleteData(String id) {
    print(id);
    ref.child(id).remove();
  }
}
