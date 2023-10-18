import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'services/FirebaseConfig.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseRealtimeVariable());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Database Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DatabaseReference databaseReference = FirebaseDatabase.instance
      .reference(); // Reference to the root of your database

  void readDataFromDatabase() async {
    try {
      DatabaseEvent event = await databaseReference.once(); // Fetch data once
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        // Data is available
        var data = snapshot.value;
        // Use the data as needed
        print("Data from database: $data");
      } else {
        // Data is null
        print("No data available in the database.");
      }
    } catch (error) {
      print("Error reading data from the database: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    // You can call readDataFromDatabase() here or from any other suitable place in your app
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Database Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            readDataFromDatabase();
          },
          child: Text('Read Data from Database'),
        ),
      ),
    );
  }
}
