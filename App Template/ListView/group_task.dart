import 'package:flutter/material.dart';

class GroupTask {
  static Container myView(BuildContext context) {
    var cardlist = ['box1', 'box2', 'box3', "box4"];

    return Container(
      color: Colors.blue,
      height: MediaQuery.of(context).size.height * 0.20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cardlist.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: 150.0,
              child: Card(
                color: Colors.green,
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
