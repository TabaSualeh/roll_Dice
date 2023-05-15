import 'dart:math';
import 'package:dice_roll/button.dart';
import 'package:flutter/material.dart';

class rollDice extends StatefulWidget {
  const rollDice({Key? key}) : super(key: key);

  @override
  State<rollDice> createState() => _rollDiceState();
}

class _rollDiceState extends State<rollDice> {
  String img1 = "assets/dice1.png";
  String img2 = "assets/dice1.png";
  int counter = 0;
  bool isCount = true;
  int score = 0;
  int turn = 10;

  // Check If user turns are not greater than 10
  bool checkCount(int count) {
    if (count > 9) {
      isCount = false;
    } else {
      isCount = true;
    }
    return isCount;
  }

  void diceroll() {
    if (checkCount(counter) == true) {
      turn--;
      counter++;
      int num1 = Random().nextInt(6) + 1;
      int num2 = Random().nextInt(6) + 1;
      if (num1 == 1 && num2 == 1 || num1 == 6 && num2 == 6) {
        score = score + 10;
      }
      setState(() {
        img1 = "assets/dice$num1.png";
        img2 = "assets/dice$num2.png";
        score;
      });
    }
  }

  void reset() {
    setState(() {
      img1 = "assets/dice1.png";
      img2 = "assets/dice1.png";
      counter = 0;
      score = 0;
      turn = 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Align(
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Score : $score",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "Turn's Left : $turn",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              img1,
              width: 150,
              height: 150,
            ),
            Image.asset(
              img2,
              width: 150,
              height: 150,
            ),
          ],
        ),
        MyButton(
          btnName: "Roll",
          fontsize: 30,
          isEnabled: checkCount(counter), // added
          callback: () {
            diceroll();
          },
          // callback: () {
          //   diceroll();
          // }
        ),
        MyButton(
          btnName: "Reset",
          callback: () {
            reset();
          },
        )
        // FloatingActionButton(
        //   onPressed: reset,
        //   child: Icon(
        //     Icons.restart_alt_rounded,
        //     size: 25,
        //   ),
        // )
      ],
    );
  }
}
