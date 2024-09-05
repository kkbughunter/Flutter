import 'package:flutter/material.dart';

class AddNewDevice extends StatefulWidget {
  const AddNewDevice({super.key});

  @override
  State<AddNewDevice> createState() => _AddNewDeviceState();
}

class _AddNewDeviceState extends State<AddNewDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Your Device"),
      ),
    );
  }
}
