import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Stone Paper Scissor',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int firstuser = 1;
  int seconduser = 2;

  void changeDiceFace() {
    setState(() {
      firstuser = Random().nextInt(3) + 1; //(0-2)+1
      seconduser = Random().nextInt(3) + 1;
      String play= ' ';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                'Stone✊ Paper🤚 Scissors✌!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                changeDiceFace();
              },
              child: Image.asset('images/item$firstuser.png',
                  semanticLabel: 'Player 1'),
            ),
          ),
          Expanded(
            child: Text(
              'Player 1',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Image.asset('images/item$seconduser.png',
                semanticLabel: 'Player 2'),
          ),
          Expanded(
            child: Text(
              'Shubhrima🦋',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
