class Question{
  String question;
  List<String> answers;
  int correctAnswerIndex;
  String sourceURL;
  String explanation;
  String type;
  Question({
      this.question,
      this.answers,
      this.correctAnswerIndex,
      this.sourceURL,
      this.explanation, 
      this.type,
      });

    String getQuestion()
    {
      return this.question;
    }
    String getCorrectAnswer()
    {
      return this.answers[this.correctAnswerIndex];
    }
    String getSourceURL()
    {
      return this.sourceURL;
    }
    String getQuestionType()
    {
      return this.type;
    }
    String getExplanation()
    {
      return this.explanation;
    }
}