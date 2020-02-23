import 'package:flutter/material.dart';
import 'package:votesmarter/model/question.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:flip_card/flip_card.dart';
import 'package:votesmarter/state/game_state.dart';

class QuizPage extends StatefulWidget {
  final GameState state;
  final Color backgroundColor;
  QuizPage({Key key, @required this.state, this.backgroundColor})
      : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;
  String currentAnswer;
  final Map<int, dynamic> _answers = {};
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool _disableBtn = false;
  bool _correct = false;
  Question question;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    question = widget.state.getQuestionByTopic();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle _questionStyle = TextStyle(
        fontSize: 30.0, fontWeight: FontWeight.w500, color: Colors.black);
    final List<dynamic> options = question.incorrectAnswers;
    if (!options.contains(question.correctAnswer)) {
      options.add(question.correctAnswer);
      options.shuffle();
    }

    return Scaffold(
       resizeToAvoidBottomPadding: false,
      key: _key,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: widget.backgroundColor,

        title: Text(question.categoryName.toString().toUpperCase()),
        

        actions: <Widget>[
          Center(
              child: GestureDetector(
            onTap: () {
              widget.state.decrementLives();
              Navigator.pop(context);
            },
            child: Text(
              "Pop",
              style: TextStyle(fontSize: 20),
            ),
          ))
        ],

        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(color: widget.backgroundColor),
              height: 380,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                FlipCard(
                  direction: FlipDirection.VERTICAL,
                  key: cardKey,
                  flipOnTouch: false,
                  front: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100.0, bottom: 100.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              HtmlUnescape().convert(question.getQuestion()),
                              softWrap: true,
                              style: _questionStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  back: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 100.0, bottom: 100.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          !_correct ? Expanded(
                            child: Text(
                             question.explanation,
                              softWrap: true,
                              style: _questionStyle,
                              textAlign: TextAlign.center,
                            ),
                          ) : Expanded(
                            child: Text(
                             question.funFact,
                              softWrap: true,
                              style: _questionStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ...options.map(
                      (option) => Column(
                        children: <Widget>[
                          ButtonTheme(
                            minWidth: 350,
                            height: 50,
                            buttonColor: Colors.white,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                              ),
                              child: Text(
                                HtmlUnescape().convert("$option"),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              color: currentAnswer == null
                                  ? null
                                  : option != currentAnswer
                                      ? null
                                      : currentAnswer ==
                                              question.getCorrectAnswer()
                                          ? Colors.green
                                          : Colors.red,
                              onPressed: () {
                                if (!_disableBtn) {
                                  //if user is not correct
                                  print("answer: " + option.toString());
                                  if (!widget.state
                                      .isUserCorrect(question, option)) {
                                        print("not correct");
                                    setState(() {
                                     
                                      currentAnswer = option;
                                      cardKey.currentState.toggleCard();
                                      _answers[_currentIndex] = option;
                                      _correct = false;
                                       _disableBtn = true;
                                    });
                                  }else{
                                    print("correct");
                                    setState(() {
                                      currentAnswer = option;
                                    _correct = true;
                                    
                                    cardKey.currentState.toggleCard();
                                      _answers[_currentIndex] = option;
                                      _disableBtn = true;
                                    });
                                  }
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    (_disableBtn && _correct)
                        ? Padding(
                            padding: const EdgeInsets.only(left: 100,right: 100),
                            child: ButtonTheme(
                              minWidth: 10,
                              height: 50,
                              buttonColor: Colors.white,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                ),
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                ),
                                color: widget.backgroundColor,
                                onPressed: () {
                                  GameState savedState = widget.state;
                                  setState(() {
                                    _currentIndex++;
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => QuizPage(
                                                  state: widget.state,backgroundColor: widget.backgroundColor,
                                                )));
                                  });
                                },
                              ),
                            ),
                          )
                        : (!_correct && _disableBtn) ? Padding(
                            padding: const EdgeInsets.only(left:100, right: 100),
                            child: ButtonTheme(
                              minWidth: 10,
                              height: 50,
                              buttonColor: Colors.white,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                ),
                                child: Text(
                                  "Spin Again",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                ),
                                color: widget.backgroundColor,
                                onPressed: () {
                                  GameState savedState = widget.state;
                                 Navigator.pop(context);
                                },
                              ),
                            ),
                          ):Container(),

                    // RadioListTile(

                    //   title: Text(HtmlUnescape().convert("$option")),
                    //   groupValue: _answers[_currentIndex],
                    //   value: option,

                    //   onChanged: (value){
                    //     setState(() {
                    //       _answers[_currentIndex] = option;
                    //     });
                    //   },
                    // )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _nextSubmit() {
    if (_answers[_currentIndex] == null) {
      _key.currentState.showSnackBar(SnackBar(
        content: Text("You must select an answer to continue."),
      ));
      return;
    }
    //   if (_currentIndex < (widget.questions.length - 1)) {
    //     setState(() {
    //       _currentIndex++;
    //     });
    //   } else {
    //     Navigator.of(context)
    //         .pushReplacement(MaterialPageRoute(builder: (_) => null));
    //   }
    // }

    Future<bool> _onWillPop() async {
      return showDialog<bool>(
          context: context,
          builder: (_) {
            return AlertDialog(
              content: Text(
                  "Are you sure you want to quit the quiz? All your progress will be lost."),
              title: Text("Warning!"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Yes"),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                ),
                FlatButton(
                  child: Text("No"),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                ),
              ],
            );
          });
    }
  }
}
