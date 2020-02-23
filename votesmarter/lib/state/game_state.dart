import 'dart:core';
import 'dart:math';
import '../model/question.dart';

class GameState {
  String _topic;

  final Map<String, List<Question>> questions = {
    "assets/img/civics.png": [
      Question(
          question:
              "Can the president declare war without approval from Congress?",
          incorrectAnswers: ["Yes"],
          correctAnswer: "No",
          sourceURL: "https://www.law.cornell.edu/wex/executive_power",
          categoryName: "civics",
          explanation:
              "Congress holds the power to declare war. However, Presidents have sent troops to battle without an official war declaration.",
          funFact:
              "Congress holds the power to declare war. However, Presidents have sent troops to battle without an official war declaration."),
      Question(
          question:
              "Which of the following is the date of your districts next senatorial election?",
          incorrectAnswers: [
            "November 1st, 2020",
            "November 1st, 2022",
            "September 8th, 2022"
          ],
          correctAnswer: "September 8th, 2020",
          sourceURL: "https://ballotpedia.org/New_Hampshire%2",
          categoryName: "civics",
          explanation:
              "Senate elections occur every six years, unless a special election is required due to a senator retiring or being removed from office.",
          funFact:
              "Senate elections occur every six years, unless a special election is required due to a senator retiring or being removed from office."),
      Question(
          question:
              "Which branch of government would the supreme court be classified in?",
          incorrectAnswers: [
            "Executive Branch",
            "Legislative Branch",
            "The Gubernatorial Branch"
          ],
          correctAnswer: "Judicial Branch",
          sourceURL:
              "https://www.history.com/topics/us-government/judicial-branch",
          categoryName: "civics",
          explanation:
              "The judicial branch includes any type of governmental court, and is responsible for ensuring that the law is interpreted correctly.",
          funFact:
              "The Supreme court is the highest court, meaning it can overturn any other courts decision."),
      Question(
          question:
              "Which type of elected official is responsible for the enforcement and execution of the law?",
          incorrectAnswers: ["Senator", "Representative", "Judge"],
          correctAnswer: "President",
          sourceURL:
              "https://www.whitehouse.gov/about-the-white-house/the-executive-branch/",
          categoryName: "civics",
          explanation:
              "The President is the head of the executive branch, which is responsible for the execution and implementation of federal law.",
          funFact:
              "Franklin D. Roosevelt was the only president to ever serve more than 8 years in office."),
      Question(
          question: "What is a referendum?",
          incorrectAnswers: [
            "A meeting of party leaders or party members to select a parties candidates",
            "Any type of election is considered a referendum"
          ],
          correctAnswer:
              "A vote on a single political question, instead of a candidate",
          sourceURL: "https://en.wikipedia.org/wiki/Referendum",
          categoryName: "civics",
          explanation:
              "A referendum allows for citizens to effect direct policy changes without relying on their elected representatives",
          funFact:
              "Fun Fact: Through a referendum, Colorado enacted Amendment 64 legalizing the sale and possession of recreational marijuana"),
      Question(
          question:
              "Which branch of government is responsible for approving the national budget and appropriating federal funds?",
          incorrectAnswers: [
            "Gubernatorial Branch",
            "Executive Branch",
            "Judicial Branch"
          ],
          correctAnswer: "Legislative Branch",
          sourceURL:
              "https://www2.ed.gov/about/overview/budget/process.html?src=ct",
          categoryName: "civics",
          explanation:
              "The Legislative Branch, made up of the Senate and House of Representatives, approves federal funding along with passing legislation.",
          funFact:
              "Nearly two-thirds of annual federal spending is automatically re-approved and doesn't require an annual vote by Congress."),
    ],
    "assets/img/policy.png": [
      Question(
          question:
              "Which of the following issues causes the most deaths in America Today?",
          incorrectAnswers: ["Gun Violence", "Terrorism ", "Car Accidents"],
          correctAnswer: "Diabetes",
          sourceURL:
              "https://www.cdc.gov/nchs/fastats/leading-causes-of-death.html",
          categoryName: "policy",
          explanation: "Diabetes is the 7th largest cause of death in America",
          funFact: "Diabetes is the 7th largest cause of death in America"),
      Question(
          question:
              "Which of these countries does NOT have official bilateral relations (is not allied) with the United States?",
          incorrectAnswers: ["China", "France", "Nigeria"],
          correctAnswer: "Bhutan",
          sourceURL:
              "https://en.wikipedia.org/wiki/Foreign_relations_of_the_United_States",
          categoryName: "policy",
          explanation:
              "There are only Five UN countries that do not have official relations with the US, including: Bhutan, Iran, North Korea and Syria and the UN observer State of Palestine",
          funFact:
              "There are only Five UN countries that do not have official relations with the US, including: Bhutan, Iran, North Korea and Syria and the UN observer State of Palestine"),
      Question(
          question:
              "Which country pays the most for the anti-cancer drug, Avastin?",
          incorrectAnswers: ["United Kingdom", "China", "Japan"],
          correctAnswer: "United States",
          sourceURL:
              "https://www.theguardian.com/society/2018/sep/21/nhs-beats-drug-companies-in-100m-avastin-battle-wet-macular-degeneration",
          categoryName: "policy",
          explanation:
              "Avastin in the United States costs 10 time more than Avastin in the United Kingdom",
          funFact:
              "Avastin in the United States costs 10 time more than Avastin in the United Kingdom"),
      Question(
          question:
              "What did the “Defense of Marriage Act” prevent the federal government from doing?",
          incorrectAnswers: [
            "Recognize any marriages between humans and animals",
            "Recognize any marriages between transgender couples"
          ],
          correctAnswer:
              "Recognize any marriages between same sex couples",
          sourceURL: "https://www.glaad.org/marriage/doma",
          categoryName: "policy",
          explanation:
              "The Defense of Marriage Act was passed in 1996 by Congress and signed into law by President Bill Clinton",
          funFact:
              "The Defense of Marriage Act was passed in 1996 by Congress and signed into law by President Bill Clinton"),
      Question(
          question:
              "What did the “Voting Rights Act of 1965” suspend the use of?",
          incorrectAnswers: [
            "Monitored voting",
            "Weighted polling",
            "Knowledge tests"
          ],
          correctAnswer: "Literacy tests",
          sourceURL:
              "https://history.house.gov/Exhibitions-and-Publications/HAIC/Historical-Data/Constitutional-Amendments,-Treaties,-and-Major-Acts/",
          categoryName: "policy",
          explanation:
              "Literacy tests required voters to prove their literacy before being allowed to vote. In practice, these tests were designed to disenfranchise racial minorities",
          funFact:
              "Literacy tests required voters to prove their literacy before being allowed to vote. In practice, these tests were designed to disenfranchise racial minorities"),
      Question(
          question:
              "What is the leading cause of discretionary spending by the federal government?",
          incorrectAnswers: ["Education", "Transportation", "Income security"],
          correctAnswer: "Defense",
          sourceURL:
              "https://www.pgpf.org/chart-archive/0070_discretionary_spending_categories",
          categoryName: "policy",
          explanation:
              "45% of the discretionary spending budget is spent on Defense",
          funFact:
              "45% of the discretionary spending budget is spent on Defense"),
    ],
    "assets/img/candidates.png": [
      Question(
          question:
              "Does Tom Steyer generally support pro-choice or pro-life legislation?",
          incorrectAnswers: ["Pro-Life", "No stance"],
          correctAnswer: "Pro-Choice",
          sourceURL:
              "https://votesmart.org/galaxy/?utm_source=header&utm_medium=galaxy%20button&utm_campaign=galaxy#/Tom-Steyer-186788/Abortion-2/positions",
          categoryName: "candidates",
          explanation:
              "Tom Steyer vowed that his NextGen America group would not 'work for a single candidate who is not pro-choice'",
          funFact:
              "Tom Steyer vowed that his NextGen America group would not 'work for a single candidate who is not pro-choice'"),
      Question(
          question:
              "Does Donald Trump generally support pro-choice or pro-life legislation?",
          incorrectAnswers: ["Pro-Choice", "No stance"],
          correctAnswer: "Pro-Life",
          sourceURL:
              "https://www.ontheissues.org/Celeb/Donald_Trump_Abortion.htm",
          categoryName: "candidates",
          explanation:
              "Donald Trump stated \'The abortion aspect of Planned Parenthood should not--absolutely should not--be funded\'",
          funFact:
              "Donald Trump stated 'The abortion aspect of Planned Parenthood should not--absolutely should not--be funded'"),
      Question(
          question: "Which of these are New Hampshire's two current senators?",
          incorrectAnswers: [
            "Maggie Hassan and Julie White",
            "Jeanne Shaheen and Chris Pappas",
            "Chris Sununu and Jared Brooks"
          ],
          correctAnswer: "Maggie Hassan, Jeanne Shaheen",
          sourceURL:
              "https://www.senate.gov/general/contact_information/senators_cfm.cfm?State=NH",
          categoryName: "candidates",
          explanation:
              "Jeanne Shaheen and Maggie Hassan were elected in 2008 and 2016 respectively",
          funFact:
              "Jeanne Shaheen and Maggie Hassan were elected in 2008 and 2016 respectively"),
      Question(
          question:
              "Which of the following is your district's incumbent representative?",
          incorrectAnswers: ["William Fowler", "Marry Cooper", "Jeane Shaheen"],
          correctAnswer: "Chris Pappas",
          sourceURL: "https://ballotpedia.org/Chris_Pappas",
          categoryName: "candidates",
          explanation:
              "Chris Pappas was elected to the district 1 senate seat on November 6, 2019",
          funFact:
              "Chris Pappas was elected to the district 1 senate seat on November 6, 2019"),
    ],
  };
  final Random _random = Random();


  // We need to track the current round we are on
  int _currentGameRound;
  get currentGameRound => _currentGameRound;

  int _lives;
  get currentNumberOfLives => _lives;

  bool done;

  bool gameIsFinished() {
    return _lives == 0 || done;
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
    done = false;
    _topic = "";
    _currentGameRound = 1;
    _lives = 3;
    _numCandidatesCorrect = 1;
    _numCandidatesTotal = 1;
    _numCivicsCorrect = 1;
    _numCivicsTotal = 1;
    _numPolicyCorrect = 1;
    _numPolicyTotal = 1;
  }
  GameState.fromState(GameState state) {
    _topic = state._topic;
    _currentGameRound = state._currentGameRound;
    _lives = state._lives;
    _numCandidatesCorrect = state._numCandidatesCorrect;
    _numCandidatesTotal = state._numCandidatesTotal;
    _numCivicsCorrect = state._numCivicsCorrect;
    _numCivicsTotal = state._numCivicsTotal;
    _numPolicyCorrect = state._numPolicyCorrect;
    _numPolicyTotal = state._numPolicyTotal;
  }
}
