import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(const StoryApp());
}

class StoryApp extends StatelessWidget {
  const StoryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

StoryBrain storybrain = StoryBrain();

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 12,
              child: Center(
                child: Text(
                  storybrain.getStory(),
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    storybrain.nextStory(1);
                  });
                },
                style: TextButton.styleFrom(backgroundColor: Colors.red),
                child: Text(
                  storybrain.getChoice1(),
                  style: const TextStyle(fontSize: 15.0, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              flex: 2,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    storybrain.nextStory(2);
                  });
                },
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
                child: Text(
                  storybrain.getChoice2(),
                  style: const TextStyle(fontSize: 15.0, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
