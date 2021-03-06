import 'dart:math';

class QuizBrain {

  var _quizAnswer = '';
  var _quiz = '';

  void makeQuiz() {
    List<String> _listOfSigns = ['+', '-', 'x', '÷'];
    Random _random = Random();
    var selectedSign = _listOfSigns[_random.nextInt(_listOfSigns.length)];
    var firstNumber = _random.nextInt(10) + 10; //from 10 upto 19
    var secondNumber = _random.nextInt(9) + 1; //from 1 upto 9 (9 included)
    var realResult;

    switch (selectedSign) {
      case '+':
        realResult = firstNumber + secondNumber;
        break;

      case '-':
        realResult = firstNumber - secondNumber;
        break;

      case 'x':
        realResult = firstNumber * secondNumber;
        break;

      case '÷':
        {
          if (firstNumber % secondNumber != 0) { //true
            if (firstNumber % 2 != 0) firstNumber++; // now first number is 18
            for (int i = secondNumber; i > 0; i--) { //i = 6
              if (firstNumber % i == 0) { //18 / 6 remainder 0
                secondNumber = i; // secondNumber now 6
                break;
              }
            }
          }
          realResult = firstNumber ~/ secondNumber; //result is  18/6 = 3
        }
    }

    var falseMaker = [-3, -2, -1, 1, 2, 3];
    var randomlyChosen = falseMaker[_random.nextInt(falseMaker.length)];
    //randomlyChosen = -3;

    //0 means make it false, 1 means true answer
    var trueOrFalseDecision = _random.nextInt(2);

    _quizAnswer = 'TRUE';
    if(trueOrFalseDecision == 0) {
      _quizAnswer = 'FALSE';
      realResult = realResult + randomlyChosen; //realResult = 3 + (-3) = 0
      if (realResult < 0) realResult = realResult + _random.nextInt(2) + 4;
      // for example first number = 17;
      //second number = 7
      //and sign is '/
    }

    _quiz = '$firstNumber $selectedSign $secondNumber = $realResult';
  }

  get quizAnswer => _quizAnswer;
  get quiz => _quiz;
}
