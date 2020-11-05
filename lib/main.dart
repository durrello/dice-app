import 'package:dice_app/styles.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(Dicee());
}

class Dicee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dicee',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: pimaryColor,
        ),
        body: Dice(),
        backgroundColor: secondaryColor,
      ),
    );
  }
}

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 4;
  int rightDice = 1;

  int leftDice2 = 4;
  int rightDice2 = 1;

  int player1 = 0;
  int player2 = 0;

  String uResult = '';

  @override
  Widget build(BuildContext context) {
    void generate() {
      setState(() {
        // player 1 dice roll
        leftDice = Random().nextInt(6) + 1;
        rightDice = Random().nextInt(6) + 1;

        player1 = leftDice + rightDice;

        print(player1);

        // print('$leftDice' + '$rightDice');

        // if (leftDice < rightDice) {
        //   print('Yes');
        // } else {
        //   print('No');
        // }
      });
    }

    
      void generate1() {
        setState(() {
          // player 1 dice roll
          leftDice2 = Random().nextInt(6) + 1;
          rightDice2 = Random().nextInt(6) + 1;

          player2 = leftDice2 + rightDice2;

          print(player2);

          if (player1 < player2) {
            //  Text('Player Below wins with $player2 over player above who has $player1');
            print('Player Below wins with $player2 over player above who has $player1');
          } else {
            print('Player Above wins with $player1 over player below who has $player2');
          }
        });
      }



      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Row(
              children: [
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      generate();
                    },
                    child: Image.asset('images/dice$leftDice.png'),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      generate();
                    },
                    child: Image.asset('images/dice$rightDice.png'),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: Center(
                child: Text('Player Below wins with $player2', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),

                ),
          ),
          Row(
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    generate1();
                  },
                  child: Image.asset('images/dice$leftDice2.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    generate1();
                  },
                  child: Image.asset('images/dice$rightDice2.png'),
                ),
              )
            ],
          ),
        ],
      );
    }
  }
