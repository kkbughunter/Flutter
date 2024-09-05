import 'package:flutter/material.dart';
import 'package:iet_control/screens/Home/AddNewDevice/AddNewDevice.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar.large(
          leading: Center(
            child: Text(
              "32°C",
              style: TextStyle(fontSize: 22),
            ),
          ),
          title: const Text('Large App Bar'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_circle),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddNewDevice()));
              },
            ),
          ],
          expandedHeight: 250,
          backgroundColor: Colors.lightBlue[100],
        ),

        // Just some content big enough to have something to scroll.
        SliverToBoxAdapter(
          child: Column(
            children: [
              Text(
                '1',
                style: TextStyle(fontSize: 20),
              ),
              Text('2'),
              Text('3'),
            ],
          ),
        ),
      ],
    );
  }
}
