import 'question.dart';

class QuizBrain {
  int _numberOfQuestion = 0;

  final _questionBank = <Question>[
    Question(
      text: 'You can lead a cow down stairs but not up stairs.',
      answer: false,
    ),
    Question(
      text: 'Approximately one quarter of human bones are in the feet.',
      answer: true,
    ),
    Question(
      text: 'A slug\'s blood is green.',
      answer: true,
    ),
    Question(
      text: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
      answer: true,
    ),
    Question(
      text: 'It is illegal to pee in the Ocean in Portugal.',
      answer: true,
    ),
    Question(
      text:
          'No piece of square dry paper can be folded in half more than 7 times.',
      answer: false,
    ),
    Question(
      text:
          'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
      answer: true,
    ),
    Question(
      text:
          'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
      answer: false,
    ),
    Question(
      text:
          'The total surface area of two human lungs is approximately 70 square metres.',
      answer: true,
    ),
    Question(
      text: 'Google was originally called \"Backrub\".',
      answer: true,
    ),
    Question(
      text:
          'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
      answer: true,
    ),
    Question(
      text:
          'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
      answer: true,
    ),
  ];

  void nextQuestion() {
    if (_numberOfQuestion < _questionBank.length - 1) {
      _numberOfQuestion++;
    }
  }

  // String getQuestionText() => _questionBank[_numberOfQuestion].text;
  String get questionText => _questionBank[_numberOfQuestion].text;

  // bool getQuestionAnswer() => _questionBank[_numberOfQuestion].answer;
  bool get QuestionAnswer => _questionBank[_numberOfQuestion].answer;

  bool isFinished() => _numberOfQuestion >= _questionBank.length - 1;
  // if (_numberOfQuestion >= _questionBank.length - 1) {
  //   return true;
  // } else {
  //   return false;
  // }

  void reset() => _numberOfQuestion = -1;
}
