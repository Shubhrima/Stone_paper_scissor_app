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
  int number = 0;
  int score1 = 0;
  int scoreS = 0;

  List<Icon> scoreKeeper = [];

  Icon red() {
    print(number);
    print('lost');
    scoreS++;
    scoreKeeper.add(Icon(Icons.adjust_outlined, color: Colors.red));
  }

  Icon yellow() {
    print(number);
    print('draw');
    scoreKeeper.add(Icon(Icons.adjust_outlined, color: Colors.yellow));
  }

  Icon green() {
    print(number);
    score1++;
    print('won');
    scoreKeeper.add(Icon(Icons.adjust_outlined, color: Colors.green));
  }

  void changeHand() {
    if (number < 9) {
      setState(() {
        number++;
        //(0-2)+1
        seconduser = Random().nextInt(3) + 1;
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
      if (score1 > scoreS) {
        var analysis = 'Hurray!!! You Won';
        print(analysis);
      } else if (score1 < scoreS) {
        var analysis = 'Ooops! You lost the game.';
        print(analysis);
      } else {
        var analysis = 'It is a draw match!';
        print(analysis);
      }

      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            "Score",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content:
              Text("Your score: $score1. \nShubhrima's score: $scoreS. \n"),
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
      number = 0;
      changeHand();
      scoreKeeper.removeRange(0,scoreKeeper.length-1);
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

      ]),
    );
  }
}
