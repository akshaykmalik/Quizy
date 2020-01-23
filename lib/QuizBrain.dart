import 'questionBank.dart';

class QuizBrain {
  int _i = 0;
  bool flag = false;
  List<questionBank> _quesAns = [
    questionBank(q: 'Artery carry blood away from heart', a: true),
    questionBank(q: 'Gall bladder produces bile juice', a: false),
    questionBank(q: 'estrogen hormone is steroid', a: true),
    questionBank(
        q: 'In London, UK, if you happen to die in the House of Parliament,'
            'You are technically entitled to a state funeral, because the buildingis considered too sacred a place',
        a: true),
    questionBank(q: 'It is illegal to pee in the Ocean in Portugal', a: true),
    questionBank(
        q: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        a: false),
    questionBank(
        q: 'Surface area of two human lungs is approximately 70 square meter',
        a: true),
    questionBank(q: 'Google was originally called \"Backrub\".', a: true),
    questionBank(
        q: 'No piece of square dry paper can be folded in half more than 7 time.',
        a: false),
  ];
  String getQuestion() {
    return _quesAns[_i].ques;
  }

  bool getAnswer() {
    return _quesAns[_i].ans;
  }

  void nextQuestion() {
    if (_i < _quesAns.length - 1 && flag == false) {
      _i++;
    }
    if (_i == _quesAns.length - 1) flag = true;
  }

  bool complete() {
    return flag;
  }

  void reset() {
    _i = 0;
    flag = false;
  }
}
