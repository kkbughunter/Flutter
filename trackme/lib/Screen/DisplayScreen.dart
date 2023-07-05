import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({super.key});

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction"),
      ),
      body: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DisplayDataScreen();
  }
}

class DisplayDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('User1')
          .doc('child1')
          .collection('spend')
          .orderBy('date_time', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
          children: snapshot.data!.docs.map((document) {
            // String documentId = document.id;
            int amount = document['amount'];

            Timestamp timestamp = document['date_time'];
            DateTime datetime = timestamp.toDate();
            String formattedDate = DateFormat('yyyy-MM-dd').format(datetime);

            String remark = document['remark'];
            String subject = document['subject'];
            return ListTile(
              leading: Text(formattedDate),
              title: Text('Rs $amount ₹',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('For $subject   as $remark'),
            );
          }).toList(),
        );
      },
    );
  }
}
