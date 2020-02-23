import 'package:flutter/material.dart';
import 'package:spider_chart/spider_chart.dart';
import '../state/game_state.dart';

class GameResultsScreen extends StatefulWidget {
  final GameState state;
  GameResultsScreen({this.state});

  final ticks = [1, 5, 10];
  final features = ["Civics", "Policy", "Candidates"];

  @override
  _GameResultsScreenState createState() => _GameResultsScreenState();
}

class _GameResultsScreenState extends State<GameResultsScreen> {
  @override
  Widget build(BuildContext context) {
    List<double> data = [
      (widget.state.totalCivics),
      (widget.state.totalPolicy),
      (widget.state.totalCandidates)
    ];
    double score = widget.state.calculateTotalScore;
    String informed;
    if (score > 150)
      informed = " informed.";
    else
      informed = " not informed.";
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10),
        child: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text(
            'Game Results',
            style: TextStyle(
              fontSize: 30,
            ),
          )),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              'Your final score was ' + score.round().toString(),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: Container(
              child: SpiderChart(
                  labels: widget.features,
                  data: data,
                  colors: <Color>[
                    Colors.red,
                    Colors.blue,
                    Colors.green,
                  ],
                  maxValue: 6),
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: Text(
              'You are' + informed,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 15),
          SizedBox(height: 15),
          Center(
            child: Text('You are 15% less informed than the average American'),
          ),
          Center(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.thumb_up),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.thumb_down),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
