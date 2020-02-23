import 'dart:core';
import 'dart:math';
import '../model/question.dart';

class GameState {
  String _topic;

  final Map<String, List<Question>> questions = {
    "assets/img/civics.png": [
      new Question(
        question: "Civic Question",
        answers: ["1", "2", "3"],
        correctAnswer: "2",
        sourceURL: null,
        explanation: null,
        incorrectAnswers: ["1", "3"],
        type: "civics",
        categoryName: "civics",
      )
    ],
    "assets/img/policy.png": [
      new Question(
          question: "Policy Question",
          answers: ["1", "2", "3"],
          correctAnswer: "1",
          sourceURL: null,
          explanation: null,
          incorrectAnswers: ["2", "3"],
          type: "policy",
          categoryName: "policy")
    ],
    "assets/img/candidates.png": [
      new Question(
          question: "candidates Question",
          answers: ["1", "2", "3"],
          correctAnswer: "3",
          sourceURL: null,
          explanation: null,
          incorrectAnswers: ["1", "2"],
          type: "candidates",
          categoryName: "candidates")
    ],
  };
  final Random _random = Random();

  // We need to track the current round we are on
  int _currentGameRound;
  get currentGameRound => _currentGameRound;

  int _lives;
  get currentNumberOfLives => _lives;

  bool gameIsFinished() {
    return _lives == 0;
  }

  void decrementLives() {
    _lives--;
    print("LIVES REMAINING: " + _lives.toString());
  }

  void setTopic(String topic) {
    this._topic = topic;
  }

  double _numCivicsCorrect, _numCivicsTotal;
  double get calculateCivicsScore =>
      ((_numCivicsCorrect / _numCivicsTotal) * 100);
  double get totalCivics => _numCivicsTotal;

  double _numPolicyCorrect, _numPolicyTotal;
  double get calculatePolicyScore =>
      ((_numPolicyCorrect / _numPolicyTotal) * 100);
  double get totalPolicy => _numPolicyTotal;

  double _numCandidatesCorrect, _numCandidatesTotal;
  double get calculateCandidatesScore =>
      ((_numCandidatesCorrect / _numCandidatesTotal) * 100);
  double get totalCandidates => _numCivicsTotal;

  double get calculateTotalScore =>
      (calculatePolicyScore + calculateCivicsScore + calculateCandidatesScore);

  void incrementGameRound() {
    _currentGameRound++;
  }

  Question getQuestionByTopic() {
    Question proposedQuestion;
    if (this._topic == "assets/img/crown.png") {
      String randomCategory = ((questions.keys).toList())[_random.nextInt(3)];
      proposedQuestion = questions[randomCategory]
          .elementAt(_random.nextInt(questions[randomCategory].length));
    } else {
      proposedQuestion = questions[this._topic]
          .elementAt((_random.nextInt(questions[this._topic].length)));
    }
    //questions[this._topic].remove(proposedQuestion);
    if (this._topic == "assets/img/civics.png") {
      _numCivicsTotal++;
    } else if (this._topic == "assets/img/policy.png") {
      _numPolicyTotal++;
    } else if (this._topic == "assets/img/candidates.png") {
      _numCandidatesTotal++;
    }
    return proposedQuestion;
  }

  bool isUserCorrect(Question question, String userAnswer) {
    if (userAnswer == question.getCorrectAnswer()) {
      // Correct
      if (question.getQuestionType() == "civics") {
        _numCivicsCorrect++;
      } else if (question.getQuestionType() == "policy") {
        _numPolicyCorrect++;
      } else if (question.getQuestionType() == "candidates") {
        _numCandidatesCorrect++;
      }
      return true;
    } else {
      _lives--;
      return false;
    }
  }

  GameState() {
    _topic = "";
    _currentGameRound = 1;
    _lives = 5;
    _numCandidatesCorrect = 0;
    _numCandidatesTotal = 0;
    _numCivicsCorrect = 0;
    _numCivicsTotal = 0;
    _numPolicyCorrect = 0;
    _numPolicyTotal = 0;
  }
}
