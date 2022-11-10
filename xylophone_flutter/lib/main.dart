import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const Xylophoneapp());
}

class Xylophoneapp extends StatelessWidget {
  const Xylophoneapp({Key? key}) : super(key: key);

  void playSound(int num) {
    final player = AudioPlayer();
    player.play(AssetSource('assets_note$num.wav'));
  }

  Expanded buildKey(int num, Color c) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(num);
        },
        style: TextButton.styleFrom(backgroundColor: c),
        child: const Text(
          ' ',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(1, Colors.red),
              buildKey(2, Colors.orangeAccent),
              buildKey(3, Colors.yellow),
              buildKey(4, Colors.green),
              buildKey(5, Colors.teal),
              buildKey(6, Colors.blueAccent),
              buildKey(7, Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
