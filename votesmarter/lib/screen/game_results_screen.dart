import 'package:flutter/material.dart';
import 'package:spider_chart/spider_chart.dart';

class GameResultsScreen extends StatefulWidget {
  // DUMMY VALUES,
  final ticks = [5, 10, 15];
  final features = ["Civics", "Issues", "Candidates"];
  final data = [5.0, 7.0, 3.0];

  @override
  _GameResultsScreenState createState() => _GameResultsScreenState();
}

class _GameResultsScreenState extends State<GameResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Center(
              child: Text(
            'Game Results',
            style: Theme.of(context).textTheme.title,
          )),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              child: SpiderChart(
                labels: widget.features,
                data: widget.data, colors: <Color>[
                  Colors.red,
                  Colors.blue,
                  Colors.green,
                ], maxValue: 20
              ),
            ),
          ),
        ],
      ),
    );
  }
}
