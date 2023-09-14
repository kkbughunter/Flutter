import 'package:flutter/material.dart';

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: Colors.white,
            secondary: Color.fromRGBO(184, 23, 12, 1),
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                "IotEcoTech         ",
                style: TextStyle(
                  color: Color.fromRGBO(42, 47, 143, 1),
                ),
              ),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.home,
                color: Color.fromRGBO(42, 47, 143, 1),
              ), // Add the back arrow icon here
              onPressed: () {
                Navigator.of(context).pop(); // Handle navigation on arrow press
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.more_vert, 
                  color: Colors.black, 
                ),
                onPressed: () {
                  // Handle the action when the icon is pressed
                },
              ),
            ],
          ),
          body: const Center(
            child: Text("Hello we are Iot-Eco Technology."),
          ),
        ));
  }
}
