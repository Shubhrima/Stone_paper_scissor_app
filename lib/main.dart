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
  int number = 1;
  int score=0;

  Icon red() {
    print('lost');
    return Icon(Icons.adjust_outlined, color: Colors.red);
  }

  Icon yellow() {
    print('draw');
    return Icon(Icons.adjust_outlined, color: Colors.yellow);
  }

  Icon green() {
    score++;
    print('won');
    return Icon(Icons.adjust_outlined, color: Colors.green);
  }

  List<Icon> scoreKeeper = [
    Icon(Icons.adjust_outlined, color: Colors.grey),
   /* Icon(Icons.adjust_outlined, color: Colors.grey),
    Icon(Icons.adjust_outlined, color: Colors.grey),
    Icon(Icons.adjust_outlined, color: Colors.grey),
    Icon(Icons.adjust_outlined, color: Colors.grey),
    Icon(Icons.adjust_outlined, color: Colors.grey),
    Icon(Icons.adjust_outlined, color: Colors.grey),
    Icon(Icons.adjust_outlined, color: Colors.grey),
    Icon(Icons.adjust_outlined, color: Colors.grey),
    Icon(Icons.adjust_outlined, color: Colors.grey),*/
  ];
  void changeHand() {
    if (number < 10) {
      setState(() {
        number++;
        //(0-2)+1
        seconduser = Random().nextInt(3) + 1;
        String play = ' ';
      });
      if (seconduser == firstuser) {
        yellow();
      } else if (firstuser == 1) {
        if (seconduser == 2) {
          red();
        } else {
          green();
        }
      } else if (firstuser == 2) {
        if (seconduser == 3) {
          red();
        } else {
          green();
        }
      } else if (firstuser == 3) {
        if (seconduser == 1) {
          red();
        } else {
          green();
        }
      }
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Score"),
          content: Text("You scored $score"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text("okay"),
            ),
          ],
        ),
      );
      print('Start New Game');
      number =0;
      changeHand();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
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
        Text(
          'Round $number',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
            fontSize: 20,
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: OutlineButton(
                  onPressed: () {
                    firstuser = 1;
                    changeHand();
                  },
                  child: Text('✊'),
                ),
              ),
              Expanded(
                child: OutlineButton(
                  onPressed: () {
                    firstuser = 2;
                    changeHand();
                  },
                  child: Text('🤚'),
                ),
              ),
              Expanded(
                child: OutlineButton(
                  onPressed: () {
                    firstuser = 3;
                    changeHand();
                  },
                  child: Text('✌'),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Image.asset('images/item$firstuser.png',
              semanticLabel: 'Player 1'),
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
        Row(
          children: scoreKeeper,
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: OutlineButton(
                onPressed: () {
                  number =0;
                  score=0;
                  changeHand();

                },
                child: Text('New Game'),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
