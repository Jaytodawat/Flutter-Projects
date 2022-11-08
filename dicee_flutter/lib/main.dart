import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          title: const Text('Dice'),
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftbutton = 2;
  int rightbutton = 1;

  void changeFace() {
    setState(() {
      int temp1 = Random().nextInt(6) + 1;
      int temp2 = Random().nextInt(6) + 1;
      while (temp1 == rightbutton || temp2 == leftbutton) {
        if (temp1 == rightbutton) {
          temp1 = Random().nextInt(6) + 1;
        }
        if (temp2 == leftbutton) {
          temp2 = Random().nextInt(6) + 1;
        }
      }
      rightbutton = temp1;
      leftbutton = temp2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            //flex: 2,

            child: TextButton(
              onPressed: () {
                changeFace();
              },
              child: Image.asset('images/dice$leftbutton.png'),
            ),
          ),
          Expanded(
            //flex: 1,
            child: TextButton(
              onPressed: () {
                changeFace();
              },
              child: Image.asset('images/dice$rightbutton.png'),
            ),
          ),
        ],
      ),
    );
  }
}
