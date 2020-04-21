import 'package:flutter/material.dart';
import 'package:spider_chart/spider_chart.dart';
import '../state/game_state.dart';

import 'package:charts_flutter/flutter.dart' as charts;

class GameStateResult {
  final String category;
  final int numberCorrect;
  final charts.Color color;


  GameStateResult(this.category, this.numberCorrect, {this.color});
}

class ResultsBarChart extends StatefulWidget {
  final GameState state;
  ResultsBarChart({this.state});

  @override
  _ResultsBarChartState createState() => _ResultsBarChartState();
}

class _ResultsBarChartState extends State<ResultsBarChart> {
  @override
  Widget build(BuildContext context) {
    
    final testData = [
      new GameStateResult('Civics', widget.state.totalCivics.round(), color: charts.Color(r: 250, g: 128, b: 114)),
      new GameStateResult('Candidates', widget.state.totalCandidates.round(), color: charts.Color(r: 0, g: 255, b: 127)), //(0,255,127
      new GameStateResult('Policy', widget.state.totalPolicy.round(), color: charts.Color(r:2550, g: 69, b: 127)), // 255,69,0
    ];

    print(widget.state.civicsCorrect.round().toString());
    print( widget.state.candidatesCorrect.round().toString());
    print(widget.state.policyCorrect.round().toString());

    var series = [
      new charts.Series(
        id: 'Results',
        data: testData,
        domainFn: (GameStateResult stateResult, _) => stateResult.category,
        measureFn: (GameStateResult stateResult, _) =>
            stateResult.numberCorrect,
        colorFn: (GameStateResult stateResult, _) => stateResult.color
      )
    ];

    var chart = new charts.BarChart(series, animate: true);

    return Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );
  }
}

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
    double score = data[0] + data[1] + data[2];
    print("SCORE: " + score.toString());
    String informed;
    if (score > 10)
      informed = " informed.";
    else
      informed = " not informed";
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
          SizedBox(height: 10),
          Center(
            child: Container(
              child: ResultsBarChart(state: widget.state,),
            ),
          ),
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
