import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:get/get.dart';

import 'Screen/DashboardScreeb.dart';
import 'Screen/DisplayScreen.dart';
import 'Screen/SpendScreen.dart';
import 'Screen/AccountScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    // title: 'Track mee App',
    theme: ThemeData.light(), // Set the light theme as the default
    // darkTheme: darkTheme, // Set the dark theme
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  List<Widget> _screens = [
    DashboardScreen(),
    DisplayScreen(),
    ADDScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Trackmee',
      home: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
            ],
          ),
          child: SafeArea(
            child: GNav(
              padding: EdgeInsets.all(12),
              selectedIndex: _currentIndex,
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              onTabChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Dashboard',
                  backgroundColor: const Color.fromARGB(255, 101, 192, 238),
                ),
                GButton(
                  icon: LineIcons.list,
                  text: 'Display',
                  backgroundColor: const Color.fromARGB(255, 247, 130, 122),
                ),
                GButton(
                  icon: LineIcons.addToShoppingCart,
                  text: 'Add   ',
                  backgroundColor: Color.fromARGB(255, 225, 238, 111),
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Account',
                  backgroundColor: Color.fromARGB(255, 142, 239, 127),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
