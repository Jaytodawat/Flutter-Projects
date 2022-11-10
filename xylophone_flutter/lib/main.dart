import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const Xylophoneapp());
}

class Xylophoneapp extends StatelessWidget {
  const Xylophoneapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: TextButton(
              child: const Text('Click me'),
              onPressed: () {
                final player = AudioPlayer();
                player.play(AssetSource('assets_note1.wav'));
              },
            ),
          ),
        ),
      ),
    );
  }
}
