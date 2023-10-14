import 'package:flutter/material.dart';

class ListTask {
  static Container myView(BuildContext context) {
    var cardlist = ['box1', 'box2', 'box3', "box4"];

    return Container(
      color: Colors.red,
      height: MediaQuery.of(context).size.height * 0.6978,
      child: ListView.builder(
        itemCount: cardlist.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(left: 4.0, right: 4.0, top: 8.0),
            child: SizedBox(
              height: 150.0,
              child: Card(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    cardlist[index], // Use the item from the cardlist
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
