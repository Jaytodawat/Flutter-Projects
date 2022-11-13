import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void reset() {
    quizBrain.reset();
    scorekeeper = [];
  }

  List<Icon> scorekeeper = [];

  showAlert() {
    return Alert(
        context: context,
        type: AlertType.success,
        title: 'Quiz is ended!',
        buttons: [
          DialogButton(
              child: const Text(
                'Restart',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                  reset();
                });
              })
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(quizBrain.getquestionnumber()),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: TextButton(
              onPressed: () {
                IconData icon =
                    quizBrain.getQuestionAnswer(quizBrain.getquestionnumber())
                        ? Icons.check
                        : Icons.close;
                Color c = (icon == Icons.check) ? Colors.green : Colors.red;
                if (quizBrain.getquestionnumber() !=
                    quizBrain.getLength() - 1) {
                  setState(() {
                    quizBrain.incquestion();
                    scorekeeper.add(
                      Icon(
                        icon,
                        color: c,
                      ),
                    );
                  });
                } else if (scorekeeper.length != quizBrain.getLength()) {
                  setState(() {
                    scorekeeper.add(
                      Icon(
                        icon,
                        color: c,
                      ),
                    );
                    showAlert();
                  });
                }

                //print('Hello');
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
              onPressed: () {
                IconData icon =
                    !quizBrain.getQuestionAnswer(quizBrain.getquestionnumber())
                        ? Icons.check
                        : Icons.close;
                Color c = (icon == Icons.check) ? Colors.green : Colors.red;
                if (quizBrain.getquestionnumber() !=
                    quizBrain.getLength() - 1) {
                  setState(() {
                    quizBrain.incquestion();
                    scorekeeper.add(
                      Icon(
                        icon,
                        color: c,
                      ),
                    );
                  });
                } else if (scorekeeper.length != quizBrain.getLength()) {
                  setState(() {
                    scorekeeper.add(
                      Icon(
                        icon,
                        color: c,
                      ),
                    );
                    showAlert();
                  });
                }
                //print('Hello');
              },
              child: const Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}

//TODO:To add message box when the icons over limit the size of row.
//TODO:To show overall result page after quiz over
