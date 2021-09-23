import 'package:flutter/material.dart';
import 'package:quizzler/main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void _changeQuestion() => quizBrain.nextQuestion();

  void _addCheckMark(bool value) {
    _scoreKeeper.add(
      Icon(
        value ? Icons.check : Icons.close,
        color: value ? Colors.green : Colors.red,
      ),
    );
  }

  // void _addCheckMarkTrue() => _scoreKeeper.add(
  //       Icon(
  //         Icons.check,
  //         color: Colors.green,
  //       ),
  //     );

  // void _addCheckMarkFalse() => _scoreKeeper.add(
  //       Icon(
  //         Icons.close,
  //         color: Colors.red,
  //       ),
  //     );

  var _scoreKeeper = <Widget>[];

  void _checkAnswer(bool userPicktAnswer) {
    bool correctAnswer = quizBrain.QuestionAnswer;

    setState(() {
      if (quizBrain.isFinished()) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz',
        ).show();
        quizBrain.reset();
        _scoreKeeper = [];
      } else {
        _addCheckMark(userPicktAnswer == correctAnswer);
      }
      _changeQuestion();
    });
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
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () => _checkAnswer(true),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () => _checkAnswer(false),
            ),
          ),
        ),
        Wrap(children: _scoreKeeper)
      ],
    );
  }
}
