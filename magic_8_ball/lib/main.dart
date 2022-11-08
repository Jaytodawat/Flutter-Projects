import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BallPage(),
    ),
  );
}

class BallPage extends StatelessWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Ask Me Anything'),
      ),
      body: const Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballnumber = 1;
  void changeBall() {
    setState(() {
      int temp = Random().nextInt(5) + 1;
      while (temp == ballnumber) {
        temp = Random().nextInt(4) + 1;
      }
      ballnumber = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: TextButton(
          onPressed: () {
            changeBall();
          },
          child: Image.asset(
            'images/ball$ballnumber.png',
          ),
        ),
      ),
    );
  }
}
