class Question {
  String question;
  List<String> answers;
  String correctAnswer;
  List<String> incorrectAnswers;
  String sourceURL;
  String categoryName;
  String explanation;
  String type;
  String funFact;
  Question({
    this.question,
    this.answers,
    this.correctAnswer,
    this.sourceURL,
    this.explanation,
    this.incorrectAnswers,
    this.type,
    this.categoryName,
    this.funFact
  });
  String getQuestion() {
    return this.question;
  }

  String getCorrectAnswer() {
    return this.correctAnswer;
  }

  String getSourceURL() {
    return this.sourceURL;
  }

  String getQuestionType() {
    return this.type;
  }

  String getExplanation() {
    return this.explanation;
  }

}
