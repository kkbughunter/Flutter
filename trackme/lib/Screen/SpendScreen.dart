import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ADDScreen extends StatefulWidget {
  const ADDScreen({Key? key}) : super(key: key);

  @override
  _ADDScreenState createState() => _ADDScreenState();
}

class _ADDScreenState extends State<ADDScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Spend"),
      ),
      body: Column(
        children: [
          Expanded(child: SpendScreen()), // spend
          Expanded(child: IncomeScreen()), // income
        ],
      ),
    );
  }
}

class SpendScreen extends StatefulWidget {
  const SpendScreen({Key? key}) : super(key: key);

  @override
  _SpendScreenState createState() => _SpendScreenState();
}

class _SpendScreenState extends State<SpendScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _subjectController = TextEditingController();
  final _remarkController = TextEditingController();

  int totalSpend = 0; // Variable to store the total spend value

  @override
  void initState() {
    super.initState();
    fetchTotalSpend(); // Fetch the total spend value on initialization
  }

  void fetchTotalSpend() {
    FirebaseFirestore.instance
        .collection('User1')
        .doc('child1')
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          totalSpend = snapshot.data()?['total_spend'] ?? 0;
        });
      }
    });
  }

  void setTotalSpend(int value) {
    FirebaseFirestore.instance
        .collection('User1')
        .doc('child1')
        .update({'total_spend': value}).then((_) {
      setState(() {
        totalSpend = value;
      });
    }).catchError((error) {
      // Handle error if setting the value fails
      print('Error setting total spend: $error');
    });
  }

// Add with old Amount.
  void setTotalSpendAmount(int value) {
    FirebaseFirestore.instance
        .collection('User1')
        .doc('child1')
        .get()
        .then((DocumentSnapshot snapshot) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      int oldTotalSpend = data['total_amount_spend'] ?? 0;
      int newTotalSpend = oldTotalSpend + value;

      FirebaseFirestore.instance
          .collection('User1')
          .doc('child1')
          .update({'total_amount_spend': newTotalSpend}).then((_) {
        setState(() {
          totalSpend = newTotalSpend;
        });
      }).catchError((error) {
        // Handle error if setting the value fails
        print('Error setting total spend: $error');
      });
    }).catchError((error) {
      // Handle error if retrieving the old value fails
      print('Error retrieving old total spend: $error');
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Get the values from the input fields
      int amount = int.parse(_amountController.text);
      String subject = _subjectController.text;
      String remark = _remarkController.text;
      totalSpend += 1;
      setTotalSpend(totalSpend);
      setTotalSpendAmount(amount);
      // Create a new document in the 'spend' collection
      FirebaseFirestore.instance
          .collection('User1')
          .doc('child1')
          .collection('spend')
          .doc(totalSpend.toString())
          .set({
        'amount': amount,
        'date_time': Timestamp.now(),
        'subject': subject,
        'remark': remark,
      });

      // Clear the input fields after submitting
      _amountController.clear();
      _subjectController.clear();
      _remarkController.clear();
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _subjectController.dispose();
    _remarkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the amount';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
              ),
              TextFormField(
                controller: _subjectController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the subject';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Subject',
                ),
              ),
              TextFormField(
                controller: _remarkController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the remark';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Remark',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add'),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  _IncomeScreenState createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _subjectController = TextEditingController();
  final _remarkController = TextEditingController();

  int totalIncome = 0; // Variable to store the total spend value

  @override
  void initState() {
    super.initState();
    fetchTotalincome(); // Fetch the total spend value on initialization
  }

  void fetchTotalincome() {
    FirebaseFirestore.instance
        .collection('User1')
        .doc('child1')
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          totalIncome = snapshot.data()?['total_income'] ?? 0;
        });
      }
    });
  }

  void setTotalIncome(int value) {
    FirebaseFirestore.instance
        .collection('User1')
        .doc('child1')
        .update({'total_income': value}).then((_) {
      setState(() {
        totalIncome = value;
      });
    }).catchError((error) {
      // Handle error if setting the value fails
      print('Error setting total spend: $error');
    });
  }

// Add with old value
  void setTotalincomeAmount(int value) {
    FirebaseFirestore.instance
        .collection('User1')
        .doc('child1')
        .get()
        .then((DocumentSnapshot snapshot) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      int oldTotalSpend = data['total_income_amount'] ?? 0;
      int newTotalSpend = oldTotalSpend + value;

      FirebaseFirestore.instance
          .collection('User1')
          .doc('child1')
          .update({'total_income_amount': newTotalSpend})
          .then((_) {})
          .catchError((error) {
            // Handle error if setting the value fails
            print('Error setting total spend: $error');
          });
    }).catchError((error) {
      // Handle error if retrieving the old value fails
      print('Error retrieving old total spend: $error');
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Get the values from the input fields
      int amount = int.parse(_amountController.text);
      String subject = _subjectController.text;
      String remark = _remarkController.text;
      totalIncome += 1;
      setTotalIncome(totalIncome);
      setTotalincomeAmount(amount);
      // Create a new document in the 'spend' collection
      FirebaseFirestore.instance
          .collection('User1')
          .doc('child1')
          .collection('income')
          .doc(totalIncome.toString())
          .set({
        'amount': amount,
        'date_time': Timestamp.now(),
        'subject': subject,
        'remark': remark,
      });

      // Clear the input fields after submitting
      _amountController.clear();
      _subjectController.clear();
      _remarkController.clear();
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _subjectController.dispose();
    _remarkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the amount';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
              ),
              TextFormField(
                controller: _subjectController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the subject';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Subject',
                ),
              ),
              TextFormField(
                controller: _remarkController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the remark';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Remark',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add'),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
