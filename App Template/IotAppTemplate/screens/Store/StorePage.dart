import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final FocusNode _focusNode = FocusNode();
  bool _showBackArrow = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _showBackArrow = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _showBackArrow
            ? IconButton(
                onPressed: () {
                  _focusNode.unfocus();
                  setState(() {
                    _showBackArrow = false;
                  });
                },
                icon: Icon(Icons.arrow_back_rounded),
              )
            : null,
        title: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 40,
                child: TextField(
                  focusNode: _focusNode,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: 'Search item',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
                width:
                    8), // Optional spacing between the text field and the button
            OutlinedButton(
              onPressed: () {
                // Define your search action here
              },
              child: Text("Search"),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Store Page Content'),
      ),
    );
  }
}
