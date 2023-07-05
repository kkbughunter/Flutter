import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            Profile(),
            Expanded(
              child: DisplayIncomeDataScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

var total_amount_spend;
var total_income_amount;

int get_total_amount_spend() {
  total_amount_spend += 1;
  return total_amount_spend;
}

int get_total_income_amount() {
  total_income_amount += 1;
  return total_income_amount;
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('User1')
            .doc('child1')
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Text('No data available');
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;

          // Extract the required values from the data map
          final name = data['name'];
          final profileurl = data['profileurl'];
          total_amount_spend = data['total_amount_spend'];
          total_income_amount = data['total_income_amount'];
          return Card(
            margin: EdgeInsets.all(12),
            color: Color.fromARGB(255, 244, 234, 206),
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50.9),
                          child: Image.network(
                            profileurl,
                            height: 100,
                            width: 100,
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "Welcome " + " $name",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Card(
                        color: Color.fromARGB(255, 255, 182, 177),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Text(
                                "Spend ₹ $total_amount_spend",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        color: Color.fromARGB(255, 173, 231, 150),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Text(
                                "receive ₹ $total_income_amount",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}



class DisplayIncomeDataScreen extends StatelessWidget {
  void _deleteData(String documentId) {
    FirebaseFirestore.instance
        .collection('User1')
        .doc('child1')
        .collection('income')
        .doc(documentId)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('User1')
          .doc('child1')
          .collection('income')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
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
